set nobeep
export LANG "en_US.UTF-8"   # solves tmux border problems (tmux -u is another solution)
alias ls="ls -laG"
cs() { builtin cd "$1" && ls; }

# if not on NCTUCS workstation
if [ "`hostname|grep .cs.nctu.edu.tw`" == "" ]; then
    alias shutdown='sudo shutdown -p now'
    alias poweroff='sudo poweroff'
    alias reboot='sudo reboot'
    alias restart='sudo reboot'
    alias nanos='sudo nano `readlink \!:1`'
    alias service='sudo service'
    alias zpool='sudo zpool'
    alias zfs='sudo zfs'
    alias chmod='sudo chmod'
    alias chown='sudo chown'
    alias zbackup='sudo zbackup'
fi

#export PS1="\[\e[34;1m\]\u\[\e[36m\]@\H \[\e[35m\]\w \[\e[32m\]$ \[\e[0m\]"
export PS1="\[\e[36m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[33m\]\w\[\e[m\] \[\e[35m\]\\$\[\e[m\] "
