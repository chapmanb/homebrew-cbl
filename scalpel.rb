require 'formula'

class Scalpel < Formula
  homepage 'http://scalpel.sourceforge.net/'
  version '0.3.1_4-e51eb1'
  url "https://s3.amazonaws.com/cloudbiolinux/cache/scalpel-code-e51eb12a2cc95326be31d3a1f7b92b9b63d2e39c.zip"
  sha1 "594c3df366be1582f9b2845861a089fde5e59b23"

  def install
    ENV.deparallelize
    inreplace 'FindVariants.pl' do |s|
      # Use samtools by chromosome to avoid pulling the full genome into memory
      s.sub! 'if (-e "$bedfile") { $USEFAIDX = 0; }', 'if (-e "$bedfile") { $USEFAIDX = 1; }'
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
