require 'formula'

class Speedseq < Formula
  homepage "https://github.com/cc2qe/speedseq"
  version "2014-08-22"
  url "https://github.com/cc2qe/speedseq/archive/4c95193a.tar.gz"
  sha1 "122233d61ffa64bcd8508d3f9ff6af13a531f676"

  depends_on 'lumpy-sv' => :optional
  depends_on 'sambamba' => :optional

  def install
    inreplace 'bin/speedseq.config' do |s|
      s.change_make_var! 'PAIREND_DISTRO', "#{HOMEBREW_PREFIX}/share/lumpy-sv/pairend_distro.py"
      s.change_make_var! 'SAMBAMBA', "#{HOMEBREW_PREFIX}/bin/sambamba"
    end
    bin.install Dir['bin/speedseq*']
  end

  test do
    system 'speedseq -h'
  end
end
