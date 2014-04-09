require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.4.6-beta'

  if OS.mac?
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.4/sambamba_v0.4.4_osx.tar.bz2'
    sha1 'c53276127050e8753cb5f56cd7259e46eed4a67f'
  else
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.6-beta/sambamba_v0.4.6-beta_centos5-x86_64.tar.bz2'
    sha1 'afd590981b8050867cc3c8d80fed44135a600519'
  end

  def install
    bin.install 'sambamba_v0.4.6' => 'sambamba'
  end

  test do
    system 'sambamba', 'index'
  end
end
