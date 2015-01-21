require 'formula'

class Lofreq < Formula
  homepage "http://csb5.github.io/lofreq/"
  version "2.1.1"
  if OS.mac?
    url "http://downloads.sourceforge.net/project/lofreq/lofreq_star-#{version}_macosx.tgz"
    sha1 "2e4a73f1f0eb73c7e579fa342e6700169bda0a06"
  else
    url "http://downloads.sourceforge.net/project/lofreq/lofreq_star-#{version}_linux-x86-64.tgz"
    sha1 "a2ea71b66a62536a4f111e714ea207964d3715b5"
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    system "lofreq version"
  end
end
