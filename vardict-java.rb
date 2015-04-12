require 'formula'

class VardictJava < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDictJava"
  version "1.2.1"
  url "https://github.com/AstraZeneca-NGS/VarDictJava/raw/master/dist/VarDict-1.2.1.zip"
  sha1 "e0ffded310d95106d52ea651c91ba0f2b4209e1f"

  def install
    inreplace 'bin/VarDict' do |s|
      s.sub! "DEFAULT_JVM_OPTS='\"-Xmx512m\"'", "if [ -n \"$VAR_DICT_OPTS\" ] ; then\n\tDEFAULT_JVM_OPTS=''\nelse\n\tDEFAULT_JVM_OPTS='\"-Xmx512m\"'\nfi"
    end
    lib.install Dir["lib/*.jar"]
    bin.install "bin/VarDict" => "vardict-java"
  end

  test do
    system "vardict-java -h"
  end
end
