# User configuration
export remote_username="john-doe"
export remote_host="10.123.14.14"
export git_username="jdoe"

# Set the default editor
export EDITOR='vim'
# ...or if you are working locally and have Sublime Text aliased to 'sub'
# export EDITOR='sub -w'

# Bash sugar
alias ll="ls -alF"
alias g=git

# If GitHub Hub (http://hub.github.com) is installed, uncomment the line below
# alias git=hub

# Enable tab-completion of git commands
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
if [ -f /etc/bash_completion.d/git ]; then
  . /etc/bash_completion.d/git
fi

# Show git branch & dirty flag in command prompt
# https://github.com/jimeh/git-aware-prompt
if [ -d ~/.bash/git-aware-prompt ]; then
	export GITAWAREPROMPT=~/.bash/git-aware-prompt
	source $GITAWAREPROMPT/main.sh
	export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
	export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
fi

# SSH to a host.
#
# usage:
#   go HOSTNAME
#
# example:
#   go 10.123.14.14
#   go dev
#
go() {
	ssh $remote_username@$1
}

# SSH to a host using Mosh.
# See: http://mosh.mit.edu/
#
# usage:
#   mo HOSTNAME
#
# example:
#   mo 10.123.14.14
#   mo dev
#
mo() {
	mosh $remote_username@$1
}

# Rsyncs files and subdirectories in the current directory to a remote host.
#
# usage:
#   fs
#
fs() {
	printf "Syncing files... "
	local_source=`pwd -P`
	remote_dest="/home/"$remote_username"/repos/"
	rsync -qzar --exclude '.git*' --exclude '.DS_Store' --exclude 'dist' -e 'ssh' --delete $local_source $remote_username@$remote_host:$remote_dest
	printf "done\n"
}

# Makes 'fs' available in git hooks
export -f fs

# Open a new pull request. (requires GitHub Hub, see hub.github.com)
#
# usage:
#   pr [DEST_BRANCH [SOURCE_BRANCH]]
#
#   DEST_BRANCH: Must be in a "user:branch" format
#   SOURCE_BRANCH: Only the branch name; the git user is prefixed automatically
#
# example: Opens a PR from the current branch to nextbigsoundinc:master
#   pr
#
# example: Opens a PR from the current branch to nextbigsoundinc:feature
#   pr nextbigsoundinc:feature
#
# example: Opens a PR from my-feature to mpetrovich:feature
#   pr mpetrovich:feature my-feature
#
pr() {
	if [ $# == 2 ]; then
		# pr DEST_BRANCH SOURCE_BRANCH
		dest_branch=$1
		source_branch=$2
	elif [ $# == 1 ]; then
		# pr DEST_BRANCH
		dest_branch=$1
	else
		# pr
		source_branch=$(git rev-parse --abbrev-ref HEAD)
		dest_branch="nextbigsoundinc:master"
	fi

	git push origin HEAD
	git pull-request -o -b $dest_branch -h $git_username:$source_branch
}

# Tail an environment apache log.
#
# usage:
#   log LOGTYPE [SUBDOMAIN]
#
#   LOGTYPE: "error", "access", "php"
#   SUBDOMAIN: "premium", "spotify" (omit for www)
#
# example: Tail the premium error log
#   log error premium
#
# example: Tail the Spotify access log
#   log access spotify
#
# example: Tail the web (www.*) error log
#   log error
#
# example: Tail the PHP web error log
#   log php
#
log() {
	if [ $1 == php ]; then
		tail -f /var/log/nbs/php_errors.log
	else
		logtype=$1
		subdomain=${2:-}${2:+"."}
		tail -f /var/log/apache2/${subdomain}${remote_username}.tnbsdev.com-${logtype}.log
	fi
}
