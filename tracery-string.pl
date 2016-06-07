#!/usr/bin/env perl
open WORDS, "<words" or die "can't read words file";
@words = <WORDS>;
chomp @words;

open GRAPHTXT, "<graph.txt" or die "can't read graph.txt";
while (<GRAPHTXT>) {
	chomp;
	my($n,$h) = split(/ /,$_);
	#print $n
	#print $h
	print "\"[n:$n][h:$h]\","
}
