class Displaymodeswitcher < Formula
  desc "Status bar utility for switching display resolution"
  homepage "https://github.com/bellbind/DisplayModeSwitcher/"
  
  url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.1.0.tar.gz"
  sha256 "8177128915492cf40d1c723b644017716917cd2a8d02484386ffcd1b6758d20b"

  head "https://github.com/bellbind/DisplayModeSwitcher.git"

  devel do
    # [Hidden API version: brew install --devel --no-sandbox displaymodeswitcher]
    url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.1.0h.tar.gz"
    version "1.1.0h"
    sha256 "29ed7e5731a34b2d98a65585b8e82cdcec351fbf259309d6acb68f4681029caa"
  end
  
  depends_on "imagemagick" => :build
  depends_on :xcode => :build

  def install
    ohai ""
    ohai "[NOTICE] For generating app icon, qlmanage command required to run outside of sandbox:"
    ohai "$ brew uninstall displaymodeswitcher"
    ohai "$ brew install --no-sandbox displaymodeswitcher"
    ohai ""
    system "./makeappbundle.sh"
    prefix.install "DisplayModeSwitcher.app"
    bin.install_symlink prefix/"DisplayModeSwitcher.app/Contents/MacOS/DisplayModeSwitcher"
    bin.install_symlink prefix/"DisplayModeSwitcher.app/Contents/MacOS/displaymode"
  end

  def caveats
    <<-EOS

[NOTE] Please add the `DisplayModeSwitcher.app` symlink into `~/Applications/`:
$ ln -sf #{opt_prefix}/DisplayModeSwitcher.app ~/Applications/

 EOS
  end
  
  test do
    system "false"
  end
end
