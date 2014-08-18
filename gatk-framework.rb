require 'formula'

# GATK MIT licensed framework code, wrapped into a shell script
# https://github.com/chapmanb/gatk

class GatkFramework < Formula
  homepage 'http://www.broadinstitute.org/gatk/'
  version '3.2-3'
  url "https://github.com/chapmanb/gatk/releases/download/v#{version}-framework/gatk-framework-#{version}.tar.gz"
  sha1 '3a54bee9994c6882e45ab4d1ad1b28fdfcd1a725'

  def install
    java = share / 'java'
    java.install 'gatk-framework.jar'
    inreplace 'gatk-framework' do |s|
      s.change_make_var! 'JAR_DIR', java
    end
    bin.install 'gatk-framework'
  end

  test do
    system 'gatk-framework --version'
  end
end
