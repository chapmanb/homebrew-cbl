require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'

  if OS.mac?
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.4/sambamba_v0.4.4_osx.tar.bz2'
    sha1 '2eb39b5c8100dca487f3d288f90dfc7cb2a8e4d3'
  else
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.6-beta/sambamba_v0.4.6-beta_centos5-x86_64.tar.bz2'
    sha1 'afd590981b8050867cc3c8d80fed44135a600519'
  end

  def install
    if OS.mac?
      bin.install 'sambamba_v0.4.4' => 'sambamba'
    else
      bin.install 'sambamba_v0.4.6' => 'sambamba'
    end
  end

  test do
    system 'sambamba', 'index'
  end
end
