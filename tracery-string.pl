#!/usr/bin/env perl
open WORDS, "<words" or die "can't read words file";
@words = <WORDS>;
chomp @words;

open GRAPHTXT, "<graph.txt" or die "can't read graph.txt";
print <<END_INTRO;
{
	"origin":["#[#nh#]putting#"],
	"putting":["#hifreq#","#hifreq#","#hifreq#","#lofreq#"],
	"hifreq":["Putting the #n# #backin# #h#"],
	"lofreq":["#[#pron#]theyput#","#[#pron#]theyput#","#[#pron#]theyput#","#[#pron#]theyput#","You! You put the #n# #backin# #h#. 😉👉"],
	"theyput":["#they.capitalize# #put# the #n# #backin# #h#"],
	"pron":["[they:they][put:put]","[they:he][put:puts]","[they:she][put:puts]","[they:we][put:put]"],
	"backin":["back in", "back in", "in", "in", "back into"],
END_INTRO
print "	\"nh\":[";
my $comma = 0;
while (<GRAPHTXT>) {
	chomp;
	my($n,$h) = split(/ /,$_);
	#print $n
	#print $h
	if ($comma) { print ','; }
	print "\"[n:$n][h:$h]\"";
	$comma = 1;
}
print "]\n}\n";

