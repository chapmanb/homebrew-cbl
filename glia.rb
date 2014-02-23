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
  def repo_valid?
    false
  end
  def submodules?
    false
  end
end

class Glia < Formula
  homepage 'https://github.com/ekg/glia'
  version '2013-12-29'
  url 'https://github.com/ekg/glia.git', :using => RecursiveGitDownloadStrategy, :revision => 'b44eca6dd6'

  depends_on 'cmake' => :build

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
