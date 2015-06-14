require 'formula'

class Lofreq < Formula
  homepage "http://csb5.github.io/lofreq/"
  version "2.1.2"
  if OS.mac?
    url "http://downloads.sourceforge.net/project/lofreq/lofreq_star-#{version}_macosx.tgz"
    sha1 "286e86dd106c6d2988defe039dac36901f250734"
  else
    url "http://downloads.sourceforge.net/project/lofreq/lofreq_star-#{version}_linux-x86-64.tgz"
    sha1 "5c81eb3c1377c116646859ff4ca8c62118312ec6"
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    system "lofreq version"
  end
end
