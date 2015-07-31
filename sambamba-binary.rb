require 'formula'

class SambambaBinary < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.5.6'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_osx.tar.bz2"
    sha256 "a61e71fb09ac9d4eeacc79d58d388b79b296e788663bd315633d25f5134196e6"
  else
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_linux.tar.bz2"
    sha256 "5053472f33fb40b92489268b1de186143198616335911d8fd016ea7a63424f6a"
  end

  def install
    bin.install "sambamba_v#{version}" => "sambamba"
  end

  test do
    system 'sambamba index'
  end
end
