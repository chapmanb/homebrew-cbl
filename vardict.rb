require 'formula'

class Vardict < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDict"
  version "2015-04-22"
  url "https://github.com/AstraZeneca-NGS/VarDict/archive/20eaa69.tar.gz"
  sha1 "5f7aaad06e0d69f5701d03d05145a871097fb631"

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
