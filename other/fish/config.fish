if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

starship init fish | source

# Rename exa command
if type -q exa
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
	alias llt "exa -T --icons"
end

fzf --fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/alberto.zancanaro/miniforge3/bin/conda
    eval /Users/alberto.zancanaro/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/alberto.zancanaro/miniforge3/etc/fish/conf.d/conda.fish"
        . "/Users/alberto.zancanaro/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/alberto.zancanaro/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<
#
fnm env --use-on-cd --shell fish | source

# Created by `pipx` on 2026-03-05 08:23:25
set PATH $PATH /Users/alberto.zancanaro/.local/bin

set -gx EDITOR nvim
