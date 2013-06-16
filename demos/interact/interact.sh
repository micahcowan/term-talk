#!/bin/sh

# Use the tty pathname given as argument, or else
# determine it from the first TMUX pane that's not the one we're running
# in.
tty=${1-__none__}
if [ "x$tty" = 'x__none__' ]
then
    if [ "x$TMUX_PANE" = 'x' ]
    then
        echo "No pty given as arg, and not running in a tmux pane." >&2
        exit 1
    fi
    sleep 1
    tty=$( tmux list-panes -F '#{pane_id} #{pane_tty}' | \
            awk "\$1 != \"${TMUX_PANE}\" { print \$2; exit 0; }" )
    if [ "x$tty" = 'x' ]
    then
        echo "No pty given as arg, and couldn't find any other tmux panes." >&2
        exit 1
    fi
    echo "Other tmux pane pty is $tty." >&2
fi
( set -x; stty raw < "$tty" )

cmd=
prompt='> '

tput smso > "$tty"
printf 'x\b' > "$tty"
tput rmso > "$tty"

printf -- '%s' "$prompt"
while read -r newcmd
do
    if [ "x$newcmd" != x ]
    then
        cmd=$newcmd
    fi
    printf 'x\b' > "$tty"
    (
        set -x
        tput $cmd > "$tty"
    )
    tput smso > "$tty"
    printf 'x\b' > "$tty"
    tput rmso > "$tty"

    printf -- '%s' "$prompt"
done
printf '\n'
