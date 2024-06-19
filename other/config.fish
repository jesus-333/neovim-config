if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/jesus-wsl-dell/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Stuff for DENO (javascript/typescript)
set -x DENO_INSTALL /home/jesus-wsl-dell/.deno 
set -x PATH $DENO_INSTALL/bin:$PATH

# Launch starsthip at startup
starship init fish | source

# Add go path
set -x GOROOT  /usr/local/go
set -x PATH $PATH $GOROOT/bin

# Rename exa command
if type -q exa
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
	alias llt "exa -T --icons"
end

# CARGO for Rust
set -x PATH $PATH ~/.cargo/bin/
