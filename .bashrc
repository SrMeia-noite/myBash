function depends
{
    if [ "$?" == "0" ]; then
        echo "$1"
    else
        echo "$2"
    fi
}

function quantify 
{
    fileQuantity=-2

    for file in `\ls -a`; do
        ((++fileQuantity))
    done
    if [ "$fileQuantity" -lt 9 ]; then
        echo -n "0"
    fi
    echo "$fileQuantity"
}

function repeatBy 
{  
    template=$1
    colorBy=$2
    quantity=${#3}
    char=$4

    if [ "$quantity" != "0" ]; then echo -ne "$template"; fi
    
    echo -ne "$colorBy"
    for ((i = 0; ++i <= quantity;)); do
        echo -ne "$char"
    done
}

reset=$(echo -ne "\e[00m")
bold=$(echo -ne "\e[1m")
dim=$(echo -ne "\e[2m")
underlined=$(echo -ne "\e[4m")

# Morhetz/gruvbox Pallet
hard=$(echo -ne "\e[38;2;29;32;33m")
medium=$(echo -ne "\e[38;2;40;40;40m")
soft=$(echo -ne "\e[38;2;50;48;47m")
default=$(echo -ne "\e[38;2;235;219;178m")
black=$(echo -ne "\e[38;2;40;40;40m")
dWine=$(echo -ne "\e[38;2;204;36;29m")
wine=$(echo -ne "\e[38;2;251;73;52m")
dLime=$(echo -ne "\e[38;2;152;151;26m")
lime=$(echo -ne "\e[38;2;184;187;38m")
dGold=$(echo -ne "\e[38;2;215;153;33m")
gold=$(echo -ne "\e[38;2;250;189;47m")
dOrange=$(echo -ne "\e[38;2;214;93;14m")
orange=$(echo -ne "\e[38;2;254;128;25m")
dBlue=$(echo -ne "\e[38;2;69;133;136m")
blue=$(echo -ne "\e[38;2;131;165;152m")
dPink=$(echo -ne "\e[38;2;177;98;134m")
pink=$(echo -ne "\e[38;2;211;134;155m")
dCyan=$(echo -ne "\e[38;2;104;157;106m")
cyan=$(echo -ne "\e[38;2;142;192;124m")
dGrey=$(echo -ne "\e[38;2;146;131;116m")
grey=$(echo -ne "\e[38;2;168;153;132m")
white=$(echo -ne "\e[38;2;235;219;178m")

source $HOME/.git-prompt.sh
# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWCOLORHINTS=1
# GIT_PS1_SHOWUNTRACKEDFILES=1
# GIT_PS1_SHOWSTASHEDFILES=1
# GIT_PS1_SHOWUPSTREAM="auto"

UserName='Lord'
HostName='null'

PS1='\[${blue}\]$UserName \[${dGrey}\]at \[${pink}\]$HostName \[${dGrey}\]in \[${gold}\]\w \[${dGrey}\]with \[${orange}\]$(quantify) $(__git_ps1 "\[${dGrey}\]on \[${cyan}\]%s ")\[${reset}\]'
PS2='$(repeatBy "" "\[${dBlue}\]" "$UserName" ":")$(repeatBy "\[${dGrey}\]::::" "\[${dPink}\]" "$HostName" ":")$(repeatBy "\[${dGrey}\]::::" "\[${dGold}\]" "\w" ":")$(repeatBy "\[${dGrey}\]::::::" "\[${dOrange}\]" "$(quantify)" ":")$(repeatBy "\[${dGrey}\]::::" "\[${dCyan}\]" "$(__git_ps1 "%s")" ":")\[${reset}\] '
alias src='clear; source ~/.bashrc'
