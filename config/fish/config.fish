# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/pix/.docker/bin"
# End of Docker Desktop section.

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.aliases

fish_add_path --prepend ~/.asdf/shims

set -gx POWERLINE_BINDINGS_PATH ~/.asdf/installs/python/3.11.4/lib/python3.11/site-packages/powerline/bindings
set -gx SHELL /opt/homebrew/bin/fish
set -gx GITHUB_PAT (security find-generic-password -a $USER -s github_pat -w 2>/dev/null)
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx PG_CONFIG ~/.asdf/installs/postgres/15.3/bin/pg_config
# set -gx LDFLAGS -L~/.asdf/installs/postgres/15.3/lib
# set -gx CPPFLAGS -I~/.asdf/installs/postgres/15.3/include
set -gx PKG_CONFIG_PATH /opt/homebrew/bin/pkg-config:(brew --prefix icu4c)/lib/pkgconfig:(brew --prefix curl)/lib/pkgconfig:(brew --prefix zlib)/lib/pkgconfig
set -gx GODEBUG asyncpreemptoff=1
set -gx TERRAGRUNT_DOWNLOAD $HOME/.terraform.d/terragrunt_cache
set -gx RABBITMQ_NODENAME rabbit@localhost
