#!/usr/bin/env python3

"""prepares data for manual evaluation into the same format as https://github.com/ufal/quickjudge ,
but it allows extra features:
- selects only n random sentences, you don't have to cut the output for less sentences than the full set
- specify random seed -> selects identical sentences in multiple runs
"""

import argparse
parser = argparse.ArgumentParser()

parser.add_argument("--refs",help="comma-delimited list of reference files")
parser.add_argument("translations", nargs="+")
parser.add_argument("-n",default=100,type=int,help="number of sentences to select")
parser.add_argument("-s","--seed",type=int,default=1234,help="random seed to initialize shuffling. Default: 1234")
parser.add_argument("-a","--annotation",type=str,default="anotation",help="annotation file prefix")
args = parser.parse_args()

import random
random.seed(args.seed)

if args.refs:
	refs = args.refs.split(",")
else:	
	refs = []

labels = refs + args.translations

file_sents = []
for fn in labels:
	with open(fn,"r") as f:
		sents = [ (fn,line) for line in f.read().split("\n") ]
		file_sents.append(sents)

sentences = []
for i in range(len(file_sents[0])):
	s = [ (i,)+sents[i] for sents in file_sents ]
	sentences.append(s)

random.shuffle(sentences)

with open(args.annotation+".anot","w") as anot:
	with open(args.annotation+".coresp","w") as coresp:
		print("Reference lines: %d\n" % len(refs),file=coresp)
		for i in range(args.n):
			sent = sentences[i]
			for r,rs in zip(refs,sent):
				sentid,_,s = rs
				print("%s\t%s" % (r,s),file=anot)
			print(sentid,file=coresp)
			trans = [ (lab, s) for _,lab,s in sent if lab not in refs ]
			trans_dict = { s:[] for s in set(s for _,s in trans) }
			for lab,s in trans:
				trans_dict[s].append(lab)
			trans_list = list(trans_dict.items())
			random.shuffle(trans_list)
			for s, labs in trans_list:
				print("\t%s" % s, file=anot)
				print("\t".join(labs),file=coresp)
			print(file=coresp)
			print(file=anot)



