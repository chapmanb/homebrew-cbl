require 'formula'

class Vardict < Formula
  homepage 'https://github.com/AstraZeneca-NGS/VarDict'
  version '2015-01-16'
  url 'https://github.com/AstraZeneca-NGS/VarDict.git', :revision => '53a80fa4d'

  def install
    prefix.install Dir['*']
    bin.install_symlink prefix / 'vardict.pl' => 'vardict'
    bin.install_symlink(['vardict.pl', 'testsomatic.R', 'teststrandbias.R',
                         'var2vcf_valid.pl', 'var2vcf_paired.pl', 'var2vcf_somatic.pl'].map do
                          |x| prefix / x
    end)
  end

  test do
    system 'vardict -h'
  end
end
