class Displaymodeswitcher < Formula
  desc "Status bar utility for switching display resolution"
  homepage "https://github.com/bellbind/DisplayModeSwitcher/"
  
  url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.1.1.tar.gz"
  sha256 "d62af228191ad5c19a69021b73ec82f603119b2ff3d68b83e9c871381a469ea7"

  head "https://github.com/bellbind/DisplayModeSwitcher.git"

  devel do
    # [Hidden API version: brew install --devel displaymodeswitcher]
    url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.1.1h.tar.gz"
    version "1.1.1h"
    sha256 "8e7d15910251486f9fadac91cd3e7e5a8ceadcf866835a5b8d9739119f1b4847"
  end
  
  depends_on "imagemagick" => :build
  depends_on "webkit2png" => :build
  depends_on :xcode => :build

  def install
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
