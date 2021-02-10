#! /usr/bin/perl -w
use List::Util qw( min max );

#This script is used to filter a sam-file according to alignment length only (alignment length > 100)

open (FILE, $ARGV[0]) or
  die "Can't open $ARGV[0]: $!";

my @match_numbers;
while(<FILE>) {
    chomp;
    my @split = split(" ",$_);
    if (/^\@/) {
	print $_,"\n";
    }
    else {
	my $cigar = $split[5];
	my @matches = ($cigar =~ m/([0-9]+M)/g);
	my $nb_matches = @matches;	
	if ($nb_matches > 0) {
	    foreach my $match(@matches) {
		push @match_numbers, substr $match,0,-1;
	    }
	    my $max = max @match_numbers;
	    if ($max > 100) {
		print $_,"\n";
	    }
	}
	@match_numbers = ();
    }
}
