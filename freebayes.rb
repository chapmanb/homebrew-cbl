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
  version '0.9.14-15'
  url 'https://github.com/ekg/freebayes.git', :using => RecursiveGitDownloadStrategy, :revision => 'c6f49c03bd'

  depends_on 'cmake' => :build

  # skip fsom build to make latest vcflib. Can remove when upgrade to latest FreeBayes
  patch do
    url "https://gist.githubusercontent.com/chapmanb/a6ea81be628644e8f232/raw/162600f9a10a7d34c602f0bc7e34d7c58133cdaf/vcflib-fsom-Makefile.patch"
    sha1 "8d49e0e8649cb5944d4177ade8009a568f49c5ed"
  end

  def install
    ENV.deparallelize
    # Build fix: https://github.com/chapmanb/homebrew-cbl/issues/14
    if OS.mac?
        inreplace 'vcflib/smithwaterman/Makefile' do |s|
          s.sub! 'LDFLAGS=-Wl,-s', "LDFLAGS=-Wl,-v"
        end
    end
    mkdir 'bamtools/build' do
      system 'cmake', '..', *std_cmake_args
      system 'make'
    end
    cd 'vcflib/fsom' do
      system 'make'
    end
    cd 'vcflib' do
      system 'make'
    end
    cd 'src' do
      system 'make autoversion'
    end
    system 'make'
    bin.install 'bin/freebayes'
    bin.install 'bin/bamleftalign'
  end

  test do
    system 'freebayes'
  end
end
