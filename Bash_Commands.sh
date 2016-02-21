#GREETING
echo "Hello `whoami`, How are you feeling today?"

#TERMINAL STYLES
#export PS1="\$ "
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

# ----
#ALIAS
# ----
alias pserve='python -m SimpleHTTPServer'
alias ls='ls -lah'

#RUBY # Using RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
alias pry="pry --simple-prompt"

#HOME BREW
alias buo='brew update && brew outdated'
alias bug='brew upgrade'

#sass --watch styles.scss:style.css

#VAGRANT
  #create vagrant commands

#GIT
alias gs='git status'
alias gpom='git push origin master'
alias gadd='git add .'
alias gcom='git commit -m'
alias gh-pages='git checkout -b gh-pages && git push origin gh-pages && git checkout master && git branch -d gh-pages'

#sublime
export EDITOR='subl -w'

#The .NET SDK Manager, a set of command
#line utilities to update and configure
#which runtime (DNX) to use.
source /usr/local/lib/dnx/bin/dnvm.sh

#RASPPI
#Find Raspberry Pi - sudo nmap -O -v 192.168.1.1/24 | grep Pi
alias rp_find='sudo nmap -O -v xxx.xxx.x.x/xx | grep Pi'
alias rp_vnc='open vnc://pi@xxx.xxx.x.xxx:xxxx'
alias rp_ssh='ssh pi@xxx.xxx.x.xxx'


