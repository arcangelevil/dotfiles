# ~/.bashrc: executed by bash(1) for interactive shells.
# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#Usar modo vi
set -o vi
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

base03='\[\e[38;2;0;43;54m\]'       #base03:    #002b36 background
base02='\[\e[38;2;7;54;66m\]'       #base02:    #073642 background highlights
base01='\[\e[38;2;88;110;117m\]'    #base01:    #586e75 comment / secondary comment
base00='\[\e[38;2;101;123;131m\]'   #base00:    #657b83
base0='\[\e[38;2;131;148;150m\]'    #base0:     #839496 body / default text
base1='\[\e[38;2;147;161;161m\]'    #base1:     #93a1a1 optional emphasized content
base2='\[\e[38;2;238;232;213m\]'    #base2:     #eee8d5
base3='\[\e[38;2;253;246;227m\]'    #base3:     #fdf6e3

yellow='\[\e[38;2;181;137;0m\]'     #yellow:    #b58900
orange='\[\e[38;2;203;75;22m\]'     #orange:    #cb4b16
red='\[\e[38;2;220;50;47m\]'        #red:       #dc322f
magenta='\[\e[38;2;211;54;130m\]'   #magenta:   #d33682
violet='\[\e[38;2;108;113;196m\]'   #violet:    #6c71c4
blue='\[\e[38;2;38;139;210m\]'      #blue:      #268bd2
cyan='\[\e[38;2;42;161;152m\]'      #cyan:      #2aa198
green='\[\e[38;2;133;153;0m\]'      #green:     #859900

# Wrapper color
WC=$base01

# Clear everything
PS1='\[\e[0m\e]0;\w\a\]'
PS1=$PS1$WC'┌─($(if [ $? = 0 ]; then echo "'$green'✔"; else echo "'$red'✘"; fi)'$WC')'
PS1=$PS1'─('$blue'\j'$WC')\n'
PS1=$PS1$WC'├─['$green'\l'$WC']'
PS1=$PS1'─('$cyan'\u'$orange'@\h'$WC')'
PS1=$PS1'─('$yellow'\w'$WC')'
PS1=$PS1'$(git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/'$WC'─('$red'\1'$WC')/")\n'
PS1=$PS1$WC'└─('$violet'$(printf "%.4d" \!)'$WC') \$ '
PS1=$PS1'\[\e[0m\]'
export PS1;
export PS2='      >'

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
# export GREP_COLOR="1;32"
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=auto'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -lhF --color=auto'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #
alias diff='diff --color=auto'

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func


