require 'formula'

class Vep < Formula
  homepage 'http://ensembl.org/info/docs/variation/vep/index.html'
  version '75'
  url 'https://github.com/Ensembl/ensembl-tools/archive/release/75.zip'
  sha1 '569cd1c0ab51fd9f3672efa9bacbe017c7a519bb'

  resource "plugins" do
    url "https://github.com/ensembl-variation/VEP_plugins/archive/2c123faff2deef07ee094984fc44e19c48975af4.zip"
    sha1 "0569239ed8255d277db034d838d6ec51b90481a8"
  end

  def install
    # VEP
    inreplace 'scripts/variant_effect_predictor/variant_effect_predictor.pl' do |s|
      s.sub! 'use lib $Bin;', "use lib $Bin;\nuse lib '#{prefix}/lib';"
      s.sub! "my $default_dir = join '/', ($ENV{'HOME'}, '.vep')", "my $default_dir = '#{prefix}/lib';"
    end
    inreplace 'scripts/variant_effect_predictor/INSTALL.pl' do |s|
      s.sub! "$DEST_DIR ||= '.';", "$DEST_DIR ||= '#{prefix}/lib';"
      s.sub! "$CACHE_DIR    ||= $ENV{HOME} ? $ENV{HOME}.'/.vep' : 'cache';", "$CACHE_DIR    ||= '#{share}/data';"
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
