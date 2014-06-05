require 'formula'

class Scalpel < Formula
  homepage 'http://scalpel.sourceforge.net/'
  version '0.1.1-beta-2014-05-27'
  url 'http://git.code.sf.net/p/scalpel/code.git', :revision => '3c3f201e4'

  patch do
    # Use samtools by chromosome to avoid pulling the full genome into memory
    url "https://gist.githubusercontent.com/chapmanb/9248ab8409a473249a07/raw/07bfc4e97a7a784b4e0b2d268e5d61a263487907/samtools_index.patch"
    sha1 'e404cb5de68fffbfa4faed6dbd586d43172ce11e'
  end

  def install
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
