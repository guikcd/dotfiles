# inclusion of /etc/skel/.bashrc from Debian is good as it is...

# Debian packaging
export EMAIL="gui@iroqwa.org"
export QUILT_PATCHES=debian/patches
export QUILT_REFRESH_ARGS="-p ab --no-timestamps --no-index"
export DEB_BUILD_OPTIONS="parallel=$(grep --count processor /proc/cpuinfo)"

export EDITOR=vi

export HISTFILESIZE=9999999
export HISTSIZE=9999999
export HISTTIMEFORMAT='%F %T '

# keep colors
export LESS="-R"

source ~/liquidprompt/liquidprompt

# if seahorse or other is not working, use ssh-agent from openssh-client
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
	eval $(ssh-agent)
	ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep --quiet "The agent has no identities" && ssh-add

# ping default gateway
alias ping_gw="ping -c 3 $(ip route list | awk '$0 ~ /default via/ {print $3}')"

# if tmux, use <host> in "ssh <host>" to rename current window
if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]
then
	ssh() {
	    tmux rename-window "$*"
	    command ssh "$@"
	    exit
	}
fi
