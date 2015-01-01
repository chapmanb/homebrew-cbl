require 'formula'

class Scalpel < Formula
  homepage 'http://scalpel.sourceforge.net/'
  version '0.3.1_3-14e40c'
  url "https://s3.amazonaws.com/cloudbiolinux/cache/scalpel-code-14e40c09168819c338bcb91c9223378f0147c3f5.zip"
  sha1 "c7a6badbbafe3bbf0aa2fec5219b133f29b2a5fe"

  patch do
    # Ensure pathlimit argument passed along to somatic and denovo commands
    # Ensure reference passed to export commands
    url "https://gist.githubusercontent.com/chapmanb/43e363680223656440de/raw/406a5efaba5d3fc0ed341a7daa2e30abc0228112/scalpel_pathlimit.patch"
    sha1 "771437c4b83a25ad286c1d1013bb0b2358ca35e2"
  end

  def install
    ENV.deparallelize
    inreplace 'ExportVariants.pl' do |s|
      # Remove incorrect filter specification which causes parsing issues with GATK
      s.sub! "ID=MS,Number=1,Type=STRING", "ID=MS"
      s.sub! "ID=lowCov,Number=0,Type=flag", "ID=lowCov"
    end
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
