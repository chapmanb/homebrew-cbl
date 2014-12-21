require 'formula'

class Scalpel < Formula
  homepage 'http://scalpel.sourceforge.net/'
  version '0.3.1'
  url 'http://downloads.sourceforge.net/project/scalpel/scalpel-0.3.1.tar.gz'
  sha1 "b04890373ef730b715f179d434c875c1d5329bd7"

  patch do
    # Use samtools by chromosome to avoid pulling the full genome into memory
    url "https://gist.githubusercontent.com/chapmanb/9248ab8409a473249a07/raw/c535ff0335470ae599ac7d8f95cee4bc15e67eee/samtools_index.patch"
    sha1 "e58a688e0dd8be8d7cc3fd47105d20c98b1830d7"
  end

  def install
    ENV.deparallelize
    inreplace 'scalpel' do |s|
      # Include PATH to perl libraries
      s.sub! 'use Usage;', "use lib '#{prefix}';\nuse Usage;"
    end
    inreplace 'Utils.pm' do |s|
      # Ensure local scripts point to installation
      s.gsub! '$Bin/', "#{prefix}/"
      # Use bash instead of /bin/sh default, which points to dash on ubuntu
      s.sub! 'system($cmd)', 'system("/bin/bash -c \'$cmd\'")'
    end
    inreplace 'Makefile', 'CXX := g++', "CXX := #{ENV.cxx}"
    chmod 0755, 'FindVariants.pl'
    chmod 0755, 'FindSomatic.pl'
    system 'make bamtools'
    system 'make Microassembler'
    system 'make'
    prefix.install Dir['*']
    bin.install_symlink prefix / 'scalpel'
  end

  test do
    system 'scalpel -h'
  end
end
