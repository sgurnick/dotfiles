if [ -f /etc/zprofile ] ; then
	. /etc/zprofile
fi

###### SSH Aliases #############

# Reference ~/.ssh/config
alias diitseg01='ssh lxw'

# Reference ~/.ssh/config
alias jmp='ssh uclalibjmp'

alias jmpto='ssh -A -t uclalibjmp ssh'

alias jmpscp="scp -o 'ProxyJump jump.library.ucla.edu:31926'"

alias jmpansible='ssh -A -t uclalibjmp ssh p-u-ansible01'

alias sshfwtunnel='ssh -L 127.0.0.1:8443:172.20.251.167:443 sgurnick@jump.noc.ucla.edu'

###### Proxy Aliases ###########

# Web Proxy via Jump
alias jmpstartproxy='ssh -D 10181 -q -C -N -f -p 31926 jump.library.ucla.edu && networksetup -setsocksfirewallproxystate Wi-Fi on'
alias jmpstopproxy='networksetup -setsocksfirewallproxystate Wi-Fi off && pkill -15 -f "\-D 10181"'
alias jmpstatusproxy='pgrep -f "\-D 10181" ; networksetup -getsocksfirewallproxy Wi-Fi'

# RDP Proxy to Windows VM Workstation via Jump
alias jmprdpstart='ssh -L 15589:164.67.33.206:5589 -q -C -N -f -p 31926 jump.library.ucla.edu'
alias jmprdpstop='pkill -15 -f "\-L 15589"'
alias jmprdpstatus='pgrep -f "\-L 15589"'

# Web Proxy via diit-seg01
alias lxstartproxy='ssh -D 10181 -q -C -N -f lxw && networksetup -setsocksfirewallproxystate Wi-Fi on'
alias lxstopproxy='networksetup -setsocksfirewallproxystate Wi-Fi off && pkill -15 -f "\-D 10181"'
alias lxstatusproxy='pgrep -f "\-D 10181" ; networksetup -getsocksfirewallproxy Wi-Fi'

# RDP Proxy to Windows VM Workstation via diit-seg01
alias lxwrdpstart='ssh -L 15589:164.67.33.206:5589 -q -C -N -f lxw'
alias lxwrdpstop='pkill -15 -f "\-L 15589"'
alias lxwrdpstatus='pgrep -f "\-L 15589"'

###############################

#### Kubernetes Aliases ###########
alias k="kubectl"
alias kgetalln="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n"
alias kgetcont="kubectl config current-context"
alias klistcont="kubectl config get-contexts"
alias kchcont="kubectl config use-context"
##############################

alias git=hub

alias sdig='dig +short'

#export PS1="\A \W \\$ \[$(tput sgr0)\]"

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

# ENV VAR to allow kubectl to route traffic through the jump socks proxy
#export HTTPS_PROXY=socks5://localhost:10181
