require 'formula'

class Vep < Formula
  desc "Ensembl Variant Effect Predictor (VEP)"
  homepage "http://ensembl.org/info/docs/tools/vep/index.html"
  url "https://github.com/Ensembl/ensembl-tools/archive/bfd0982.tar.gz"
  version "81_2015-07-23"
  sha256 "7ff92a1baf5d803b129dfc3a5149cdf7b040582bda66b1d4365ff2219decf3d7"

  resource "plugins" do
    url "https://github.com/ensembl-variation/VEP_plugins/archive/a2f156db.tar.gz"
    sha256 "077ad2847d4c180a10ecc2b36fcecacf49b51695114617f3d3134ffed248079c"
  end

  resource "loftee" do
    url "https://github.com/konradjk/loftee/archive/e32f60a.tar.gz"
    sha256 "f54b22abe08abccff9038df50f254f282a910fab1a2e2f00da53c9b4337beefe"
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
