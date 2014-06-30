Dotfiles
========

## Installation

#### 1. Set up dependencies

Required:
- [hub for Github](http://hub.github.com/)
- A remote git repository called `upstream`

Optional:
- [Git tab-completion for Bash](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion)
- [Show current Git branch in Bash prompt](https://github.com/jimeh/git-aware-prompt)

#### 2. Clone this repository

```shell
git clone git@github.com:mpetrovich/Dotfiles.git ~/repos/Dotfiles
```

#### 3. Source the profile from within your bash profile

In `~/.bash_profile` or `~/.myprofile`, add:
```shell
. ~/repos/Dotfiles/.profile
```

#### 4. Symlink your gitconfig to the cloned one.

Don't forget to back up your existing gitconfig!
```shell
ln -s ~/repos/Dotfiles/.gitconfig .gitconfig
```

Alternatively, you can manually copy the parts of the gitconfig you like. However, it will be harder to get future updates to my gitconfig if you do.

#### 5. Replace the placeholder user info with your own

In `.profile`:
```shell
# User configuration
remote_username="john-doe"
remote_host="12.34.456.789"
git_username="jdoe"
```

In `.gitconfig`:
```shell
[user]
  name = John Doe
  email = jdoe@gmail.com
```
