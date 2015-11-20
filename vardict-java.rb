require 'formula'

class VardictJava < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDictJava"
  version "1.4.1"
  url "https://github.com/AstraZeneca-NGS/VarDictJava/releases/download/v1.4.2/VarDict-1.4.2.zip"
  sha256 "df9940dd1dc281848e9b0951659c130a891b8ab61161c771f5ceda7c5df874a0"

  def install
    lib.install Dir["lib/*.jar"]
    bin.install "bin/VarDict" => "vardict-java"
  end

  test do
    system "vardict-java -h"
  end
end
