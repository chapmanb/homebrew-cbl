require 'formula'

# GATK MIT licensed framework code, wrapped into a shell script
# https://github.com/chapmanb/gatk

class GatkFramework < Formula
  homepage 'http://www.broadinstitute.org/gatk/'
  version '3.0'
  url 'https://github.com/chapmanb/gatk/releases/download/v3.0-framework/gatk-framework-3.0.tar.gz'
  sha1 '0e1433a7c13e9c514826d025ec511c919b7a807a'

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
