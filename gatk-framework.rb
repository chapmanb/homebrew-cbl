require 'formula'

# GATK MIT licensed framework code, wrapped into a shell script
# https://github.com/chapmanb/gatk

class GatkFramework < Formula
  homepage 'http://www.broadinstitute.org/gatk/'
  version '3.1-1'
  url 'https://github.com/chapmanb/gatk/releases/download/v3.1-1-framework/gatk-framework-3.1-1.tar.gz'
  sha1 '624b187f1b162b4b0afd69d64668ccf1b1904db9'

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
