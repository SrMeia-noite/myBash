depends () {
    if [ "$?" == "0" ]; then
        echo "$1"
    else
        echo "$2"
    fi
}

reset=$(echo -en "\e[00m")
bold=$(echo -en "\e[1m")
dim=$(echo -en "\e[2m")

hard=$(echo -ne "\e[38;2;29;32;33m")
medium=$(echo -ne "\e[38;2;40;40;40m")
soft=$(echo -ne "\e[38;2;50;48;47m")
default=$(echo -ne "\e[38;2;235;219;178m")
black=$(echo -ne "\e[38;2;40;40;40m")
dGrey=$(echo -ne "\e[38;2;146;131;116m")
dWine=$(echo -ne "\e[38;2;204;36;29m")
wine=$(echo -ne "\e[38;2;251;73;52m")
dLime=$(echo -ne "\e[38;2;152;151;26m")
lime=$(echo -ne "\e[38;2;184;187;38m")
dGold=$(echo -ne "\e[38;2;215;153;33m")
gold=$(echo -ne "\e[38;2;250;189;47m")
dBlue=$(echo -ne "\e[38;2;69;133;136m")
blue=$(echo -ne "\e[38;2;131;165;152m")
dPink=$(echo -ne "\e[38;2;177;98;134m")
pink=$(echo -ne "\e[38;2;211;134;155m")
dCyan=$(echo -ne "\e[38;2;104;157;106m")
cyan=$(echo -ne "\e[38;2;142;192;124m")
grey=$(echo -ne "\e[38;2;168;153;132m")
white=$(echo -ne "\e[38;2;235;219;178m")

source $HOME/.git-prompt.sh
UserName='Lord'
HostName='null'

PS1='${reset}[$(depends "${lime}✓" "${wine}✗")${reset}] ⟨${blue}$UserName${reset}${dim}@${reset}${pink}$HostName${reset}⟩ [ ${gold}\w$(__git_ps1 "${reset}:${cyan}%s")${reset} ]${reset} '
PS2='${reset}[${gold}@${reset}] ⟨${blue}$UserName${reset}${dim}@${reset}${pink}$HostName${reset}⟩ | ${gold}\w$(__git_ps1 "${reset}:${cyan}%s")${reset} |${reset} '

alias c='clear'
alias src='c; source ~/.bashrc'

pyc () {
    fullCode=""
    codeBlock=""
    codeBlockChars="    "

    GCodeBlock=""
    GCodeBlockChars="••••"

    exit__="^^"
    spare__="<<"
    cursor__="| "
    repair__=">>"
    counter=000

    echo -e "\nPython version: ${gold}`python3 --version`\n"

    IFS=''
    for counter in {001..100}; do

        pycprompt="${bold}${blue}$counter ${dim}$GCodeBlock${bold}${gold}$cursor__${reset}${bold}"
        read -p "$pycprompt" codeLine

        if [ "$codeLine" == "$spare__" ]; then
            codeBlock="${codeBlock:4}"
            GCodeBlock="${GCodeBlock:4}"
            continue
        fi

        if [ "$codeLine" == "$repair__" ]; then
            codeBlock="$codeBlock$codeBlockChars"
            GCodeBlock="$GCodeBlock$GCodeBlockChars"
            continue
        fi

        if [ "${codeLine:$((${#codeLine} - 1))}" == ":" ]; then
            fullCode="$fullCode\n$codeBlock$codeLine"
            codeBlock="$codeBlock$codeBlockChars"
            GCodeBlock="$GCodeBlock$GCodeBlockChars"
            continue
        fi

        if [ "$codeLine" == "$exit__" ]; then break; fi

        fullCode="$fullCode\n$codeBlock$codeLine"
    done

    choice__="nil"
    while [ "$choice__" != "Y" ] && [ "$choice__" != "N" ]; do
        read -p "${bold}${blue}>=> ${gold}$cursor__${reset}Execute? ${bold}(${lime}Y${reset}${bold}/${wine}N${reset}${bold}):${gold} " choice__
    done
    if [ "$choice__" == "Y" ]; then
        echo -e "$fullCode" >> __pyc__.py
        python3 __pyc__.py
        rm __pyc__.py
    fi
}
