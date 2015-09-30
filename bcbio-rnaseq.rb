require 'formula'

class BcbioRnaseq < Formula
  homepage "https://github.com/roryk/bcbio.rnaseq/"
  version "1.0.1"
  url "https://github.com/roryk/bcbio.rnaseq/releases/download/v#{version}/bcbio-rnaseq"
  sha1 "ce5368c5b1ea424c79b2b71c45712c0a0a9eb755"

  def install
    bin.install "bcbio-rnaseq"
  end

  test do
    system 'bcbio-rnaseq --version'
  end
end
