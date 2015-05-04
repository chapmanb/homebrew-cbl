require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam2'
  version '2.0.8'
  url "https://github.com/gt1/biobambam2/releases/download/2.0.8-release-20150427235350/biobambam2-2.0.8-release-20150427235350-x86_64-etch-linux-gnu.tar.gz"
  sha1 "b6c8d886baf11dd4e26b921b91ffada67f99a6b1"

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/bam*"]
    man.install_symlink Dir["#{libexec}/share/man/man*/bam*"]
  end

  test do
    system 'bamtofastq -h'
  end
end
