require 'formula'

class Scalpel < Formula
  homepage 'http://scalpel.sourceforge.net/'
  version '0.2.1'
  url 'http://downloads.sourceforge.net/project/scalpel/scalpel-0.2.1.tar.gz'

  patch do
    # Use samtools by chromosome to avoid pulling the full genome into memory
    url 'https://gist.githubusercontent.com/chapmanb/9248ab8409a473249a07/raw/61af40ea24ad8dedf00efb19003bc44dd7436baa/samtools_index.patch'
    sha1 'd23aa6a8e9b68ab0daaa9976152c0500d9b912a8'
  end

  def install
    ENV.deparallelize
    # Fix bug in HashesIO.pm 0.2.1 release -- submitted upstream
    inreplace 'HashesIO.pm' do |s|
      s.sub! 'sget(', 'inTarget('
    end
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
