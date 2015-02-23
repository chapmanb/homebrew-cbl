require 'formula'

class BcbioVariationRecall < Formula
  homepage "https://github.com/chapmanb/bcbio.variation.recall/"
  version "0.0.7"
  url "https://github.com/chapmanb/bcbio.variation.recall/releases/download/v#{version}/bcbio-variation-recall"
  sha1 "73bff0e8e25f0d8acf9e24fc706a36c2d14751d9"

  def install
    bin.install "bcbio-variation-recall"
  end

  test do
    system 'bcbio-variation-recall version'
  end
end
