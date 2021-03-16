
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/usr/local/opt/python@3.8/bin:$PATH"
#PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:/Applications/Postgres.app/Contents/Versions/11/bin/:$PATH

alias brofile='vim ~/.bash_profile'
alias rebrofile='source ~/.bash_profile'
alias catbrofile='cat ~/.bash_profile'

function psa() {
    ps aux | grep $1
}
function gtail {
    echo -e "\033];$1\007"
    tail -f $1
    echo -e "\033];air\007"
}
function pskill() {
    kill $(ps aux | grep $1 | grep -v 'grep --color=auto '$1 | awk '{print $2}')
}
function mkcd() {
    mkdir -p "$@" && eval cd "\"\$$#\"";
}
#############################################################
# PROMPT
#############################################################
parse_git_branch() {
    old_status=$?
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    [ $old_status -eq 0 ] || exit $old_status
}

status_color() {
    [ $? -eq 0 ] && printf "\033[0" || printf "1;31"
}

export PS1="\r\n\[\033[0;36;1m\]\u\[\033[0;37m\]:\[\e[0;35m\]AIR\[\033[0;37m\]:\[\033[32;1m\]\h\[\033[0;37;1m\]:\[\033[33;1m\]\w\[\033[31;1m\]\$(parse_git_branch)\[\033[0m\]\r\n\[\033[\$(status_color)m\][\$(date +%T)] \# >\[\033[0m\]"
#############################################################

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
