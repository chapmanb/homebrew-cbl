require 'formula'

class S3gof3r < Formula
  homepage 'https://github.com/rlmcpherson/s3gof3r'
  version '0.4.8'
  if OS.mac?
    url "https://github.com/rlmcpherson/s3gof3r/releases/download/v#{version}/gof3r_#{version}_darwin_amd64.zip"
    sha1 "4b8e6dcc5ae4436874cbff4d62f8adf435e4a8e2"
  else
    url "https://github.com/rlmcpherson/s3gof3r/releases/download/v#{version}/gof3r_#{version}_linux_amd64.tar.gz"
    sha1 "c2363f30d06928b1461028944fea37281b00ed01"
  end

  def install
    bin.install 'gof3r'
  end

  test do
    system 'gof3r -h'
  end
end
