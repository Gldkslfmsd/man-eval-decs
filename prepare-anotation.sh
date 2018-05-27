
BASE=data/dev

ref=$BASE/reference.txt
source=$BASE/source.txt


exp="baseline-1M
baseline-250k
baseline_t-1M
baseline_t-250k"


AN=anotate-baseline

mkdir -p $AN
cp $ref $AN/ref
cp $source $AN/source
judge_exp=""
for e in $exp; do
	echo $e
	cp $BASE/$e/translation.txt $AN/$e
	judge_exp="$judge_exp $AN/$e"
done

cd $AN
quickjudge anotation --refs=ref,source $judge_exp --shuffle
