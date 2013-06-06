source ~/.tmux.conf

#new "echo $PWD; tmux split-window -h $PWD/interact.sh; cat > /dev/null"
new 'cat >/dev/null'
#set -s remain-on-exit on
split-window -h "$PWD/interact.sh; tmux kill-session"
