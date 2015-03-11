require 'formula'

class SambambaBinary < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.5.2a-2015-02-02'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_osx.tar.bz2"
    sha1 "5d916fc1314913557988382822b9f9f070795ca5"
  else
    url "https://s3.amazonaws.com/cloudbiolinux/cache/sambamba_02_02_2015"
    #url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_linux.tar.bz2"
    sha1 "4906ce721fa48273738eae34e630f0c9ca65f2bc"
  end

  def install
    bin.install "sambamba_02_02_2015" => "sambamba"
    #bin.install "sambamba_v#{version}" => "sambamba"
  end

  test do
    system 'sambamba index'
  end
end
