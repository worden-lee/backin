## make a list of common words to mine for nested pairs
words : /usr/share/dict/cracklib-small
	perl -ne "print unless (/\'s$$/ or /^[A-Z]+$$/)" < $< > $@

## make a compact list of matching pairs, by number
graph.csv : ./graph.pl words
	./graph.pl

## expand those pairs into a suitably syntaxed string for use in Tracery
tracery-string : ./tracery-string.pl graph.csv
	./tracery-string.pl >$@
