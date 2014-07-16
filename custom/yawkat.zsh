ZSH_THEME=""

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT="%{$fg_bold[green]%}%~%{$fg_no_bold[green]%}%# %{$reset_color%}"
RPROMPT="%{$fg_no_bold[green]%}%n@%m%{$reset_color%}"

source "$ZSH/plugins/mvn/mvn.plugin.zsh"
#alias mvn="mvn-color"

source "$ZSH/plugins/rsync/rsync.plugin.zsh"
source "$ZSH/plugins/sudo/sudo.plugin.zsh"

UPDATE_ZSH_DAYS=1
DISABLE_AUTO_UPDATE="false"

export HASTE_SERVER="http://p.yawk.at"

function myip() {
    curl "http://yawk.at/misc/myip.php"
}

function dirunzip() {
    file="$1"
    basename=`basename --suffix=".zip" "$file"`
    absolute_path_to_zip=`readlink -f "$file"`

    mkdir -p "$basename" && cd "$basename" && unzip "$absolute_path_to_zip" && cd ..
}

alias zipls="unzip -l $1"
alias mvncp="mvn-color clean package"
alias mvnci="mvn-color clean install"
