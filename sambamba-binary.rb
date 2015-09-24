require 'formula'

class SambambaBinary < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.5.8'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_osx.tar.bz2"
    sha256 "43acd0f5d7a88ca4b559527ffc4456d2e66d29e095478b626c73c287d81b775c"
  else
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_linux.tar.bz2"
    sha256 "6badcdfa66dcdc914fe843e9893185cfb595704f3ad3058decf4c288360fb82b"
  end

  def install
    bin.install "sambamba_v#{version}" => "sambamba"
  end

  test do
    system 'sambamba index'
  end
end
