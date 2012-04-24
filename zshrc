fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Hooks
typeset -ga precmd_functions
typeset -ga preexec_functions

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

# zsh options; man zshoptions
setopt sharehistory
setopt histignoredups
setopt histignorealldups
setopt histfindnodups
setopt histignorespace

setopt extendedglob
setopt notify
setopt correct
setopt interactivecomments
setopt multios

setopt autocd
setopt autopushd
setopt pushdignoredups
setopt pushdsilent

setopt autolist
unsetopt listambiguous

setopt listpacked
setopt listtypes

unsetopt flowcontrol
unsetopt beep


### Key bindings ###
bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^[[Z' reverse-menu-complete
bindkey '^[/' undo

zle -N rationalize-dot
bindkey . rationalize-dot


# configure zsh's autocompletion system; man zshcompsys
zstyle ':completion:*' use-cache on

zstyle ':completion:*' completer _expand _complete _match _approximate
zstyle ':completion:*' matcher-list '+' '+m:{[:lower:]}={[:upper:]}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' expand suffix
zstyle ':completion:*:kill:*' command 'ps -u$USER'

zstyle ':completion::expand:*' tag-order 'expansions all-expansions'
zstyle ':completion:*' remove-all-dups true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B%d:%b'
zstyle ':completion:*' verbose true
zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32
zstyle ':completion:*' menu 'select=0'
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' select-prompt ''

zstyle ':completion:*' insert-tab false
zstyle ':completion:*' prompt ''\''%e'\'''
zstyle ':completion:*:manuals' separate-sections true

autoload -Uz compinit
compinit

# Initialize prompt
autoload -Uz promptinit
promptinit
prompt adam2

#PS1="%~$ "
#export MOZ_NO_REMOTE=1

### Aliases
alias df='df -h'
alias du='du -hs'

alias la='ls -aG --color'
alias ll='ls -lhG --color'
alias ls='ls -G --color'
alias l='ls -G --color'

alias pi='sudo aptitude install'
alias pr='sudo aptitude remove'
alias pp='sudo aptitude purge'
alias pud='sudo aptitude update'
alias pug='sudo aptitude safe-upgrade'
alias pufg='sudo aptitude full-upgrade'
alias pse='aptitude search'
alias psh='aptitude show'

alias halt='sudo shutdown -h now'
alias reboot='sudo reboot'

alias e='gvim --remote-tab-silent'

alias -g ack='ack-grep'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g Y='| xclip && xclip -o | xclip -se c'
alias -g R='$(git rev-parse --show-toplevel 2> /dev/null)'

alias sz='source ~/.zshrc'
alias ez='e ~/.zshrc'

alias entertain='mplayer "$(find "." -type f -regextype posix-egrep -regex ".*\.(avi|mkv|flv|mpg|mpeg|mp4|wmv|3gp|mov|divx)" | shuf -n1)"'
alias rand='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

### Exports
export _JAVA_AWT_WM_NONREPARENTING=1

precmd() {
    # send a visual bell to awesome
    echo -ne '\a'
}

# Title
precmd_functions=( "${precmd_functions[@]:#_title_precmd}" _title_precmd )
preexec_functions=( "${preexec_functions[@]:#_title_preexec}" _title_preexec )

# Auto jump; https://github.com/sjl/z-zsh
. $HOME/.zsh/z/z.sh
precmd_functions=( "${precmd_functions[@]:#_z_precmd}" _z_precmd )
