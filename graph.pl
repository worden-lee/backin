#!/usr/bin/env perl
use List::Util qw(shuffle);
use List::MoreUtils qw(indexes);
open WORDS, "<words";
@words = <WORDS>;
chomp @words;
@lcwords = map {lc} @words;

#open GRAPHCSV, ">graph.csv" or die "can't write to graph.csv";
open GRAPHTXT, ">graph.txt" or die "can't write to graph.txt";
## draw needle words in random order so I can quit partway through w/o bias
#my @is = 0..$#words;
#my @deck = shuffle(0..$#words);
my $trials = 1000;
#my $samples = 10000;
for( my $i = 0; $i < $trials; ) {
#foreach $n (@deck[0..$trials]) {
	#my $n = $deck[$i];
	my $n = int(rand($#words));
	my $lcneedle = $lcwords[$n];
	#print "$i $lcneedle\n";
	my $nyes = qr{$lcneedle};
	my $nm1 = substr($lcneedle,0,-1);
	my $nno = qr{^(un|dis|in|im|ir|en|em|ex|e|an|anti|counter|co|contra|pre|post|re|de|non|a|bi|tri|poly|multi|kilo|mega|mini|micro|nano|uni|trans|auto|self|extra|ultra|super|sub|mc|o'|)($lcneedle|$nm1)([a-z]|)(ate|at|ion|ible|ibil|able|abil|ity|iti|ant|ance|en|ent|enn|al|ful|l|ical|ic|ous|ish|ive|ary|ari|ness|th|ship|ese|lese|ist|ize|iz|ism|sm|ian|an|ent|ence|ency|enci|s|es|d|ed|eds|ing|ings|r|er|ers|or|ors|ess|esses|est|ests|ly|ably|ablies|ish|y|ey|ic|ics|man|men|women|women|n't)*$};
	## allow: -less, pro-, con-, di-, mis-, various things I haven't thought of
	my @hs = indexes { $_ =~ $nyes && $_ !~ $nno } @lcwords;
	if ($#hs > 0) {
		my $needle = $words[$n];
		# pick one containing word from haystack
		my $h = $hs[ int(rand($#hs)) ];
		#print "from @hs picked $h\n";
		my $haystack = $words[$h];
		print "$needle $haystack\n";
		print GRAPHTXT "$needle $haystack\n";
		#print GRAPHCSV "$n,$h\n";
		++$i;
	}
}
