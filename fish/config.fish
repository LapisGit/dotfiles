if status is-interactive
    # Commands to run in interactive sessions can go here
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# terminal-wakatime setup
set -gx PATH "$HOME/.wakatime" $PATH
set -gx EMSDK_QUIET 1
terminal-wakatime init fish | source
source ~/emsdk/emsdk_env.fish
