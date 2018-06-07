# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Source git shell on Mac OS
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# drush
if [ -f ~/.drush_bashrc ] ; then
  . ~/.drush_bashrc
fi

# Export columns var so python has access to this.
export COLUMNS

# Git goodness:
# http://www.metaltoad.com/blog/git-drupal-primer
# GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='[\u@mb \w$(__git_ps1)]\$ '
GIT_PS1_SHOWDIRTYSTATE=true
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]`short-path`\[\033[00m\]$(__git_ps1)$(__drush_ps1)\[\033[01;36m\]☠\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1)☠ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
  alias ls='ls -G'
  alias grep='grep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Tab complete directories only on `cd` command
complete -d cd

# Source all bash_completion.d
for f in /usr/local/etc/bash_completion.d/*; do source $f; done

# Yakuake history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Path
PATH=$PATH:$HOME/bin
PATH=$PATH:~/.composer/vendor/bin

# CVS
CVSROOT=:pserver:jhedstrom@cvs.drupal.org:/cvs/drupal-contrib

# Aliases
alias o='xdg-open'
alias cvs_stat='cvs stat | grep File | grep -v Up-to-date'
alias c='pygmentize -O style=monokai -f console256 -g'

# For drush make, export http_proxy for use with squid.
#export http_proxy=http://localhost:3128
#export ftp_proxy=http://localhost:3128

# Set vim to default terminal editor
export EDITOR=vim

# Output MOTD
cat /usr/local/etc/motd

export TURNIP_DEVELOPER_MODULES="devel views_ui styleguide"

declare -x SIMPLETEST_BASE_URL="http://d8.devl"
declare -x SIMPLETEST_DB="mysql://d8:d8@localhost/d8"
declare -x BROWSERTEST_OUTPUT_DIRECTORY="/tmp"
declare -x COMPOSER_EXIT_ON_PATCH_FAILURE="1"
# Include Drush completion.
if [ -f "/Users/jonathan.hedstrom/.drush/drush.complete.sh" ] ; then
  source /Users/jonathan.hedstrom/.drush/drush.complete.sh
fi

# Toggle xdebug off and then on for composer.
composer_toggle() {
  xdebug-toggle
  composer $@
  xdebug-toggle
}
alias composer=composer_toggle

# Include Drush prompt customizations.
#if [ -f "/Users/jonathan.hedstrom/.drush/drush.prompt.sh" ] ; then
#  source /Users/jonathan.hedstrom/.drush/drush.prompt.sh
#fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
