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

function haste() {
    text=$(cat)
    curl -X POST --http1.0 -s -d "$text" http://p.yawk.at/documents | awk -F '"' '{print "http://p.yawk.at/"$4}'
}

alias zipls="unzip -l $1"
alias mvncp="mvn-color clean package"
alias mvnci="mvn-color clean install"

alias browser-open="firefox -private-window '$1'"

alias rsync-mtp-synchronize="rsync-synchronize --exclude='**/.*' --exclude='**/.*/***' --size-only"

alias ccd="cd "`pwd`""

function javapz() {
    jar="$1"
    class=`echo "$2" | sed 's_\._/_g'`.class
    unzip -p $jar "$class" > tmpjavapz.class
    javap $3 -private -l -c tmpjavapz
    rm -f tmpjavapz.class
}

fpath=($(readlink -f $(dirname $0)/completion) $fpath)
autoload -U compinit
compinit
zstyle ':completion:*' menu select=2
