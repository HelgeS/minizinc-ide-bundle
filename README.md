# minizinc-ide-bundle

Arch Linux PKGBUILD that repackages the official
[MiniZinc](https://www.minizinc.org/) bundled binary distribution (IDE,
compiler, bundled Qt 6 and solvers) so that pacman tracks it.

## Install

```sh
makepkg -si
```

This installs the bundle to `/opt/minizinc-ide` and provides `minizinc-ide`,
`minizinc` and `mzn2doc` in `/usr/bin`, plus a desktop entry. The bundled
solver binaries stay in `/opt`, where `minizinc` finds them by itself.

## Upgrade

Set `pkgver` in `PKGBUILD` to the new
[release](https://github.com/MiniZinc/MiniZincIDE/releases), then:

```sh
updpkgsums
makepkg -si
```
