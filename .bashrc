#GREETING
echo "Hello `whoami`, How are you feeling today?"

#TERMINAL STYLES
#export PS1="\$ "
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -lah'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


#ALIAS
alias pserve='python -m SimpleHTTPServer'
alias gpom='git push origin master'
alias gadd='git add .'
alias gcom='git commit -m'
alias gh-pages='git checkout -b gh-pages && git push origin gh-pages && git checkout master && git branch -d gh-pages'
#nginx


#sublime
export EDITOR='subl -w'

#The .NET SDK Manager, a set of command 
#line utilities to update and configure 
#which runtime (DNX) to use.
source /usr/local/lib/dnx/bin/dnvm.sh

#RASPPI
#Find Raspberry Pi - sudo nmap -O -v 192.168.1.1/24 | grep Pi
alias find_rasp='sudo nmap -O -v 192.168.1.1/24 | grep Pi'
#open vnc://pi@192.168.1.xxx:5901
