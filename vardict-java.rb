require 'formula'

class VardictJava < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDictJava"
  version "1.4.1"
  url "https://github.com/AstraZeneca-NGS/VarDictJava/releases/download/v1.4.1/VarDict-1.4.1.zip"
  sha256 "c2a1b47c0df0e79ee13d0c4256c7e0068a63914316b462ad936fcc20c61abed9"

  def install
    lib.install Dir["lib/*.jar"]
    bin.install "bin/VarDict" => "vardict-java"
  end

  test do
    system "vardict-java -h"
  end
end
