Dotfiles
========

Installation
----


#### 1. Set up dependencies

Required:
- [hub for Github](http://hub.github.com/)
- A remote git repository called `upstream`

Optional:
- [Git tab-completion for Bash](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion)
- [Show current Git branch in Bash prompt](https://github.com/jimeh/git-aware-prompt)
- [Mosh](http://mosh.mit.edu/), a persistent shell that greatly improves the experience of remote *nix terminals. Most of our servers (including dev) already have it installed.


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


#### 6. Remote setup

If you work directly on the dev server, you can skip this step.

If you work on a local copy of all your files, you'll first need to enable automatic file syncing with the dev server. See the section titled "Remote Sync" in `.gitconfig`.

Next, you can optionally install [Mosh](http://mosh.mit.edu/), a persistent shell that greatly improves the experience of remote *nix terminals.


Usage
----


All dotfiles are documented with usage syntax and examples. For convenience, you can enter `git aliases` at any time to list all available git aliases.

#### Example Workflow

```
# First, let's get the latest from upstream/master
git com;
git latest;

# Then, we checkout a new branch for our feature
git new feature;

# We make some changes...
# <files changed>
git cma "Add fancy new feature";

# We run our unit tests, and they break...
# <fix failing tests>
git cma "Fix failing unit tests";

# We add documentation...
# <add code documentation>
git cma "Add documentation";

# ...and then discover a typo
# <fix typo>
git amenda;

# It's been some time since we got the latest from upstream/master...
git latest;

# And someone else modified the same code, so conflicts!
# <fix conflicts>
git rbc;

# Rebase successful! Let's open a pull request
pr;

# Someone suggests some changes
# <changes made>
git cma "Changed XYZ to do ABC";

# Later, someone suggests a better fix for the earlier unit test failure
# <replace your fix with theirs>
git cma "Better fix for failing tests";

# Pull request approved for merging, but let's squash first
git squash "Add new XZY feature";
git pf;

# After merging, we don't need our feature branch anymore
git delete feature;
```
