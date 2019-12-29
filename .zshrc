# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/anon/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="aussiegeek"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#########################################################################

# other costumisations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
RANGER_LOAD_DEFAULT_RC=false

# custom exports
export BROWSER=lynx googler  query

# custom sources
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# cusom aliases
alias getmail="mbsync privat && mbsync tinfoil" 
alias cast-sina="doas openvpn  ~/Seafile/keepass/sina.ovpn"
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias lautsprecher-int="doas sysctl hw.snd.default_unit=0"
alias lautsprecher-kopf="doas sysctl hw.snd.default_unit=1"
alias lautsprecher-ext="doas sysctl hw.snd.default_unit=4"
alias xfix="xrandr --output LVDS1 --auto --output VGA1 --above LVDS1"
alias xfixer="xrandr --output VGA1 --off --output HDMI3 --off --output LVDS1 --auto"
alias get-sound-device="cat /dev/sndstat"
alias update="doas pkg update"
alias upgrade="doas pkg upgrade"
alias install="doas pkg install"
alias update-mpd="mpc -h /usr/home/anon/.config/mpd/socket update"
alias convert-html="pandoc --to=html --from=markdown --css ~/Dokumente/blog/css/tinfoil.css -o ~/Dokumente/blog/posts/new.html &&"
alias calendar="khal interactive"
alias brightness_100="doas sysctl hw.acpi.video.lcd0.brightness=100"
alias brightness_90="doas sysctl hw.acpi.video.lcd0.brightness=90"
alias brightness_80="doas sysctl hw.acpi.video.lcd0.brightness=80"
alias brightness_70="doas sysctl hw.acpi.video.lcd0.brightness=70"
alias brightness_60="doas sysctl hw.acpi.video.lcd0.brightness=60"
alias brightness_50="doas sysctl hw.acpi.video.lcd0.brightness=50"
alias brightness_40="doas sysctl hw.acpi.video.lcd0.brightness=40"
alias brightness_30="doas sysctl hw.acpi.video.lcd0.brightness=30"
alias brightness_20="doas sysctl hw.acpi.video.lcd0.brightness=20"
alias brightness_10="doas sysctl hw.acpi.video.lcd0.brightness=10"



# custom functions
function dotfiles_autoupdate {
    config add -u && \
    config commit -m "Update $(date +"%Y-%m-%d %H:%M") $(uname -s)/$(uname -m)" && \
    config push
}
# convert to html
function convert-to-html {
    export DATE_TIME="$(date +'%Y-%m-%d_%H:%M')"
    pandoc --to=html --from=markdown --css ~/Dokumente/blog/css/tinfoil.css -o ~/Dokumente/blog/out.html $1 
    mv ~/Dokumente/blog/out.html ~/Dokumente/blog/$1
    mv ~/Dokumente/blog/$1 ~/Dokumente/blog/posts/$(echo "$1" | cut -f 1 -d '.').html
    printf "file $(~/Dokumente/blog/posts/$(echo $1 | cut -f 1 -d '.').html) successfully created"
    exit 0
}
