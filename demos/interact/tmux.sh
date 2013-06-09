#!/bin/bash
cd "$(dirname "$0")"
tmux -Ldemo -f interact.tmux attach
