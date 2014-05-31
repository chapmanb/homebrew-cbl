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
      s.sub! 'use Usage;', "use lib '#{prefix}';\nuse Usage;"
    end
    inreplace 'Utils.pm' do |s|
      s.gsub! '$Bin/', "#{prefix}/"
    end
    system 'make'
    prefix.install Dir['*']
    bin.install_symlink prefix / 'scalpel'
  end

  test do
    system 'scalpel -h'
  end
end
