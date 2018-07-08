REG=".uPERx.uLOC
.uORGx.uORG
.uOTHx.uPER
.uLOCx.uLOCderiv
.uOTHx.uORG
.uLOCx.uLOC
.uOTHderivxO
.uOTHx.uLOC
.uPERpartxO
.uOTHpartxO
.uORGx.uPER
.uORGx.uLOCderiv
.uLOCpartxO
.uORGx.uLOC
.uORGpartxO
.uLOCderivxO
.uOTHxO
.uORGxO
.uLOCxO
.uPERxO"

: > dev.decs
for r in $REG; do
	echo $r
	i=0
	paste dev.de dev.cs | grep 'NERTAG' | grep $r' ' | sort -R | while read line; do
		grep "$line" dev.decs >/dev/null && continue
		echo "$line" >> dev.decs
		i=$(($i+1))
		if [ $i -ge 5 ]; then
			break
		fi
	done
done



cut -f 1 dev.decs | sed 's/ŽŽŽNERTAG/ŽŽŽTranslate/' > dev.nertest.de
sed 's/ ŽŽŽTranslate//' dev.nertest.de > dev.nertest.de.tok
cut -f 2 dev.decs > dev.nertest.other

