require 'formula'

class RecursiveGitDownloadStrategy < GitDownloadStrategy
  def clone_args
    args = %w{clone}
    args << '--recursive'
    args << @url << @clone
  end
  def stage
    FileUtils.cp_r Dir[@clone+"{.}"], Dir.pwd
  end
  def clone_repo
    safe_system 'git', *clone_args
    fetch
  end
  def reset
  end
  def submodules?
    false
  end
end

class Glia < Formula
  homepage 'https://github.com/ekg/glia'
  version '2013-11-18'
  url 'https://github.com/ekg/glia.git', :using => RecursiveGitDownloadStrategy, :revision => 'd1acd98e17'

  depends_on 'cmake' => :build
  depends_on 'google-sparsehash'

  def install
    inreplace 'Makefile' do |s|
      s.change_make_var! 'INCLUDES', "-I#{HOMEBREW_PREFIX}/include -I$(BAMTOOLS_ROOT)/include -Ivcflib/src -Ivcflib/"
    end
    system 'make'
    bin.install 'glia'
  end

  test do
    system 'glia', '--help'
  end
end
