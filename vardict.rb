require 'formula'

class Vardict < Formula
  homepage 'https://github.com/AstraZeneca-NGS/VarDict'
  version '2014-11-27'
  url 'https://github.com/AstraZeneca-NGS/VarDict.git', :revision => 'cd60a2220'

  def install
    prefix.install Dir['*']
    bin.install_symlink prefix / 'vardict.pl' => 'vardict'
    bin.install_symlink(['vardict.pl', 'testsomatic.R', 'teststrandbias.R',
                         'var2vcf_valid.pl', 'var2vcf_paired.pl', 'var2vcf_tumor.pl'].map do
                          |x| prefix / x
    end)
  end

  test do
    system 'vardict -h'
  end
end
