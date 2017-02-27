# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME=pygmalion
ZSH_THEME="agnoster"

DEFAULT_USER="Alex"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(zsh-nvm git colored-man colorize github brew osx zsh-syntax-highlighting docker nvm npm node chucknorris)

# User configuration

export PATH="/usr/local:/usr/local:/usr/bin:/bin:/usr/sbin:/sbin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/bin:$PATH"

alias ll="ls -la --color=auto"

fpath=(/usr/local/share/zsh-completions $fpath)

# unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
#bindkey -e
#
#bindkey '[D' backward-word
#bindkey '[C' forward-word
#bindkey 'OD' backward-word
#bindkey 'OC' forward-word

if [[ "$TERM" != emacs ]]; then
	[[ -z "$terminfo[kdch1]" ]]        || bindkey -M emacs "$terminfo[kdch1]"       delete-char
	[[ -z "$terminfo[khome]" ]]        || bindkey -M emacs "$terminfo[khome]"       beginning-of-line
	[[ -z "$terminfo[kend]"  ]]        || bindkey -M emacs "$terminfo[kend]"        end-of-line
	[[ -z "$terminfo[kich1]" ]]        || bindkey -M emacs "$terminfo[kich1]"       overwrite-mode
	[[ -z "$terminfo[kdch1]" ]]        || bindkey -M vicmd "$terminfo[kdch1]"       vi-delete-char
	[[ -z "$terminfo[khome]" ]]        || bindkey -M vicmd "$terminfo[khome]"       vi-beginning-of-line
	[[ -z "$terminfo[kend]"  ]]        || bindkey -M vicmd "$terminfo[kend]"        vi-end-of-line
	[[ -z "$terminfo[kich1]" ]]        || bindkey -M vicmd "$terminfo[kich1]"       overwrite-mode

	[[ -z "$terminfo[cuu1]"  ]]        || bindkey -M viins "$terminfo[cuu1]"        vi-up-line-or-history
	[[ -z "$terminfo[cuf1]"  ]]        || bindkey -M viins "$terminfo[cuf1]"        vi-forward-char
	[[ -z "$terminfo[kcuu1]" ]]        || bindkey -M viins "$terminfo[kcuu1]"       vi-up-line-or-history
	[[ -z "$terminfo[kcud1]" ]]        || bindkey -M viins "$terminfo[kcud1]"       vi-down-line-or-history
	[[ -z "$terminfo[kcuf1]" ]]        || bindkey -M viins "$terminfo[kcuf1]"       vi-forward-char
	[[ -z "$terminfo[kcub1]" ]]        || bindkey -M viins "$terminfo[kcub1]"       vi-backward-char

	# ncurses stuff
	[[ "$terminfo[kcuu1]" == "O"* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" up-line-or-history
	[[ "$terminfo[kcud1]" == "O"* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" down-line-or-history
	[[ "$terminfo[kcuf1]" == "O"* ]] && bindkey -M viins "${terminfo[kcuf1]/O/[}" vi-forward-char
	[[ "$terminfo[kcub1]" == "O"* ]] && bindkey -M viins "${terminfo[kcub1]/O/[}" vi-backward-char
	[[ "$terminfo[khome]" == "O"* ]] && bindkey -M viins "${terminfo[khome]/O/[}" beginning-of-line
	[[ "$terminfo[kend]"  == "O"* ]] && bindkey -M viins "${terminfo[kend]/O/[}"  end-of-line
	[[ "$terminfo[khome]" == "O"* ]] && bindkey -M emacs "${terminfo[khome]/O/[}" beginning-of-line
	[[ "$terminfo[kend]"  == "O"* ]] && bindkey -M emacs "${terminfo[kend]/O/[}"  end-of-line
fi

case "$TERM" in
	linux)	# Linux console
		bindkey '\e[1~'   beginning-of-line      # Home 
		bindkey '\e[4~'   end-of-line            # End  
		bindkey '\e[3~'   delete-char            # Del
		bindkey '\e[2~'   overwrite-mode         # Insert  
	;;
	screen)
		bindkey '\e[1~'   beginning-of-line      # Home
		bindkey '\e[4~'   end-of-line            # End
		bindkey '\e[3~'   delete-char            # Del
		bindkey '\e[2~'   overwrite-mode         # Insert
		bindkey '\e[7~'   beginning-of-line      # Home
		bindkey '\e[8~'   end-of-line            # End
		bindkey '\eOc'    forward-word           # ctrl cursor right
		bindkey '\eOd'    backward-word          # ctrl cursor left
		bindkey '\e[3~'   backward-delete-char   # This should not be necessary!
	;;
	rxvt)
		bindkey '\e[7~'   beginning-of-line      # Home
		bindkey '\e[8~'   end-of-line            # End
		bindkey '\eOc'    forward-word           # ctrl cursor right
		bindkey '\eOd'    backward-word          # ctrl cursor left
		bindkey '\e[3~'   backward-delete-char   # This should not be necessary!
		bindkey '\e[2~'   overwrite-mode         # Insert
	;;
	xterm*)
		bindkey '\e[H'    beginning-of-line      # Home
		bindkey '\e[F'    end-of-line            # End
		bindkey '\e[3~'   delete-char            # Del
		bindkey '\e[2~'   overwrite-mode         # Insert
		bindkey "^[[5C"   forward-word           # ctrl cursor right
		bindkey "^[[5D"   backward-word          # ctrl cursor left
		bindkey "^[[1;5C" forward-word           # ctrl cursor right
		bindkey "^[[1;5D" backward-word          # ctrl cursor left
	;;
	sun)
		bindkey '\e[214z' beginning-of-line      # Home
		bindkey '\e[220z' end-of-line            # End
		bindkey '^J'      delete-char            # Del
		bindkey '^H'      backward-delete-char   # Backspace
		bindkey '\e[247z' overwrite-mode         # Insert
	;;
esac

_apex()  {
  COMPREPLY=()
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="$(apex autocomplete -- ${COMP_WORDS[@]:1})"
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

#complete -F _apex apex

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
