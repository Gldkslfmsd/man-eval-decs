
ev() {
	echo $1
	quickjudge anotation-dm --print 2> /dev/null | grep $1 | cut -f 3 | sed '/^[^,]*$/s/$/,_/' | cut -f$2 -d, | sort | uniq -c
	echo
}

mt() {
	echo MT
	ev $1 1
}

ne() {
	echo NE
	ev $1 2
}


mt baseline

mt ner

ne baseline

ne ner

