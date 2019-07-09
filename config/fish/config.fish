set -x LANG en_US.UTF-8

#aliases
source ~/.aliases

# install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# rust config
set -g CARGO_HOME $HOME/.asdf/installs/rust/1.34.0
set -g RUSTUP_HOME $HOME/.rustup

#github access
set -gx CONVENTIONAL_GITHUB_RELEASER_TOKEN 99e70207ca870b1c07787e14231d97b2e55d0538

# export PATH
set -gx PATH ~/.local/bin $CARGO_HOME/bin $PATH

#tmux
powerline-config tmux setup

#asdf
source ~/.asdf/asdf.fish
