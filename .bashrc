# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
. "$HOME/.cargo/env"

export COMMUNITY="/home/ajl/Projects/Community"
function add-comm {
	export PATH="$COMMUNITY/$1/:$PATH"
}

add-comm "lite-xl/lite-xl/bin"
add-comm "neovide/target/release"
add-comm "yadm"

alias vim=nvim

function lite {
	arg_path="$@"
	curr_path="$(pwd)"
	args="${arg_path:=$curr_path}"
	lite-xl "$args" & disown
}
export -f lite

function naut {
	arg_path="$@"
	curr_path="$(pwd)"
	args="${arg_path:=$curr_path}"
	nautilus "$args" & disown
}
export -f naut


