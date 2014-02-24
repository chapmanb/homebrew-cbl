require 'formula'

class RecursiveGitDownloadStrategy < GitDownloadStrategy
  def clone_args
    args = %w{clone}
    args << '--recursive'
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

class Freebayes < Formula
  homepage 'https://github.com/ekg/freebayes'
  version '0.9.13-2'
  url 'https://github.com/ekg/freebayes.git', :using => RecursiveGitDownloadStrategy, :revision => 'a830efd1a4'

  depends_on 'cmake' => :build

  def install
    mkdir 'bamtools/build' do
      system 'cmake', '..', *std_cmake_args
      system 'make'
    end
    cd 'vcflib' do
      system 'make'
    end
    system 'make'
    bin.install 'bin/freebayes'
    bin.install 'bin/bamleftalign'
  end

  test do
    system 'freebayes'
  end
end
