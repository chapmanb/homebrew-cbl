require 'formula'

class Speedseq < Formula
  homepage 'https://github.com/cc2qe/speedseq'
  version '2014-04-01'
  url 'https://github.com/cc2qe/speedseq.git', :revision => '4e2e641510e07'

  depends_on 'lumpy-sv' => :recommended
  depends_on 'sambamba' => :recommended

  def install
    inreplace 'bin/speedseq.config' do |s|
      s.change_make_var! 'PAIREND_DISTRO', "#{HOMEBREW_PREFIX}/share/lumpy-sv/pairend_distro.pl"
      s.change_make_var! 'SAMBAMBA', "#{HOMEBREW_PREFIX}/bin/sambamba"
    end
    bin.install Dir['bin/speedseq*']
  end

  test do
    system 'speedseq -h'
  end
end
