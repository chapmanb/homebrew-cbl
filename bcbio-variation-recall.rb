require 'formula'

class BcbioVariationRecall < Formula
  homepage "https://github.com/chapmanb/bcbio.variation.recall/"
  version "0.0.1"
  url "https://github.com/chapmanb/bcbio.variation.recall/releases/download/v#{version}/bcbio-variation-recall"
  sha1 "354f080cdfe5326ea8964604a6fb87a676ee5c63"

  def install
    bin.install "bcbio-variation-recall"
  end

  test do
    system 'bcbio-variation-recall version'
  end
end
