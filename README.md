# Dotfiles

Complete rip of https://github.com/alexdesousa/dotfiles

Completely acknowledge and respect.

> In computing, a hidden folder or hidden file is a folder or file which
> filesystem utilities do not display by default when showing a directory
> listing.
>
> They are commonly used for storing user preferences or preserving the state of
> a utility, and are frequently created implicitly by using various utilities.

This repository configures **Ubuntu Focal** in my laptop automatically using
Ansible e.g:

```
# ./bin/bootstrap.sh
```

Requires the following environment variables set into the file `.envrc` at the
root of this project.

```bash
# .envrc file
export DOTFILES_BOOTSTRAP_USER="<OS username>"
export DOTFILES_BOOTSTRAP_GIT_NAME="<Git name>"
export DOTFILES_BOOTSTRAP_GIT_EMAIL="<Git email>"
```

> **NOTE**: The reason for not having defaults for these variables is to avoid
> commiting personal data to the repository.

When `./bin/bootstrap.sh` is executed with a tag, will install all roles
necessary for that tag. This is useful for specific updates e.g:

```
# ./bin/bootstrap.sh -t zsh
```

> For more information just run `./bin/bootstrap.sh -h`

## Overriding Variables

All predefined variables can be overriden by creating the file `vars/custom.yml`
with the overrides inside e.g:

```yaml
---

docker_compose_version: 1.25.3
fzf_bat_version: 0.12.0
```

## Base Role

Installs and configures my base system. The available `vars/custom.yml`
overrides are:

- `base_repositories`: Defaults to the repositories for Focal. 
- `base_dependencies`: Defaults to some default base dependencies.

## Git Role

Installs and configures git. Depends on the following OS environment variables:

- `$DOTFILES_BOOTSTRAP_GIT_NAME`: Git user name.
- `$DOTFILES_BOOTSTRAP_GIT_EMAIL`: Git email.

Relevant files:

- `roles/git/templates/gitconfig.j2`: Template for generating git's config.
- `roles/git/files/gitignore_global.link`: File for ignoring files globally.

## ZSH Role

Installs and configures ZSH with `oh-my-zsh`. 

Relevant files:

- `roles/zsh/templates/zshrc.j2`: Template for my zsh configuration.
- `roles/zsh/files/aliases.zsh`: My aliases.

Other relevant files gathered from other roles:

- `roles/docker/files/docker.zsh`: Docker configuration.
- `roles/fzf/files/fzf.zsh`: FZF configuration.

## Tmux Role

Installs and configures Tmux.

Relevant files:

- `roles/tmux/files/tmux.conf.link`: File for tmux configuration.

## FZF Role

Installs and configures FZF with `fd` and `bat` support. The available
`vars/custom.yml` overrides are:

- `fzf_bat_version`: `bat` version to be used.

## Docker Role

Installs and configures docker. The available `vars/custom.yml` overrides are:

- `docker_dependencies`: Defaults to the apt dependencies for docker.
- `docker_repository`: Defaults to docker's Debian buster repository.
- `docker_packages`: Defaults to docker's packages to be installed.
- `docker_compose_version`: `docker-compose` version to be used.

## NeoVIm Role

Installs and configures Neovim and its plugins.

Relevant files:

## Author

Orignal : Alexander de Sousa.
This version: Satish Viswanathan

## License

`Dotfiles` is released under the MIT License. See the LICENSE file for further
details.
