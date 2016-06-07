## make a list of common words to mine for nested pairs
words : ./words.pl /usr/share/dict/cracklib-small
	./words.pl

## make a compact list of matching pairs, by number
graph.txt : ./graph.pl words
	./graph.pl

## expand those pairs into a suitably syntaxed string for use in Tracery
tracery-string : ./tracery-string.pl graph.txt
	./tracery-string.pl >$@
