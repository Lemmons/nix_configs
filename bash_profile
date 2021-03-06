# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
else
    brew install bash-completion git
fi

BLACK="\[\033[0;30m\]"
DARK_GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
BROWN="\[\033[0;33m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
DEFAULT_COLOR="\[\033[00m\]"

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion"
  export PS1="\`if [ \$? = 0 ];
              then
                  echo -en '$GREEN--( $LIGHT_CYAN\u$YELLOW@$LIGHT_CYAN\h$GREEN )--( $YELLOW\w$GREEN )--( $PURPLE'; __git_ps1 "%s"; echo -n '$GREEN )-- ◦°˚\(*❛‿❛)/˚°◦\n--\$$DEFAULT_COLOR ';
              else
                  echo -en '$LIGHT_RED--( $LIGHT_CYAN\u$YELLOW@$LIGHT_CYAN\h$LIGHT_RED )--( $YELLOW\w$LIGHT_RED )--( $PURPLE'; __git_ps1 "%s"; echo -n '$LIGHT_RED )-- (ノ ゜Д゜)ノ ︵ ┻━┻ \n--\$$DEFAULT_COLOR ';
              fi; \`"
else
  export PS1="\`if [ \$? = 0 ];
              then
                  echo -en '$GREEN--( $LIGHT_CYAN\u$YELLOW@$LIGHT_CYAN\h$GREEN )--( $YELLOW\w$GREEN )-- ◦°˚\(*❛‿❛)/˚°◦\n--\$$DEFAULT_COLOR ';
              else
                  echo -en '$LIGHT_RED--( $LIGHT_CYAN\u$YELLOW@$LIGHT_CYAN\h$LIGHT_RED )--( $YELLOW\w$LIGHT_RED )-- (ノ ゜Д゜)ノ ︵ ┻━┻ \n--\$$DEFAULT_COLOR ';
              fi; \`"
fi

set -o vi

# Colorize ls
CLICOLOR=TRUE; export CLICOLOR
LSCOLORS=gxfxcxdxBxegedabagacad; export LSCOLORS

# make vim swap dir
mkdir -p .backup

# setup vim extensions
# vim +PluginInstall +qall

if [ ! -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]; then
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh
    cd ~
fi

# added by travis gem
[ -f /Users/slemmon/.travis/travis.sh ] && source /Users/slemmon/.travis/travis.sh

#init rbenv
eval "$(rbenv init -)"

#init thefuck
eval "$(thefuck --alias)"

# add /usr/local/sbin to path
PATH=$PATH:/usr/local/sbin

# pyenv auto-completion
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# nodenv auto-completion
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
