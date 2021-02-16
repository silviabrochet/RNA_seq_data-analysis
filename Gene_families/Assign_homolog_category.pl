####################################################
# Program assigns gene families into three categories, strain-specific, accessory, core
# Input: gene family file in OrthoMCL style for four genomes F183, F184, F185, and F186
# Output: gene family file including a new column about the assigned category
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
 1. Gene family file, OrthoMCL format\n\n";

# the arguments from the command line will be stored in the following variables, all input is stored in @ARGV 
$orthomcl = shift(@ARGV) or die ($usage);
 
$orthomcl =~ /(\S+)\.\S+/;
my $name = $1; 	

open(ORTHOMCL,'<'.$orthomcl);

open(OUTPUT,'>'.$name.'_categories.txt');
    	
while (<ORTHOMCL>){
		
	my $line = $_;
	chomp $line;
	$line =~ /^(\S+)\t(.+)/;
	my $genefamily_name = $1;
	my $homologs = $2;
	if ($homologs =~ /F183/ && $homologs =~ /F184/ && $homologs =~ /F185/ && $homologs =~ /F186/)
		{
		print  OUTPUT $genefamily_name,"\t","core\t",$homologs,"\n";
		}
	elsif ($homologs =~ /F183/ && $homologs !~ /F184/ && $homologs !~ /F185/ && $homologs !~ /F186/)
		{
		print  OUTPUT $genefamily_name,"\t","strain-specific\t",$homologs,"\n";
		}
	elsif ($homologs !~ /F183/ && $homologs =~ /F184/ && $homologs !~ /F185/ && $homologs !~ /F186/)
		{
		print  OUTPUT $genefamily_name,"\t","strain-specific\t",$homologs,"\n";
		}
	elsif ($homologs !~ /F183/ && $homologs !~ /F184/ && $homologs =~ /F185/ && $homologs !~ /F186/)
		{
		print  OUTPUT $genefamily_name,"\t","strain-specific\t",$homologs,"\n";
		}
	elsif ($homologs !~ /F183/ && $homologs !~ /F184/ && $homologs !~ /F185/ && $homologs =~ /F186/)
		{
		print  OUTPUT $genefamily_name,"\t","strain-specific\t",$homologs,"\n";
		}
	else
		{
		print  OUTPUT $genefamily_name,"\t","accessory\t",$homologs,"\n";
		}			
	}
	
close OUTPUT;
close ORTHOMCL;