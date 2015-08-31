require 'formula'

class Scalpel < Formula
  homepage 'http://scalpel.sourceforge.net/'
  version '0.3.1_5-2d23b7-2'
  url "https://s3.amazonaws.com/cloudbiolinux/cache/scalpel-code-2d23b7192228894d97fc6d8ffe4bc1b0618c9861.zip"
  sha1 "7e584a338ee96e2802acdac4092aef43529d2697"

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
      # Use system bamtools instead of local, which doesn't load libbamtools
      s.gsub! "$Bin/bamtools-2.3.0/bin/", ""
      # Use system samtools and bcftools
      s.gsub! "$Bin/samtools-1.1/", ""
      s.gsub! "$Bin/bcftools-1.1/", ""
      # Ensure local scripts point to installation
      s.gsub! '$Bin/', "#{prefix}/"
      # Use bash instead of /bin/sh default, which points to dash on ubuntu
      s.sub! 'system($cmd)', 'system("/bin/bash -c \'$cmd\'")'
    end
    inreplace 'Makefile', 'CXX := g++', "CXX := #{ENV.cxx}"
    # Avoid building bamtools samtools bcftools
    inreplace "Makefile", "bamtools samtools bcftools", ""
    chmod 0755, 'FindVariants.pl'
    chmod 0755, 'FindSomatic.pl'
    bamtools=Formula["bamtools"].opt_prefix
    system "make INCLUDES='-I#{bamtools}/include/bamtools -L #{bamtools}/lib' Microassembler"
    system "make INCLUDES='-I#{bamtools}/include/bamtools -L #{bamtools}/lib'"
    prefix.install Dir['*']
    bin.install_symlink prefix / 'scalpel'
  end

  test do
    system 'scalpel -h'
  end
end
