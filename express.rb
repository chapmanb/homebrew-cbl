require 'formula'

class Express < Formula
  homepage 'http://bio.math.berkeley.edu/eXpress/'
  version '1.5.1'
  if OS.mac?
    url 'http://bio.math.berkeley.edu/eXpress/downloads/express-1.5.1/express-1.5.1-macosx_x86_64.tgz'
    sha1 '44c20f99b5c775cd69ff03300225f52c23f61131'
  else
    url 'http://bio.math.berkeley.edu/eXpress/downloads/express-1.5.1/express-1.5.1-linux_x86_64.tgz'
    sha1 '380b992a804ad390cae0b402d314808a6ca31341'
  end

  def install
      bin.install "express" => 'express'
  end 

  test do
    system 'express -h'
  end
end
