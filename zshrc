source ~/dotfiles/antigen.zsh
#antigen use oh-my-zsh
#
antigen bundle agkozak/zsh-z
antigen bundle zsh-users/zsh-autosuggestions
antigen apply
# Set up the prompt

autoload -Uz compinit promptinit
compinit
promptinit
prompt clint

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

plugins=(
    zsh-z
    zsh-autosuggestions
    )
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


alias mk='make -j4'
alias ls='eza'
alias ll="eza -la"
alias gs='git status'
alias gl='git log'
alias gcm='git commit -m'
alias vim='nvim'
alias gd='git diff'
alias ga="git add"
alias cm="gcloud compute ssh iamslowdeath@instance-1 --zone us-central1-a"
alias lg="lazygit"

export EDITOR="nvim"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"

path=('/home/senargha/.local/bin' $path)
export PATH

bindkey "^R" history-incremental-search-backward

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/argha/google-cloud-sdk/path.zsh.inc' ]; then . '/home/argha/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/argha/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/argha/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(fzf --zsh)"

# pnpm
export PNPM_HOME="/Users/arghasen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
