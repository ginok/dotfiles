autoload -U compinit
compinit

# terminal title
case "${TERM}" in
  kterm*|xterm)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# prompt settings
case ${UID} in
  0)
    PROMPT="%{[31m%}%n%%%{[m%} "
    RPROMPT="[%~]"
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
  *)
    PROMPT="%{[33m%}%n%%%{[m%} "
    RPROMPT="[%~]"
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# command history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

# auto cd
setopt auto_cd

# cd history
setopt auto_pushd

# command correct
setopt correct

if [ $SHLVL = 1 ]; then
# tmuxにセッションがなかったら新規セッションを立ち上げた際に分割処理設定を読み込む
  alias tmux="tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session"
fi
