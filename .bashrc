set nobeep
bind "TAB:menu-complete"
export LANG="en_US.UTF-8"   # solves tmux border problems (tmux -u is another solution)

alias ls="ls -laG"
alias tmux='tmux -u'
cs() { if [ -n "$1" ]; then builtin cd "$1"; else builtin cd ~; fi && ls; }

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
    alias chgrp='sudo chgrp'
    alias zbackup='sudo zbackup'
fi


# Colors!
# put variables in subshell function to prevent namespace pollution

color_prompt() {(
    black="\e[30m"
    red="\e[31m"
    green="\e[32m"
    yellow="\e[33m"
    blue="\e[34m"
    magenta="\e[35m"
    cyan="\e[36m"
    lightgray="\e[37m"
    darkgray="\e[90m"
    lightred="\e[91m"
    lightgreen="\e[92m"
    lightyellow="\e[93m"
    lightblue="\e[94m"
    lightmagenta="\e[95m"
    lightcyan="\e[96m"
    white="\e[97m"

    bold="\e[1m"
    reset="\e[0m"

    #export PS1="\[\e[34;1m\]\u\[\e[36m\]@\H \[\e[35m\]\w \[\e[32m\]$ \[\e[0m\]"
    if [ "$(whoami)" = "root" ]; then
        #export PS1="${lightred}\u${lightgreen}@\h ${lightyellow}\w ${lightmagenta}$ ${reset}"
        echo "${lightred}\u${lightcyan}@\h ${lightmagenta}\w ${lightgreen}$ ${reset}"
    else
        #export PS1="${lightcyan}\u${lightgreen}@\h ${lightyellow}\w ${lightmagenta}$ ${reset}"
        echo "${lightblue}\u${lightcyan}@\h ${lightmagenta}\w ${lightgreen}$ ${reset}"
    fi
)}

export PS1="$(color_prompt)"
