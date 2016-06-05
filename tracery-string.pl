#!/usr/bin/env perl
open WORDS, "<words" or die "can't read words file";
@words = <WORDS>;
chomp @words;
@words = grep { length $_ >= 4 or $_ eq 'bi' } @words;
@words = map {lc} @words;

open GRAPHCSV, "<graph.csv" or die "can't read graph.csv";
while (<GRAPHCSV>) {
	my($n,$h) = split(/,/,$_);
	#print $n
	#print $h
	print "\"[n:$words[$n]][h:$words[$h]]\","
}
