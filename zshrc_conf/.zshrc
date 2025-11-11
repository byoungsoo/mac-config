# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Q pre block. Keep at the top of this file.
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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

#bys
alias vi="vim"

alias mac_key="/Users/Shared/bin/userkeymapping_mackeyboard"
alias win_key="/Users/Shared/bin/userkeymapping_windowkeyboard"

#short path
alias github_home="cd /Users/bys/workspace/code_repo/github"
alias gitlab_home="cd /Users/bys/workspace/code_repo/gitlab"
alias codecommit_home="cd /Users/bys/workspace/code_repo/codecommit"
alias awscode_home="cd /Users/bys/workspace/code_repo/aws"
alias brazil_home="cd /Users/bys/brazil"
alias ssh_home="cd /Users/bys/workspace/ssh"
alias work_home="cd /Users/bys/workspace/work"
alias case_home="cd /Users/bys/workspace/work/case"
alias key_home="cd /Users/Shared/bin"
alias util_home="cd /Users/bys/workspace/util"
alias hire_home="cd /Users/bys/workspace/work/hiring"

# short path of temp
alias bastion_dev="ssh -i /Users/bys/workspace/aws_account/dev/bys-console.pem ec2-user@3.39.219.95"
alias bastion_shared="ssh -i /Users/bys/workspace/aws_account/shared/bys-shared-console.pem ec2-user@43.200.234.20"

#vscode
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

#kubernetes
alias k="kubectl"
alias kd="kubectl describe"
alias kl="kubectl logs"
alias kg="kubectl get"
alias kc="kubectl config"
alias kcget="kubectl config get-contexts"
alias kcuse="kubectl config use-context"
alias kdel="kubectl delete"
alias krr="kubectl rollout restart"

#terraform
alias tf="terraform"

# rbenv
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Q post block. Keep at the bottom of this file.
# aws-cli instance type
function eniinfo() {
  aws ec2 describe-instance-types --filters "Name=instance-type,Values=$1.*" --query "InstanceTypes[].{Type: InstanceType, MaxENI: NetworkInfo.MaximumNetworkInterfaces, IPv4addr: NetworkInfo.Ipv4AddressesPerInterface}" --output table
}

alias alwayson="sudo pmset -c disablesleep 1"
alias alwaysoff="sudo pmset -c disablesleep 0"

export PATH=$PATH:$HOME/.toolbox/bin

# aws caseinfo
function caseinfo() {
  curl -L --cookie ~/.midway/cookie --cookie-jar ~/.midway/cookie https://global.case-api.support.aws.a2z.com/v1/cases/$1 | jq '. | {"AccountId": .accountId, "CustomerName": .customerName, "ccList": .ccList, "CaseID": .caseId, "Subject": .subject, "Severity": .severity, "CreationDate": .creationDate, "LastUpdatedDate": .lastUpdatedDate, "CaseURL": "https://command-center.support.aws.a2z.com/case-console#/cases/'$1'"}'
}

function caseinfofull() {
  curl -L --cookie ~/.midway/cookie --cookie-jar ~/.midway/cookie https://global.case-api.support.aws.a2z.com/v1/cases/$1 | jq '.'
}

source /Users/bys/.brazil_completion/zsh_completion


# DNS Flush
alias dnsflush="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"


[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
