
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias vgrt="cd ~/workspace/jpos-vagrant"
alias smoke="cd ~/workspace/payments-api-smoke-test"
alias payments="cd ~/workspace/marqeta-jpos"
alias localdock="cd ~/workspace/localdocker"
alias test1="cd ~/workspace/payments-test-folders/local1/app"
alias test2="cd ~/workspace/payments-test-folders/local2/app"
alias test3="cd ~/workspace/payments-test-folders/local3/app"
alias logs1="cd ~/workspace/localdocker && ssh -t vagrant@localdocker \"sudo sh -c 'cd /var/log/jcard/local1; ls -altr; bash'\""
alias logs2="cd ~/workspace/localdocker && ssh -t vagrant@localdocker \"sudo sh -c 'cd /var/log/jcard/local2; ls -altr; bash'\""
alias logs3="cd ~/workspace/localdocker && ssh -t vagrant@localdocker \"sudo sh -c 'cd /var/log/jcard/local3; ls -altr; bash'\""
alias monterey="cd ~/workspace/monterey"
alias pd="cd ~/workspace/program-dashboard-test-automation"

# Ping all Local Dockers
alias lp=local_ping
local_ping() {
  echo -e "\n___ Local 1 ___"
  curl --silent local1.marqeta.com/v3/ping | grep -E -o ".version\"\:\".+?\""
  echo -e "___ Local 2 ___"
  curl --silent local2.marqeta.com/v3/ping | grep -E -o ".version\"\:\".+?\""
  echo -e "___ Local 3 ___"
  curl --silent local3.marqeta.com/v3/ping | grep -E -o ".version\"\:\".+?\""
  echo -e "\n"
}

 # A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'
c_red='\[\e[0;31m\]'
# \033[0;36m\ sets the color to cyan
c_cyan="\[\033[0;36m\]"
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
c_green='\[\e[0;32m\]'

# determines if the git branch you are on is clean or dirty
git_prompt ()
{
 if ! git rev-parse --git-dir > /dev/null 2>&1; then
   return 0
 fi
 # Grab working branch name
 git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
 # Clean or dirty branch
 if git diff --quiet 2>/dev/null >&2; then
   git_color="${c_git_clean}"
 else
   git_color=${c_git_dirty}
 fi
 echo " [$git_color$git_branch${c_reset}]"
}
# set up a sweet looking command prompt
PROMPT_COMMAND='PS1="\n${c_red}\u ${c_cyan}@ \w${c_reset}$(git_prompt) \n ${c_green}→ ${c_reset}"'

export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH
export PATH=~/.local/bin:$PATH

#git branch name completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
