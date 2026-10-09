# Maintainer: Helge Spieker <info@hspieker.de>
#
# Repackages the official MiniZinc "bundled binary distribution" (IDE, compiler,
# bundled Qt 6 and solvers) under /opt. To upgrade: bump pkgver, run
# `updpkgsums`, then `makepkg -si`.

pkgname=minizinc-ide-bundle
pkgver=2.10.1
pkgrel=1
pkgdesc="MiniZinc IDE and compiler with bundled solvers (official prebuilt bundle)"
arch=('x86_64')
url="https://www.minizinc.org/"
license=('MPL-2.0')
depends=('glibc' 'gcc-libs' 'zlib' 'gmp' 'expat' 'fontconfig' 'freetype2'
         'libglvnd' 'libx11' 'libxcb' 'hicolor-icon-theme')
provides=("minizinc=${pkgver}" "minizinc-ide=${pkgver}")
conflicts=('minizinc' 'minizinc-ide')
# Prebuilt binaries with bundled libraries: leave them exactly as shipped.
options=('!strip' '!debug')
_bundle="MiniZincIDE-${pkgver}-x86_64-linux-gnu"
source=("https://github.com/MiniZinc/MiniZincIDE/releases/download/${pkgver}/${_bundle}.tgz"
        "minizinc-ide-${pkgver}.png::https://raw.githubusercontent.com/MiniZinc/MiniZincIDE/${pkgver}/resources/icon.png"
        'minizinc-ide.sh'
        'minizinc-ide.desktop')
sha256sums=('b63dd88491d47b05d0eb0ff4aa1112d1e6f77292c023800b20b98851458ce01c'
            'eaa69a6d1b8a3e307d1b400b74273995abb914fbe1246c65fc9b3955b2094023'
            '75c06329d0e9e0aa777f43b6cefe414e97f9e7bdd9f146eb395cb3555836ad32'
            'ba833f132f2de5822e3304f6b9d2818b3c492bb6caaac1b6eddf7fdc5cafca54')

package() {
  install -d "${pkgdir}/opt/minizinc-ide" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/${_bundle}/." "${pkgdir}/opt/minizinc-ide/"

  # IDE launcher (replaces upstream's MiniZincIDE.sh, which mangles arguments
  # containing spaces).
  rm "${pkgdir}/opt/minizinc-ide/MiniZincIDE.sh"
  install -Dm755 "${srcdir}/minizinc-ide.sh" "${pkgdir}/usr/bin/minizinc-ide"

  # Command line tools. The solver binaries (fzn-gecode etc.) stay in /opt:
  # minizinc finds them through /opt/minizinc-ide/share/minizinc/solvers.
  local _tool
  for _tool in minizinc mzn2doc; do
    ln -s "/opt/minizinc-ide/bin/${_tool}" "${pkgdir}/usr/bin/${_tool}"
  done

  install -Dm644 "${srcdir}/minizinc-ide.desktop" \
    "${pkgdir}/usr/share/applications/minizinc-ide.desktop"
  install -Dm644 "${srcdir}/minizinc-ide-${pkgver}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/minizinc-ide.png"
}
