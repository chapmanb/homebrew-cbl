require 'formula'

class Vardict < Formula
  homepage "https://github.com/AstraZeneca-NGS/VarDict"
  version "2015-06-19"
  url "https://github.com/AstraZeneca-NGS/VarDict/archive/49d2293.tar.gz"
  sha1 "95138eba3c9abbe4081b28542502eb59930d7e25"

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
