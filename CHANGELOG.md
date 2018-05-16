# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added

- New GUI color scheme
- Support for rg.
- Support for nvim-gtk

### Changed

- Changed mapping starting with co to yo.
- Neomake replaced with ALE.
- Enable sneak label mode.
- Always keep the sign column open.
- Use NVM_DIR over NVM_ROOT.
- Use IGNORE_FILE env var.
- Update ag and rg to use ignore file.
- Add javascript to language group.
- Update to nvimrc v1.3.5

### Fixed

- Broken better whitespace plugin behaivor after upodate.

## [1.1.0] / 2017-06-11

### Added

- Use mhartington/nvim-typescript.
- Add GitHub issues plugin.

### Changed

- Use `standard --fix` for auto-formatting.
- Remove portkey.

### Fixed

- Correct location of Initialization heading.

## 1.0.0 / 2016-11-02

- Initial release.

[Unreleased]: https://github.com/rxrc/nvimrc/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/rxrc/nvimrc/compare/v1.0.0...v1.1.0
