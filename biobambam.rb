require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam2'
  version '2.0.14'
  url "https://github.com/gt1/biobambam2/releases/download/2.0.14-release-20150809134108/biobambam2-2.0.14-release-20150809134108-x86_64-etch-linux-gnu.tar.gz"
  sha256 "fb8c5bf671f95445765f8ebe833c1107f987747ae636e865b559230f210c7019"

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/bam*"]
    man.install_symlink Dir["#{libexec}/share/man/man*/bam*"]
  end

  test do
    system 'bamtofastq -h'
  end
end
