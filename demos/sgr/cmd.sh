#!/bin/bash
cd "$(dirname "$0")"
reseq --replay --halts -d2 <(m4 sgr.seq)
