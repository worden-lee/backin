words : /usr/share/dict/american-english
	perl -ne "print unless (/\'s$$/ or /^[A-Z]$$/)" < $< > $@
