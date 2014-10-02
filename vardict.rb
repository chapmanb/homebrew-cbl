require 'formula'

class Vardict < Formula
  homepage 'https://github.com/AstraZeneca-NGS/VarDict'
  version '2014-10-02'
  url 'https://github.com/AstraZeneca-NGS/VarDict.git', :revision => 'a68faeb1c'

  def install
    prefix.install Dir['*']
    bin.install_symlink prefix / 'vardict.pl' => 'vardict'
    bin.install_symlink(['vardict.pl', 'testsomatic.R', 'teststrandbias.R',
                         'var2vcf_valid.pl', 'var2vcf_somatic.pl'].map do
                          |x| prefix / x
    end)
  end

  test do
    system 'vardict -h'
  end
end
