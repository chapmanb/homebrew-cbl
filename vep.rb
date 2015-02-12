require 'formula'

class Vep < Formula
  homepage 'http://ensembl.org/info/docs/variation/vep/index.html'
  version '75_2014-06-12'
  url 'https://github.com/Ensembl/ensembl-tools/archive/771dfa1016c357145be7016c91e1155ae7c021f2.zip'
  sha1 '141a8c639c442bf02d15846fab534dbe58dec3e4'

  resource "plugins" do
    url "https://github.com/ensembl-variation/VEP_plugins/archive/2c123faff2deef07ee094984fc44e19c48975af4.zip"
    sha1 "0569239ed8255d277db034d838d6ec51b90481a8"
  end

  resource 'loftee' do
    url 'https://github.com/konradjk/loftee/archive/545cf9ac5f25b6a6872984dd1a3197a7e7caf000.zip'
    sha1 'a61c6196964526becfbe7afa9838d0495d7996e9'
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
