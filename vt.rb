require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2015-01-25'
  url "https://github.com/atks/vt/archive/5f68742.tar.gz"
  sha1 "96ce18ccdb6a6a43db712a22e7a8617a7bff9cb5"

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
