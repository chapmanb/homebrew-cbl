require 'formula'

class FlatGitDownloadStrategy < GitDownloadStrategy
  def clone_args
    args = %w{clone}
    args << @url << @clone
  end
  def stage
    FileUtils.cp_r Dir[@clone+"{.}"], Dir.pwd
    checkout
  end
  def repo_valid?
    false
  end
  def submodules?
    false
  end
end

class Speedseq < Formula
  homepage 'https://github.com/cc2qe/speedseq'
  version '2014-08-22'
  url 'https://github.com/cc2qe/speedseq.git', :using => FlatGitDownloadStrategy, :revision => '4c95193a'

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
