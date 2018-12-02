class Displaymodeswitcher < Formula
  desc "Tiny status bar utility for switching display resolution on macos"
  homepage "https://github.com/bellbind/DisplayModeSwitcher/"
  url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.1.0.tar.gz"
  sha256 "8177128915492cf40d1c723b644017716917cd2a8d02484386ffcd1b6758d20b"

  devel do
    # [Hidden API version: brew install --devel --no-sandbox displaymodeswitcher]
    url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.1.0h.tar.gz"
    sha256 "29ed7e5731a34b2d98a65585b8e82cdcec351fbf259309d6acb68f4681029caa"
  end
  
  depends_on :xcode => :build
  depends_on "imagemagick" => :build

  def install
    ohai <<-EOS
[NOTICE] For generating app icon, qlmanage command required to run outside of sandbox:
$ brew uninstall displaymodeswitcher
$ brew install --no-sandbox displaymodeswitcher
EOS
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
