require 'formula'

class VardictJava < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDictJava"
  version "1.2.2"
  url "https://github.com/AstraZeneca-NGS/VarDictJava/raw/master/dist/VarDict-1.2.2.zip"
  sha1 "47cb4120aa8f6814ce1dca89fc54cdbd69877692"

  def install
    lib.install Dir["lib/*.jar"]
    bin.install "bin/VarDict" => "vardict-java"
  end

  test do
    system "vardict-java -h"
  end
end
