#!/bin/sh
cd "$(dirname "$0")"
( cd vim && sh vim.cmd )
( cd nethack && sh nethack.cmd )
( cd starwars && sh starwars.cmd )
( cd nyan && sh nyan.sh )
reset
