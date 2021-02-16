####################################################
# Program writes out the homologs of each gene family belonging to a given group
# Input: gene family file in OrthoMCL style, list of genomes for which homologs should be retained
# Output: gene family file with specific homologs of a given Gene family
# Note: Input OrthoMCL file should contain only gene families that contain at least one homolog in the subset of genomes of interest
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
my %strain_hash;
my %check_hash;

##############
# this part is for the the input data

# if not sufficient parameters are provided in commandline, the following will be written to the command line
$usage = "\nInsufficient command line arguments provided.
\nUSAGE: $0 \n\n
 1. Gene family file, OrthoMCL format
 2. List of genomes for which specific pan genes should be identified";

# the arguments from the command line will be stored in the following variables, all input is stored in @ARGV 
$orthomcl = shift(@ARGV) or die ($usage);
$list = shift(@ARGV) or die ($usage);


open(READFILE,'<'.$list);
while (<READFILE>){
		my $line = $_;
		chomp $line;
		$line =~ /^(.+)$/;
	print $1,"\n";
		$strain_hash{$1} = $1;
		}
		
close READFILE;
 
$orthomcl =~ /(\S+)\.\S+/;
my $name = $1; 	

open(ORTHOMCL,'<'.$orthomcl);

open(OUTPUT,'>'.$name.'_RNAseq_genomes.txt');
    	
while (<ORTHOMCL>){
		
	my $line = $_;
	chomp $line;
	$line =~ /^(\S+)\t(.+)/;
	print OUTPUT $1;
	
	my @line_array = split('\t', $2);
	foreach  my $genefamily (@line_array)
		{	
			$genefamily =~ /(\S+)\|\S+/;
    		if (exists $strain_hash{$1}){
    			print OUTPUT "\t",$genefamily;
    			$count++;
    		}
    	}
	
	if ($count == 0){
		print OUTPUT "Warning: Gene family does not contain any homolog in the selected genomes"
		}
		
	print OUTPUT "\n";
	$count = 0;

}
			
close OUTPUT;
close ORTHOMCL;