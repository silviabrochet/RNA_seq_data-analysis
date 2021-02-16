####################################################
# Program assigns gene families to differentially regulated gene sets
# Input: gene family file in OrthoMCL style and list of diff regulated gene
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
my %genefam_hash;
my %check_hash;

##############
# this part is for the the input data

# if not sufficient parameters are provided in commandline, the following will be written to the command line
$usage = "\nInsufficient command line arguments provided.
\nUSAGE: $0 \n\n
 1. Gene family file, OrthoMCL format
 2. List of diff reg genes";

# the arguments from the command line will be stored in the following variables, all input is stored in @ARGV 
$orthomcl = shift(@ARGV) or die ($usage);
$list = shift(@ARGV) or die ($usage);


open(READFILE,'<'.$orthomcl);
while (<READFILE>){
		my $line = $_;
		chomp $line;
		$line =~ /^(\S+\t\S+)\t(.+)/;
		my $genefamily = $1;
		my @line_array = split('\t', $2);
		foreach  my $homolog (@line_array)
		{	
			$homolog =~ /\S+\|(\S+)/;
    		$genefam_hash{$1} = $genefamily;
    		}
		}
		
close READFILE;

$list =~ /(\S+)\.\S+/;
my $name = $1; 	

open(OUTPUT,'>'.$name.'_GeneFamilyInfo.txt');


open(LIST,'<'.$list);
while (<LIST>){
		my $line = $_;
		chomp $line;
		my @line_array2 = split('\t', $line);
		print OUTPUT $line,"\t",$genefam_hash{$line_array2[0]},"\n"
		}
		
close LIST;
close OUTPUT;
