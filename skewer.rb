require 'formula'

class Skewer < Formula
  homepage 'http://sourceforge.net/projects/skewer/'
  version '0.1.117'
  url "http://downloads.sourceforge.net/project/skewer/Binaries/skewer-#{version}-linux-x86_64"
  sha1 '05fe185d19a43f23a3b6486ce813ee9068d47e72'

  def install
    bin.install "skewer-#{version}-linux-x86_64" => 'skewer'
  end
end
