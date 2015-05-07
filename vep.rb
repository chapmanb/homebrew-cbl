require 'formula'

class Vep < Formula
  homepage 'http://ensembl.org/info/docs/variation/vep/index.html'
  version '79_2015-04-13'
  url 'https://github.com/Ensembl/ensembl-tools/archive/4a86cbf.zip'
  sha1 "4bdb9a9dfd77b7d5fad552d25f65fa7095262144"

  resource "plugins" do
    url "https://github.com/ensembl-variation/VEP_plugins/archive/5b4db9b.zip"
    sha1 "a12c46e68e9cff5e2cd501533da5139db408aa57"
  end

  resource 'loftee' do
    url 'https://github.com/konradjk/loftee/archive/0c833d3.zip'
    sha1 "5520ce42d0f067755019865173a4e9f26d9e4159"
  end

  def install
    # VEP
    inreplace 'scripts/variant_effect_predictor/variant_effect_predictor.pl' do |s|
      s.sub! 'use lib $Bin;', "use lib $Bin;\nuse lib '#{prefix}/lib';\nuse lib '#{prefix}/lib/Plugins';\n;"
      s.sub! "my $default_dir = join '/', ($ENV{'HOME'}, '.vep')", "my $default_dir = '#{prefix}/lib';"
    end
    inreplace 'scripts/variant_effect_predictor/INSTALL.pl' do |s|
      s.sub! "$DEST_DIR ||= '.';", "$DEST_DIR ||= '#{prefix}/lib';"
      s.sub! "$CACHE_DIR    ||= $ENV{HOME} ? $ENV{HOME}.'/.vep' : 'cache';", "$CACHE_DIR    ||= '#{share}/data';"
      s.sub! "our $use_curl = 0", "our $use_curl = 1"
    end
    inreplace 'scripts/variant_effect_predictor/convert_cache.pl' do |s|
      s.sub! 'use strict;', "use strict;\nuse lib '#{prefix}/lib';"
    end
    prefix.install Dir['scripts/variant_effect_predictor/*.pl']
    bin.install_symlink prefix / 'variant_effect_predictor.pl'
    bin.install_symlink prefix / 'filter_vep.pl'
    bin.install_symlink prefix / 'INSTALL.pl' => 'vep_install.pl'
    bin.install_symlink prefix / 'convert_cache.pl' => 'vep_convert_cache.pl'
    mkdir prefix / 'lib'
    mkdir_p "#{share}/data"
    (share + 'data').install 'scripts/variant_effect_predictor/README.txt'
    system "export FTP_PASSIVE=1 && #{prefix}/INSTALL.pl -a a -d #{prefix}/lib -c #{share}/data"

    # Plugins
    resource("plugins").stage {
      mkdir prefix / 'lib/Plugins'
      (prefix + 'lib/Plugins').install "CADD.pm"
      (prefix + 'lib/Plugins').install "dbNSFP.pm"
    }
    resource("loftee").stage {
      (prefix + 'lib/Plugins').install "LoF.pm"
    }
  end

  def caveats; <<-EOS.undent
      To install cached genome databases in #{share}/data:
          vep_install.pl -a c -s homo_sapiens
      or install data in a different location:
          vep_install.pl -a c -s homo_sapiens -c /path/to/data
    EOS
  end

  test do
    system 'variant_effect_predictor.pl --help'
  end
end
