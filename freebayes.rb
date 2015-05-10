require 'formula'

class RecursiveGitDownloadStrategy < GitDownloadStrategy
  def clone_args
    args = %w{clone}
    args << '--recursive'
    args << @url << @clone
  end
  def stage
    cp_r Dir[@clone+"{.}"], Dir.pwd
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
  version '0.9.21-7'
  url 'https://github.com/ekg/freebayes.git', :using => RecursiveGitDownloadStrategy, :revision => '7dd41db'

  depends_on 'cmake' => :build
  depends_on 'parallel'

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
    cd 'src' do
      system 'make autoversion'
    end
    system 'make'

    bin.install 'bin/freebayes'
    bin.install 'bin/bamleftalign'

    bin.install 'scripts/freebayes-parallel'

    inreplace 'scripts/fasta_generate_regions.py', '#!/usr/bin/python', '#!/usr/bin/env python'
    bin.install 'scripts/fasta_generate_regions.py'

    # this script uses 'env' alreayd, no need to fix
    bin.install 'scripts/coverage_to_regions.py'

    bin.install 'scripts/generate_freebayes_region_scripts.sh'

    doc.install 'README.md'
    doc.install 'LICENSE'
  end

  test do
    system "#{bin}/freebayes", '--version'
    system "#{bin}/freebayes-parallel"
    system "#{bin}/fasta_generate_regions.py"
    system "#{bin}/coverage_to_regions.py"
  end
end
