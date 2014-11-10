#!/usr/bin/zsh
# echo -ne "%{%F{$1}%K{$2}%}$3%{%f%k%}"
# ZTECH Theme by Zer0t3ch

tchars=0
chars=""


usrname=`whoami` # can be `id -u -n`
host=`hostname`
h=`tput lines`
w=`tput cols`

txtrst="%{`tput sgr0`%}"
txtbld="%{`tput bold`%}"

# Print with color (echos without \n)
# $1 = fg color (d for default)
# $2 = bg color (d for default)

p() {
	if [[ $1 == "d" ]]; then
		if [[ $2 == "d" ]]; then
			echo -ne "$3%"{%f%k%}
		else
			echo -ne %{%K{$2}%}"$3"%{%f%k%}
		fi
	else
		if [[ $2 == "d" ]]; then
			echo -ne %{%F{$1}%}"$3"%{%f%k%}
		else
			echo -ne %{%F{$1}%K{$2}%}"$3"%{%f%k%}
		fi
	fi
}

#p() {
#	if [[ $1 != "d" ]]; then
#		tput setaf $1
#	fi
#	
#	if [[ $2 != "d" ]]; then
#		tput setab $2
#	fi
#	
#	echo -ne "$3"
#	
#	tput sgr0
#}

line_1() {
	local line=""
#	line+="`p 6 0 \(`"
	line+="`p 0 6 "$usrname @ $host"`"
#	line+="`p 6 0 \)`"
	line+="    "
	local pwd="`pwd`"
	echo -ne "$line"
	p 3 d "${pwd}"
}

line_2() {
	local line=""
	line+="`p 1 d \$`"
	echo -ne $line
}

git_gen() {

}

build_prompt() {
	echo -ne "\n"
	line_1
	echo -ne "\n"
	line_2
}

PROMPT='%{%f%b%k%}$(build_prompt) '
