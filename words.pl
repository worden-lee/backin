#!/usr/bin/env perl
## TODO need long wordlist with capitalization, not acronyms &c
open DICT, "</usr/share/dict/cracklib-small" or die "Can't open dictionary";
@dict = <DICT>;
chomp @dict;
## TODO need fuller list of unacceptable terms
@words = grep { (length($_) >= 4 or $_ eq 'bi') and !(/^(rap[ei]|arab|bitch|black|cunt|chink|dike|dyke|fag|gook|jap|jew|kike|hebe|heeb|kraut|lame|mick|nigg|pimp|retard|spic|wetback|wop|stein|berg|kline)/i or /'s$/i or /^[A-Z]+$/) } @dict;
open WORDS, ">words" or die "Can't open words file to write";
print WORDS join("\n",@words);
