require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.4.7'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_osx.tar.bz2"
    sha1 'f2109903023ea0006d94224f3823a2353abe1809'
  else
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_centos5.tar.bz2"
    sha1 '0191c4dd99d40516e912f19725b6115ba4622fd0'
  end

  def install
    bin.install "sambamba_v#{version}" => 'sambamba'
  end

  test do
    system 'sambamba index'
  end
end
