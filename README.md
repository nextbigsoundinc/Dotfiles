Dotfiles
========

## Installation

#### 1. Install dependencies

Required:
- [hub for Github](http://hub.github.com/)

Optional:
- [Git tab-completion for Bash](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion)
- [Show current Git branch in Bash prompt](https://github.com/jimeh/git-aware-prompt)

#### 2. Clone this repository

```shell
git clone git@github.com:mpetrovich/Dotfiles.git ~/repos/Dotfiles
```

#### 3. Source `.profile` from within your bash profile

In `~/.bash_profile` or `~/.myprofile`, add:
```shell
. ~/repos/Dotfiles/.profile
```

#### 4. Symlink your `.gitconfig` to the cloned one.

Don't forget to back up your existing gitconfig!
```shell
ln -s ~/repos/Dotfiles/.gitconfig .gitconfig
```

#### 5. Enter your usernames and emails in the dotfiles

In `~/repos/Dotfiles/.profile`:
```shell
# User configuration
remote_username="mike-petrovich"
remote_host="dev"
git_username="mpetrovich"
```

In `~/repos/Dotfiles/.gitconfig`:
```shell
[user]
  name = Mike Petrovich
  email = mike@nextbigsound.com
```

## Notes

- These dotfiles assume that your upstream remote is called `upstream`.
