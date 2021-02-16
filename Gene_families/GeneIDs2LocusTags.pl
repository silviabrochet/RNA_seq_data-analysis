####################################################
# Program replaces IMG_Ids_with locus_tags
# Input: gene family file in OrthoMCL style and table with first column IMG_Ids and second column locus_tags
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
 2. List of IMG_Ids_to locus_tags";

# the arguments from the command line will be stored in the following variables, all input is stored in @ARGV 
$orthomcl = shift(@ARGV) or die ($usage);
$list = shift(@ARGV) or die ($usage);


open(READFILE,'<'.$list);
while (<READFILE>){
		my $line = $_;
		chomp $line;
		$line =~ /^(\S+)\t(\S+)/;
		$strain_hash{$1} = $2;
		}
		
close READFILE;
 
$orthomcl =~ /(\S+)\.\S+/;
my $name = $1; 	

open(ORTHOMCL,'<'.$orthomcl);

open(OUTPUT,'>'.$name.'_locus_tags.txt');
    	
while (<ORTHOMCL>){
		
	my $line = $_;
	chomp $line;
	$line =~ /^(\S+\t\S+)\t(.+)/;
	my $genefamily_name = $1;
	my $homologs = $2;
	print OUTPUT $genefamily_name;
	my @line_array = split('\t', $homologs);
	foreach  my $genefamily (@line_array)
		{	
			$genefamily =~ /(\S+)\|(\S+)/;
    		if (exists $strain_hash{$2}){
    			print OUTPUT "\t",$1,"|",$strain_hash{$2};
    		}else{ 
    			print "WARNING: IMG_ID not found\n";
    			}
    	}
    print OUTPUT "\n";

}
			
close OUTPUT;
close ORTHOMCL;