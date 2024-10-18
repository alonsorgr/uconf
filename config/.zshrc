# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Opciones para el tema Powerlevel9k:
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv vi_mode context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="red"
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="white"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="white"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="white"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="red"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="white"
POWERLEVEL9K_TIME_BACKGROUND="236"
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_BACKGROUND="236"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="236"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="236"
POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND="white"
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND="236"
POWERLEVEL9K_DIR_ETC_FOREGROUND="white"
POWERLEVEL9K_DIR_ETC_BACKGROUND="red"
POWERLEVEL9K_DIR_SHOW_WRITABLE="true"
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD="true"
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_absolute_chars"
POWERLEVEL9K_SHORTEN_DIR_LENGTH="30"
POWERLEVEL9K_VI_INSERT_MODE_STRING=""

# Para que los temas Agnoster y Powerlevel9k no muestren el contexto:
DEFAULT_USER=$USER

# Opciones para el tema https://github.com/caiogondim/bullet-train.zsh:
# BULLETTRAIN_PROMPT_ORDER=(context dir git)
# BULLETTRAIN_PROMPT_ADD_NEWLINE=false
# BULLETTRAIN_DIR_BG=green
# BULLETTRAIN_DIR_FG=234
# BULLETTRAIN_PROMPT_SEPARATE_LINE=false
# BULLETTRAIN_PROMPT_CHAR=""
# BULLETTRAIN_CONTEXT_DEFAULT_USER=$USER

# Opciones para zsh-syntax-highlighting:
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Estas líneas deben ir antes de llamar a oh-my-zsh.sh si se quiere usar el
# plugin de arranque automático de tmux:
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOCONNECT="false"
# ZSH_TMUX_AUTOQUIT="false"

# Es necesario para mostrar cursivas:
# export TERM=xterm-256color

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found composer history-substring-search z zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X11:/usr/games:/usr/local/games:$HOME/.local/bin"
export MANPATH="/usr/local/man:$MANPATH"

UCONF_PATH='Repositorios/uconf'

local ANTES=$(mktemp) && set > $ANTES
emulate sh -c 'source /etc/profile'
local DESPUES=$(mktemp) && set > $DESPUES
#unset $(diff $ANTES $DESPUES | grep "^>" | cut -c3- | cut -d"=" -f1 | grep -o "^[[:lower:]|_]*" | grep -v path)
rm -f $ANTES $DESPUES && unset ANTES DESPUES

source $ZSH/oh-my-zsh.sh

# Corrige buen uso de libvte:
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte-2.91.sh
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR="vim"
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Para que las aplicaciones Java se vean mejor:
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# Para que la pestaña de GitHub de Atom funcione:
export LOCAL_GIT_DIRECTORY=/usr

# Less Colors for Man Pages
# export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # start blink
# export LESS_TERMCAP_md=$(tput bold; tput setaf 29) # start bold
# export LESS_TERMCAP_me=$(tput sgr0) # turn off bold, blink and underline
# export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 29) # start standout (reverse video)
# export LESS_TERMCAP_se=$(tput rmso; tput sgr0) # stop standout
# export LESS_TERMCAP_us=$(tput smul; tput setaf 7) # start underline
# export LESS_TERMCAP_ue=$(tput rmul; tput sgr0) # stop underline
# export LESS_TERMCAP_mr=$(tput rev)
# export LESS_TERMCAP_mh=$(tput dim)
# export LESS_TERMCAP_ZN=$(tput ssubm)
# export LESS_TERMCAP_ZV=$(tput rsubm)
# export LESS_TERMCAP_ZO=$(tput ssupm)
# export LESS_TERMCAP_ZW=$(tput rsupm)
# export GROFF_NO_SGR=1 # For Konsole and Gnome-terminal

eval `lesspipe`
eval `dircolors ~/.dircolors`

pingbg() {
    ping "$1" &
}

killjobs() {
    kill $(jobs -p) 2>/dev/null
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Desactivar si se usa el plugin tmux de oh-my-zsh:
# alias tmux="tmux -2"

# alias ls="ls --color=tty --group-directories-first"
alias ls="exa --icons --color=auto --group-directories-first"
alias l="exa --icons --color=auto --group-directories-first --all --all --long --header --binary --group --git"
alias ll="exa --icons --color=auto --group-directories-first --grid --long --binary --git"
alias cd..="cd .."
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias rmf="rm -rf"
alias glg="git lg"
alias apagar="init 0"
alias reiniciar="init 6"
alias upd="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y"
alias rundev="npm run dev &"
alias stopdev="kill %1"
alias ping="pingbg"

bindkey -v
export KEYTIMEOUT=1

bindkey "^?" backward-delete-char
bindkey "^R" history-incremental-search-backward

# No funcionan bien con Midnight Commander:
#bindkey "^K" history-substring-search-up
#bindkey "^J" history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey "^[[5~" history-substring-search-up
bindkey "^[[6~" history-substring-search-down

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH=~/.console-ninja/.bin:$PATH
