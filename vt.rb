require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2015-07-02'
  url "https://github.com/atks/vt/archive/e21fe8f.tar.gz"
  sha1 "5385ec9fdad65e3398885c32ca128b7fd137519b"

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  resource "vt-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/vt-centos5-2015.07.02"
    sha1 "45a34cdf253f08ae88048b4a035ffa4bf65977ed"
  end

  def install
    if build.with? "binary"
      resource("vt-binary").stage { bin.install "vt-centos5-2015.07.02" => "vt"}
    else
      system 'make'
      bin.install 'vt'
    end
  end

  test do
    system 'vt'
  end
end
