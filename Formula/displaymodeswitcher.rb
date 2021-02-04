class Displaymodeswitcher < Formula
  desc "Status bar utility for switching display resolution"
  homepage "https://github.com/bellbind/DisplayModeSwitcher/"
  
  url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.1.2.tar.gz"
  sha256 "174f3d8d4f5ab212eb7ad94ae31b0f93045258a7bb096fe24b4fb21bc100063e"

  head "https://github.com/bellbind/DisplayModeSwitcher.git"

  headl do
    # [Hidden API version: brew install --devel displaymodeswitcher]
    url "https://github.com/bellbind/DisplayModeSwitcher/archive/1.1.2h.tar.gz"
    version "1.1.2h"
    sha256 "e50071c7cf78b222ead68778f222df662f32f6ee1a62048701265d609a5a3292"
  end
  
  depends_on "imagemagick" => :build
  depends_on "webkit2png" => :build
  depends_on :xcode => :build

  def install
    system "./makeappbundle.sh"
    prefix.install "DisplayModeSwitcher.app"
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
