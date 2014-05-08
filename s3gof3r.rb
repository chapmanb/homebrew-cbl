require 'formula'

class S3gof3r < Formula
  homepage 'https://github.com/rlmcpherson/s3gof3r'
  version '0.3.2'
  if OS.mac?
    url 'https://github.com/rlmcpherson/s3gof3r/releases/download/v0.3.2/gof3r_0.3.2_darwin_amd64.zip'
    sha1 'aa3fbc973e75ee51fece32c5d78ebdd77b73d68a'
  else
    url 'https://github.com/rlmcpherson/s3gof3r/releases/download/v0.3.2/gof3r_0.3.2_linux_amd64.tar.gz'
    sha1 '3a5df0dce343a4e9be09abb0a66077faa98c74f5'
  end

  def install
    bin.install 'gof3r'
  end

  test do
    system 'gof3r -h'
  end
end
