#!/bin/sh

bunzip2 < nyan.seq.bz2 | reseq --replay -d 2 -
