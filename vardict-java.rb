require 'formula'

class VardictJava < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDictJava"
  version "1.3"
  url "https://github.com/AstraZeneca-NGS/VarDictJava/releases/download/v1.3.0/VarDict-1.3.zip"
  sha1 "9f31949174b2b8a584c50fa22556fd2e4c49ca0e"

  def install
    lib.install Dir["lib/*.jar"]
    bin.install "bin/VarDict" => "vardict-java"
  end

  test do
    system "vardict-java -h"
  end
end
