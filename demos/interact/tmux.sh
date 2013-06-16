#!/bin/bash
cd "$(dirname "$0")"
tmux -Lmjc-term-demo -f interact.tmux attach
