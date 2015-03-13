require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2015-03-12'
  url "https://github.com/atks/vt/archive/10b7b2b.tar.gz"
  sha1 "d56ec15c38db4339a041a030a8db5f5216f2e981"

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  resource "vt-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/vt-centos5-2015-03-12"
    sha1 "ba3060c4074fa8f9b4d6d0ce38730ee856e1dad8"
  end

  def install
    if build.with? "binary"
      resource("vt-binary").stage { bin.install "vt-centos5-#{version}" => "vt"}
    else
      system 'make'
      bin.install 'vt'
    end
  end

  test do
    system 'vt'
  end
end
