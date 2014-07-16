require 'formula'

# GATK MIT licensed framework code, wrapped into a shell script
# https://github.com/chapmanb/gatk

class GatkFramework < Formula
  homepage 'http://www.broadinstitute.org/gatk/'
  version '3.2-0'
  url "https://github.com/chapmanb/gatk/releases/download/v#{version}-framework/gatk-framework-#{version}.tar.gz"
  sha1 'd443aba46b0daf0bc2e669df987cf1fcb925cfc9'

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
