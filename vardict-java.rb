require 'formula'

class VardictJava < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDictJava"
  version "1.2.4"
  url "https://github.com/AstraZeneca-NGS/VarDictJava/releases/download/v1.2.4/VarDict-1.2.4.zip"
  sha1 "9cf89cd6b261e8da002a2e1bc4c0868ad5367d44"

  def install
    lib.install Dir["lib/*.jar"]
    bin.install "bin/VarDict" => "vardict-java"
  end

  test do
    system "vardict-java -h"
  end
end
