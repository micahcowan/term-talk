#!/bin/bash
cd "$(dirname "$0")"
reseq --replay --halts <(m4 record.seq)
