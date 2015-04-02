class Skewer < Formula
  homepage "http://sourceforge.net/projects/skewer/"
  version "0.1.123"
  url "https://downloads.sourceforge.net/project/skewer/Binaries/skewer-#{version}-linux-x86_64"
  sha256 "a188508269ff55c88f73277ac21474ad521bbfed83ae8810b773290db22a7880"

  def install
    bin.install "skewer-#{version}-linux-x86_64" => "skewer"
  end

  test do
    system "#{bin}/skewer --help"
  end
end
