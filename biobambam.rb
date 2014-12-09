require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam'
  version '0.0.182'
  url "https://github.com/gt1/biobambam/releases/download/0.0.182-release-20141201100458/biobambam-0.0.182-release-20141201100458-x86_64-etch-linux-gnu.tar.gz"
  sha1 "1aba534e4d3a1d78d0b6cfc2eea3d8e69ddebb1d"

  depends_on 'staden_io_lib'

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/bam*"]
    man.install_symlink Dir["#{libexec}/share/man/man*/bam*"]
  end

  test do
    system 'bamtofastq -h'
  end
end
