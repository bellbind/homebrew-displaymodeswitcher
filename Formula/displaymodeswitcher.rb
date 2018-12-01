class Displaymodeswitcher < Formula
  desc "Tiny status bar utility for switching display resolution on macos"
  homepage "https://github.com/bellbind/DisplayModeSwitcher/"
  url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.0.2.tar.gz"
  sha256 "4f1c13348244fb63a8a542c4ce6212ac51374c07900a1d145a5e002436190128"

  devel do
    # [Hidden API version: brew install --devel --no-sandbox displaymodeswitcher]
    url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.0.2h.tar.gz"
    sha256 "08d4cf8f3a3fc7df35f534d6ae8e405d44339a47d04cfe46aaf367dfc92a4ff9"
  end
  
  depends_on :xcode => :build
  depends_on "imagemagick" => :build

  def install
    ohai "[NOTICE: For generating app icon, qlmanage command required to run outside of sandbox]"
    ohai "$ brew install --no-sandbox displaymodeswitcher"
    system "./makeappbundle.sh"
    prefix.install "DisplayModeSwitcher.app"
    bin.install_symlink prefix/"DisplayModeSwitcher.app/Contents/MacOS/DisplayModeSwitcher"
  end

  def caveats
    <<-EOS

[For Launchpad, add DisplayModeSwitcher.app to ~/Applications/ as]:
$ ln -s #{opt_prefix}/DisplayModeSwitcher.app ~/Applications/

    EOS
  end
  
  test do
    system "false"
  end
end
