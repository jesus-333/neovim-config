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
