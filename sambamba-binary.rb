require 'formula'

class SambambaBinary < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.5.2a-2015-03-18'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_osx.tar.bz2"
    sha1 "5d916fc1314913557988382822b9f9f070795ca5"
  else
    url "https://s3.amazonaws.com/cloudbiolinux/cache/sambamba_0.5.2a-2015-03-18"
    sha1 "b3f9628e41956c0e4c0f49976f6bc406514efa97"
  end

  def install
    bin.install "sambamba_#{version}" => "sambamba"
  end

  test do
    system 'sambamba index'
  end
end
