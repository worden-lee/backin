#!/usr/bin/env perl
use List::Util qw(shuffle);
use List::MoreUtils qw(indexes);
open WORDS, "<words";
@words = <WORDS>;
chomp @words;
@words = map {lc} @words;

open GRAPHCSV, ">graph.csv" or die "can't write to graph.csv";
## draw needle words in random order so I can quit partway through w/o bias
@is = 0..$#words;
@deck = shuffle(0..$#words);
#print @is[0..10], "\n";
#print @deck[0..10], "\n";
foreach $n (@deck[0..10000]) {
	$needle = $words[$n];
	#print "$needle\n";
	$nyes = qr{$needle};
	$nm1 = substr($needle,0,-1);
	$nno = qr{^(un|dis|in|im|ir|en|em|ex|e|an|anti|counter|co|contra|pre|post|re|de|non|a|bi|tri|poly|multi|kilo|mega|mini|micro|nano|uni|trans|auto|self|extra|ultra|super|sub|mc|o'|)($needle|$nm1)([a-z]|)(ate|at|ion|ible|ibil|able|abil|ity|iti|ant|ance|en|ent|enn|al|ful|l|ical|ic|ous|ish|ive|ary|ari|ness|th|ship|ese|lese|ist|ize|iz|ism|sm|ian|an|ent|ence|ency|enci|s|es|d|ed|eds|ing|ings|r|er|ers|or|ors|ess|esses|est|ests|ly|ably|ablies|ish|y|ey|ic|ics|man|men|women|women|n't)*$};
	## allow: -less, pro-, con-, di-, mis-, various things I haven't thought of
	@hs = indexes { $_ =~ $nyes && $_ !~ $nno } @words;
	foreach $h (@hs) {
		$haystack = $words[$h];
		print "$needle $haystack\n";
		print GRAPHCSV "$n,$h\n";
	}
}
