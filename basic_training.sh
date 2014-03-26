#!/bin/bash

set -x
function run() {
  m=1
	[ -n "$4" ] && m=$4;
  if [ -n "$3" ]; then
		./run.sh game/tankwar -m $m  -i $1  -s $2.pop -l $3 $2 >> timeseries.csv 
	else
    ./run.sh game/tankwar -m $m  -i $1  -s $2.pop $2 >> timeseries.csv             
	fi
  echo $2.pop
}

[ -n "$1" ] && POP="$1"

POP=`run 1000 AimOnOneNoMove $POP`
POP=`run 1000 SymmetricLinesShort $POP`
POP=`run 1000 SymmetricLinesAttackerMoveFar $POP`
POP=`run 1000 SymmetricLinesFar $POP`
cp $POP basic_training.pop
