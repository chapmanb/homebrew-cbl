require 'formula'

class Grabix < Formula
  homepage "https://github.com/arq5x/grabix"
  version "0.1.4"
  url "https://github.com/arq5x/grabix/archive/5179949d.tar.gz"
  sha1 "020d524ce5fe843b86af2b3ca5dcc3ca15da73ef"

  def install
    system 'make'
    bin.install 'grabix'
  end

  test do
    system 'grabix'
  end
end
