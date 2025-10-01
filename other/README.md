This folder contains various stuff, also not related to nvim (like config file for other tools, e.g.starship). They are saved in the same repository for convenience.

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -->

# tmux
## Load  config
The tmux config are saved in .tmux.conf
To load the configuration run the command
```
tmux source .config/nvim/other/.tmux.conf
```

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -->

# Yazi
## Install/Update
Run the command
```
rustup update
cargo install --locked yazi-fm yazi-cli
```

## Change config directory
You can change the Yazi configuration directory by exporting the `envYAZI_CONFIG_HOME ` envenvironment variable. 

```
env "YAZI_CONFIG_HOME=~/.config/nvim/other/yazi" yazi
```

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -->

# Ghostty

## Problem with ssh 

From Ghostty [website](https://ghostty.org/docs/help/terminfo#ssh) :

> If you use SSH to connect to other machines that do not have Ghostty's terminfo entry, you will see error messages like missing or unsuitable terminal: xterm-ghostty, Error opening terminal: xterm-ghostty. or WARNING: terminal is not fully functional.
> Hopefully someday Ghostty will have terminfo entries pre-distributed everywhere, but in the meantime there are two ways to resolve the situation:
> 1 - Copy Ghostty's terminfo entry to the remote machine.
> 2 - Configure SSH to fall back to a known terminfo entry.

Between the two solution proposed I like this one :
```bash
infocmp -x xterm-ghostty | ssh YOUR-SERVER -- tic -x -
```
