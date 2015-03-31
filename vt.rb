require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2015-03-26'
  url "https://github.com/atks/vt/archive/00a4e00.tar.gz"
  sha1 "07353e048f28d768ae80424d4553d803c224cce2"

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  resource "vt-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/vt-centos5-2015.03.26"
    sha1 "657cc356ceeb4307bd70bf3a30e5117dc0ed76fb"
  end

  def install
    if build.with? "binary"
      resource("vt-binary").stage { bin.install "vt-centos5-2015.03.26" => "vt"}
    else
      system 'make'
      bin.install 'vt'
    end
  end

  test do
    system 'vt'
  end
end
