#!/usr/bin/env perl
use List::Util qw(shuffle);
use List::MoreUtils qw(indexes);
open WORDS, "<words";
@words = <WORDS>;
chomp @words;
@words = grep { length $_ >= 4 or $_ eq 'bi' } @words;
@words = map {lc} @words;

open GRAPHCSV, ">graph.csv" or die "can't write to graph.csv";
## draw needle words in random order so I can quit partway through w/o bias
@is = 0..$#words;
@deck = shuffle(0..$#words);
#print @is[0..10], "\n";
print @deck[0..10], "\n";
foreach $n (@deck) {
	$needle = $words[$n];
	#print "$needle\n";
	$nyes = qr{$needle};
	$nm1 = substr($needle,0,-1);
	$nno = qr{^(un|dis|in|im|en|em|e|an|anti|counter|co|contra|pre|post|re|de|non|a|bi|tri|poly|multi|uni|trans|auto|self|extra|ultra|)($needle|$nm1)([a-z]|)(ate|at|ion|ible|ibil|able|abil|ity|iti|ant|ance|en|ent|enn|al|ful|l|ical|ic|ous|ish|ive|ary|ari|ness|th|ship|ese|lese|ist|ize|iz|ism|sm|ian|an|ent|ence|ency|enci|s|es|d|ed|eds|ing|ings|r|er|ers|or|ors|ess|esses|est|ests|ly|ably|ablies|ish|y|ey|ic|ics|man|men|women|women)*$};
	## allow: -less, pro-, con-, di-, mis-
	@hs = indexes { $_ =~ $nyes && $_ !~ $nno } @words;
	foreach $h (@hs) {
		$haystack = $words[$h];
		print "$needle $haystack\n";
		print GRAPHCSV "$n,$h\n";
	}
}
