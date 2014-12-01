require 'formula'

class BcbioVariationRecall < Formula
  homepage "https://github.com/chapmanb/bcbio.variation.recall/"
  version "0.0.5"
  url "https://github.com/chapmanb/bcbio.variation.recall/releases/download/v#{version}/bcbio-variation-recall"
  sha1 "5079e189d68679ea88cc73ce2c331689173f04da"

  def install
    bin.install "bcbio-variation-recall"
  end

  test do
    system 'bcbio-variation-recall version'
  end
end
