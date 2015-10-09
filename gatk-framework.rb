require 'formula'

# GATK MIT licensed framework code, wrapped into a shell script
# https://github.com/chapmanb/gatk

class GatkFramework < Formula
  homepage 'http://www.broadinstitute.org/gatk/'
  version '3.4-46'
  url "https://github.com/chapmanb/gatk/releases/download/v#{version}-framework/gatk-framework-#{version}.tar.gz"
  sha256 "65fc7f78e9d23982fc29def0874fa9eaef1e29ab0730a5c97ea3f2c41777bcf0"

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
