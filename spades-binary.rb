require 'formula'

class SpadesBinary < Formula
  homepage "http://bioinf.spbau.ru/en/spades"
  version "3.5.0"
  if OS.mac?
    url "http://spades.bioinf.spbau.ru/release#{version}/SPAdes-#{version}-Darwin.tar.gz"
    sha256 "693063ca7c79eacf645676aebf024acd69b19dc0e8c1bc9c8b1b2313ad5f5e27"
  else
    url "http://spades.bioinf.spbau.ru/release#{version}/SPAdes-#{version}-Linux.tar.gz"
    sha256 "16e95fe922c0ca1837fe9eccbcd00e0a95791e2ab5e99ff8a7f3cd0c5f6c581d"
  end

  def install
    bin.install Dir["bin/*"]
    share.install "share"
  end

  test do
    system "spades.py", "--test"
    rm bin/"spades_init.pyc"
  end
end
