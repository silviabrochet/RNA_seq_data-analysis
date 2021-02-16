####################################################
# Program counts how many gene families are specific or shared between different strains
####################################################


use warnings;
use strict;

##############
# define all variables, only necessary when using 'use strict'
my $usage; # variable to store usage info
my $orthomcl; # variable to store orhtomcl input file
my $list;
my $include = 'no';
my $count = 0;
my $count_minus = 0;
my $count_plus = 0;
my %genefam_hash;
my %genefam_type;
my %geneexpr_hash;
my @strain_list;
my @line_array;
##############
# this part is for the the input data

# if not sufficient parameters are provided in commandline, the following will be written to the command line
$usage = "\nInsufficient command line arguments provided.
\nUSAGE: $0 \n\n
 1. Lists of diff reg gene sets, one file per genome and comparison";

# the arguments from the command line will be stored in the following variables, all input is stored in @ARGV 
$list = shift(@ARGV) or die ($usage);


open(FILELIST,'<'.$list);
while (<FILELIST>)
		{
		chomp $_;
		my $strain = $_;
		push @strain_list, $strain;
		print "\n",$strain,"\n";
		
		open(FILE,'<ind_PE_G_'.$strain.'_Locus_tags_GeneFamilyInfo.txt');
		while (<FILE>)
			{
			my $line = $_;
			chomp $line;
			@line_array = split('\t', $line);
			my $locus_tag_expression = $line_array[0]."\t".$line_array[1];
			if (exists $genefam_hash{$line_array[2]}{$strain})
			{
			$genefam_hash{$line_array[2]}{$strain} .= " ".$line_array[0];
			}else{
				$genefam_hash{$line_array[2]}{$strain} = $line_array[0];
				}
			if (exists $geneexpr_hash{$line_array[2]}{$strain})
			{
				$geneexpr_hash{$line_array[2]}{$strain} .= " ".$line_array[1];
			}else{
				$geneexpr_hash{$line_array[2]}{$strain} = $line_array[1];
				}
			$genefam_type{$line_array[2]} = $line_array[3];
			}
		close FILE;
		
		}
		
close FILELIST;

open(OUTPUT,'>GeneFamilies_diff_regulated.txt');

print OUTPUT "Gene family";

sort { $a <=> $b } @strain_list;

foreach  my $strain (@strain_list)
		{
		print OUTPUT "\t",$strain,"_locus_tag\t",$strain,"_2logFoldChange";
		}

print OUTPUT "\t", "Category";

print OUTPUT "\t", "DiffRef>1strain", "\t", "DiffRef>1strain (corrected)",  "\n";

foreach my $genefam (keys %genefam_hash) {
	
	print OUTPUT $genefam;
	
	foreach  my $strain (@strain_list)
		{
		
			if (exists $genefam_hash{$genefam}{$strain})
			{
			print OUTPUT "\t", $genefam_hash{$genefam}{$strain};
			print OUTPUT "\t", $geneexpr_hash{$genefam}{$strain};
			$count++;
#			if (($geneexpr_hash{$genefam}{$strain} =~ /\s/)
#				{
					my @fold_array = split(/\s/, $geneexpr_hash{$genefam}{$strain});
					foreach (@fold_array)
					{
						$count_minus++ if $_ < 0;
						$count_plus++ if $_ > 0;
						}
				#	}
					#else{
					
						
			}else{
			print OUTPUT "\tno\tno";
			}
		}
	
	print OUTPUT "\t", $genefam_type{$genefam};
	
	if ($count > 1)
	{
 	print OUTPUT "\tyes";
 	if ($count_minus == 1 && $count_plus == 1)
		{
 		print OUTPUT "\tno\n";
		}else{
		print OUTPUT "\tyes\n",
		}
 	
	}else{
	print OUTPUT "\tno\tno\n";
	}

	
	$count = 0;
	$count_minus = 0;
	$count_plus = 0;
	
	}

close OUTPUT
