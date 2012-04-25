# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$ZDOTDIR/.histfile
setopt histignoredups histignorealldups histfindnodups sharehistory extendedglob

# configure zsh's autocompletion system; man zshcompsys
zstyle ':completion:*' completer _expand _complete _match _approximate
zstyle ':completion:*' matcher-list '+m:{[:lower:]}={[:upper:]}' '+l:|=* r:|=*' '+r:|[._-]=** r:|=**' 
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' expand suffix
zstyle ':completion:*:kill:*' command 'ps -u$USER'

zstyle ':completion:*' remove-all-dups true
zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32

autoload -Uz compinit
compinit

autoload -U zsh-mime-setup
zsh-mime-setup

# predictive typing (`man zshcontrib`)
autoload -U predict-on

# re-enable predictive typing at each prompt
zle-line-init() { predict-on }
zle -N zle-line-init

# disable predictive typing where it doesn't make sense
zstyle ':predict' toggle true
zstyle ':predict' verbose true

# ensure zprompt exits after launching the command
function preexec() {
  unset ZDOTDIR  # limit zprompt settings to itself
  eval "$1 &!"   # launch and disown the command
  exit           # and quit this shell
}

# exit on escape key
function escape() {
  exit
}
zle -N escape
bindkey '^[' escape

# Prompt
PROMPT=">> "
