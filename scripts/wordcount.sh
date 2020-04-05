#!/bin/bash

#
# Generates thesis word count.
# GNU wc includes all comments, commands etc. (so will be higher than actual)
# detex wc attempts to strip all latex commands.
#
# Run from top level thesis directory containing tex files.

printf '%40s\t%s\t%s\n' 'file' 'wc' 'wc (detex)'
for f in *.tex
do
  wcf=`cat $f | wc -w`
  # Detex suggested by:
  # https://tex.stackexchange.com/questions/534/is-there-any-way-to-do-a-correct-word-count-of-a-latex-document
  wcd=`detex $f | wc -w`
  printf '%40s\t%s\t%s\n' $f $wcf $wcd
done
echo ""
echo -n "grand total (wc):    "
cat *.tex | wc -w
# detex will include files, so just need to count thesis.
echo -n "grand total (detex): "
cat thesis.tex | detex | wc -w

