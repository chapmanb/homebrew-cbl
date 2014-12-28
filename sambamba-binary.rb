require 'formula'

class SambambaBinary < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.5.0'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v5.0.0_osx.tar.bz2"
    sha1 "74f27217af0eba7e616845f3aea4be1293e30e45"
  else
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v5.0.0_linux.tar.bz2"
    sha1 "848f7e14fdfddad5233226e97f332f8f6c437736"
  end

  def install
    bin.install "sambamba_v5.0.0" => 'sambamba'
  end

  test do
    system 'sambamba index'
  end
end
