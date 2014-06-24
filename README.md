Dotfiles
========

## Installation

### Dependencies

Required:
- [hub for Github](http://hub.github.com/)

Optional:
- [Git tab-completion for Bash](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion)
- [Show current Git branch in Bash prompt](https://github.com/jimeh/git-aware-prompt)

1. Clone this repository: ```shell
git clone git@github.com:mpetrovich/Dotfiles.git ~/repos/Dotfiles
```
2. Source `.profile` from within your bash profile. In `~/.bash_profile` or `~/.myprofile`, add: ```shell
. ~/repos/Dotfiles/.profile
```
4. Symlink your `.gitconfig` to the cloned one. Don't forget to back up your existing gitconfig! ```shell
ln -s ~/repos/Dotfiles/.gitconfig .gitconfig
```
5. Edit your usernames and emails in the cloned `.profile` and `.gitconfig`
