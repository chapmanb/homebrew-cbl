require 'formula'

class Vardict < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDict"
  version "2015-10-01"
  url "https://github.com/AstraZeneca-NGS/VarDict/archive/f020d5d.tar.gz"
  sha256 "3734b90cc094ddaa467d9bdcdf090b166b1c619b4410ec39bad2ddb1090244bd"

  def install
    prefix.install Dir['*']
    bin.install_symlink prefix / 'vardict.pl' => 'vardict'
    bin.install_symlink(['vardict.pl', 'testsomatic.R', 'teststrandbias.R',
                         'var2vcf_valid.pl', 'var2vcf_paired.pl'].map do
                          |x| prefix / x
    end)
  end

  test do
    system 'vardict -h'
  end
end
