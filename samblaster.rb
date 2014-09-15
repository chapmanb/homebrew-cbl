require 'formula'

class Samblaster < Formula
  homepage 'https://github.com/GregoryFaust/samblaster'
  url 'https://github.com/GregoryFaust/samblaster/releases/download/v.0.1.20/samblaster-v.0.1.20.tar.gz'
  sha1 '202eef231c7d4e188a7ec1646702642ecf976037'

  def install
    system 'make'
    bin.install 'samblaster'
  end

  test do
    system 'samblaster'
  end
end
