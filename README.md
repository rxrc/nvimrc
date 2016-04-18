# Neovim Configuration

[![Github releases](https://img.shields.io/github/release/rxrc/nvimrc.svg)](https://github.com/rxrc/nvimrc/releases)
[![GitHub license](https://img.shields.io/github/license/rxrc/nvimrc.svg)](./LICENSE.txt)

> Built from [makenew/nvimrc](https://github.com/makenew/nvimrc).

[Neovim] configuration as a Neovim plugin.

[Neovim]: https://neovim.io/

## Description

This configuration system works as a meta-plugin:
all desired Neovim plugins are loaded from `plugins.vim` using [vim-plug].
Overall configuration then follows a normal plugin structure.

For documentation of this Neovim configuration,
see `:help nvimrc` or view [nvimrc.txt](./doc/nvimrc.txt) directly.

[vim-plug]: https://github.com/junegunn/vim-plug

## Installation

### Automatic Install

You can install this via the command-line with either curl

```
$ curl -L https://git.io/vwYYX | sh
```

or wget

```
$ wget https://git.io/vwYYX -O - | sh
```

You will need to exit Neovim manually with `:qa` after each step.

### Manual Install

1. Install [vim-plug].

2. Create `~/.config/nvim/init.vim` with

  ```vim
  " rxrc/nvimrc

  call plug#begin($XDG_CONFIG_HOME . '/nvim/plugged')

  if filereadable($XDG_CONFIG_HOME . '/nvim/plugged/nvimrc/plugins.vim')
    source $XDG_CONFIG_HOME/nvim/plugged/nvimrc/plugins.vim
    if $NVIMRC_INSTALL != 'true'
      Plug 'rxrc/nvimrc'
    endif
  else
    Plug 'rxrc/nvimrc', { 'on': [] }
  endif

  call plug#end()
  ```

3. Run

  ```
  $ nvim -c PlugInstall
  $ NVIMRC_INSTALL=true nvim -c PlugInstall
  ```

  You will need to exit Neovim manually with `:qa` after each step.

### Updating

Updating is handled via the normal [vim-plug commands].

Here is an example of a shell function that will provide a one-step update:

```zsh
# Upgrade nvimrc.
function nvimupg () {
  if ! [[ -e $XDG_CONFIG_HOME/nvim/autoload/plug.vim ]]; then
    echo 'vim-plug is not installed.'
    return 1
  fi

  nvim -c PlugUpgrade
  nvim -c PlugUpdate
  nvim -c PlugInstall
  nvim -c PlugClean!
}
```

[vim-plug commands]: https://github.com/junegunn/vim-plug#commands

## Development and Testing

### Source Code

The [nvimrc source] is hosted on GitHub.
Clone the project with

```
$ git clone https://github.com/rxrc/nvimrc.git
```

[nvimrc source]: https://github.com/rxrc/nvimrc

### Local Development Mode

You can switch to development mode
which will configure vim-plug to use the local
directory as the plugin path.

First, follow the normal install steps if you haven't already.
Then, switch to development mode with

```
$ ./install.sh dev
```

Switch out of development mode with

```
$ ./install.sh
```

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/rxrc/nvimrc/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
This software can be used freely, see [The Unlicense].
The copyright text appearing below and elsewhere in this repository
is for demonstration purposes only and does not apply to this software.

This Neovim config is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
