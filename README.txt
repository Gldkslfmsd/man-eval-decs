Data Description
================

data/ - raw translation, source and references data in format for MT-ComparEval

anotate-baseline-1Mvs250k -- dir with annotation task data
├── anotation.anot  -- plain quickjudge .anot file
├── anotation.coresp 
├── anotation-dm.anot  -- annotations by DM
├── anotation-dm.coresp -> anotation.coresp
├── anotation-ob.anot-raw -- prepared for OB
├── anotation-ob.coresp -> anotation.coresp
├── baseline-1M
├── baseline-250k
├── ref
└── source

...etc

Annotation Tasks
================

anotate-baseline-1Mvs250k 
	- dev 
	- baseline at 250k vs 1M steps
	- dm: cca 67% done

anotate-baseline_vs_taskid 
	- dev
	- 1M steps
	- plain baseline vs with task identification token

anotate-ner5enrich_vs_baseline/
	- test
	- 1M
	- DM 100% done
	
anotate-ner58gold_vs_baseline/
	- test
	- 1M
	- DM 100% done

TODO

Annotation Manual
=================

- we compare pairs of runs
- baseline vs:
	- compare overall quality of translation

	mark |	meaning
	===============
	sb   | substantially better -- mark the one, the other has no mark
	b    | better
	eg   | equally good -- mark both translations, if they differ
	eb   | equally bad -- mark both translations, if they differ
	?    | ?

- ner vs:
	- compare overall quality of translation

	mark |	meaning
	===============
	sb _   | substantially better -- mark the one, the other has no mark
	b _    | better
	eg eg  | equally good -- mark both translations, if they differ
	eb eb  | equally bad -- mark both translations, if they differ
	?      | ?

	- ...and overall translation of NE
		- the same marks, comma delimited, e.g. b,eb = overall translation better, NE equally bad
	

- other comments/marks optional, can be dropped later
- use quickjudge https://github.com/ufal/quickjudge and bash commands to sum the results

