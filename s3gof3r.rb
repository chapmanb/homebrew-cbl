require 'formula'

class S3gof3r < Formula
  homepage 'https://github.com/rlmcpherson/s3gof3r'
  version '0.4.0'
  if OS.mac?
    url "https://github.com/rlmcpherson/s3gof3r/releases/download/v#{version}/gof3r_#{version}_darwin_amd64.zip"
    sha1 '9ebb0b4fef9b5dd1e90bf39b6d5d1379da8b4c95'
  else
    url "https://github.com/rlmcpherson/s3gof3r/releases/download/v#{version}/gof3r_#{version}_linux_amd64.tar.gz"
    sha1 '98f5626407fe1148549a6a8b272f926dc024e13c'
  end

  def install
    bin.install 'gof3r'
  end

  test do
    system 'gof3r -h'
  end
end
