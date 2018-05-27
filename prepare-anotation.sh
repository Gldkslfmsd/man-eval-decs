
export BASE=data/dev
annotation_task() {
	ref=$BASE/reference.txt
	source=$BASE/source.txt
	exp=$1
	AN=$2
	mkdir -p $AN
	cp $ref $AN/ref
	cp $source $AN/source
	judge_exp=""
	for e in $exp; do
		echo $e
		cp $BASE/$e/translation.txt $AN/$e
		judge_exp="$judge_exp $e"
	done

	cd $AN
	rm -f anotation.*
	#quickjudge anotation --refs=ref,source $judge_exp --shuffle --portion-size=100
	python3 ../quickjudge.py --refs=source,ref $judge_exp -n 100
	cp anotation.anot anotation-dm.anot
	cp anotation.anot anotation-ob.anot
	ln -rs anotation.coresp anotation-dm.coresp
	ln -rs anotation.coresp anotation-ob.coresp
}

exp="baseline-1M
baseline-250k"
AN=anotate-baseline-1Mvs250k

#annotation_task "$exp" $AN

exp="baseline-1M
baseline_t-1M"
AN=anotate-baseline1M_vs_taskid
#annotation_task "$exp" $AN


export BASE=data/test
exp="baseline-1M
ner5_enrich-1M"
AN=anotate-ner5enrich_vs_baseline
annotation_task "$exp" $AN

