# Neovim Configuration

[![Github releases](https://img.shields.io/github/release/rxrc/nvimrc.svg)](https://github.com/rxrc/nvimrc/releases)
[![GitHub license](https://img.shields.io/github/license/rxrc/nvimrc.svg)](./LICENSE.txt)

> Built from [makenew.github.io](https://makenew.github.io/).

[Neovim] configuration as a Neovim plugin.

[Neovim]: https://neovim.io/

## Description

This configuration system works as a meta-plugin:
all desired Neovim plugins are loaded from `plugins.vim` using [vim-plug],
and any GUI specific options are set in `gui.vim`.
Overall configuration then follows a normal plugin structure.

For documentation of this Neovim configuration,
see `:help nvimrc` or view [nvimrc.txt](./doc/nvimrc.txt) directly.

[vim-plug]: https://github.com/junegunn/vim-plug

## Requirements

### GUI

A GUI is optional, but this config is also tested with [neovim-qt].

[neovim-qt]: https://github.com/equalsraf/neovim-qt

### Fonts

The GUI font is [Inconsolata-g],
and vim-airline is set to use [Powerline fonts].

[Inconsolata-g]: https://github.com/powerline/fonts/tree/master/Inconsolata-g
[Powerline fonts]: https://github.com/powerline/fonts

### GitHub Issues

To use GitHub issues integration with private repositories,
create `~/.config/github/tokens/github-issues.vim`
containing a [GitHub personal access token].

[GitHub personal access token]: https://github.com/settings/tokens

### Packages

- [curl] for downloading unicode data.
- [ripgrep] or [The Silver Searcher (aka Ag)][ag], or [ack], or grep.
- The [fzf] binary (vim-plug is not configured to manage it here).
  Additionally, [urxvt] is configured as the fzf launcher for the GUI.
  For fzf dictionary completion: `/usr/share/dict/words`.
- See [vim-fireplace] for the Clojure specific plugin dependences.
- Supports local [Node.js] binaries installed with [npm].
- Supports [nvm] if installed.
- Supports [pyenv] if installed.
- Supports [rbenv] if installed ([rbenv-bundler] recommended).

[ack]: http://beyondgrep.com/
[ag]: http://geoff.greer.fm/ag/
[curl]: https://curl.haxx.se/
[fzf]: https://github.com/junegunn/fzf
[Node.js]: https://nodejs.org/
[npm]: https://www.npmjs.com/
[nvm]: https://github.com/creationix/nvm/
[pyenv]: https://github.com/yyuu/pyenv
[rbenv]: https://github.com/carsomyr/rbenv-bundler
[rbenv-bundler]: https://github.com/carsomyr/rbenv-bundler
[ripgrep]: https://github.com/BurntSushi/ripgrep
[urxvt]: http://software.schmorp.de/pkg/rxvt-unicode.html
[vim-fireplace]: https://github.com/tpope/vim-fireplace

## Installation

### Automatic Install

You can install this via the command-line with either curl

```
$ curl -L https://git.io/vwYRO | sh
```

or wget

```
$ wget https://git.io/vwYRO -O - | sh
```

### Manual Install

1. Install [vim-plug].

2. Create `~/.config/nvim/init.vim` with

   ```vim
   " rxrc/nvimrc

   if empty($XDG_CONFIG_HOME)
     let $XDG_CONFIG_HOME = $HOME . '/.config'
   endif

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

   and `~/.config/nvim/ginit.vim` with

   ```vim
   " makenew/nvimrc

   if empty($XDG_CONFIG_HOME)
     let $XDG_CONFIG_HOME = $HOME . '/.config'
   endif

   source $XDG_CONFIG_HOME/nvim/plugged/nvimrc/gui.vim
   ```

3. Run

   ```
   $ nvim -c PlugInstall
   $ NVIMRC_INSTALL=true nvim -c PlugInstall
   ```

### Updating

Updating is handled via the normal [vim-plug commands].

Here is an example of a shell function that will provide a one-step update:

```zsh
# Upgrade nvimrc.
nvimupg () {
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

## License

This Neovim config is licensed under the MIT license.

## Warranty

This software is provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are
disclaimed. In no event shall the copyright holder or contributors be liable for
any direct, indirect, incidental, special, exemplary, or consequential damages
(including, but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of this
software, even if advised of the possibility of such damage.
