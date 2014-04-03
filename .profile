# Sugar
go() { ssh mike-petrovich@$1; }
alias ll="ls -alF"
alias g=git

# Git utilities, see hub.github.com
alias git=hub

# Set Sublime as default editor
export EDITOR='sub -w'

# Tab-completion of git commands
# See: https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
if [ -f /etc/bash_completion.d/git ]; then
  . /etc/bash_completion.d/git
fi

# Show Git branch & dirty flag in command prompt
# See: https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

# File sync with rsync
fs() {
	echo "Syncing files..."
	rsync -qzar --exclude '.git*' --exclude '.DS_Store' --exclude 'dist' -e 'ssh' --delete /Users/mike/repos/Unified mike-petrovich@dev:/home/mike-petrovich/repos/
}

# Create a pull request on GitHub for the specified branch.
# Requires GitHub Hub to be installed. (see hub.github.com)
#
# usage:
#   pr {branch}
#
# example:
#   pr bugfix-123
pr() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git push origin HEAD
	git pull-request -o -b nextbigsoundinc:master -h mpetrovich:$BRANCH -m "$1"
}

# Tails the specified log for a particular environment.
#
# usage:
#   log {type} [{subdomain}]
#
# example:
#   log error premium
#   log access spotify
#   log error    (error logs for web, since it has no subdomain)
log() {
	sub=${2:-}${2:+"."}
	tail -f /var/log/apache2/${sub}mike-petrovich.tnbsdev.com-$1.log
}
