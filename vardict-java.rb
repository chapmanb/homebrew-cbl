require 'formula'

class VardictJava < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDictJava"
  version "1.4.0"
  url "https://github.com/AstraZeneca-NGS/VarDictJava/releases/download/v1.4.0/VarDict-1.4.zip"
  sha1 "0822e81303e7029b57ef704acf6091ce0c364049"

  def install
    lib.install Dir["lib/*.jar"]
    bin.install "bin/VarDict" => "vardict-java"
  end

  test do
    system "vardict-java -h"
  end
end
