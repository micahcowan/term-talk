#!/bin/bash
cd "$(dirname "$0")"
reseq --replay --halts -d3 <(m4 sgr.seq)
