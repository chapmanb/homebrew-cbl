require 'formula'

class BcbioVariationRecall < Formula
  homepage "https://github.com/chapmanb/bcbio.variation.recall/"
  version "0.1.2"
  url "https://github.com/chapmanb/bcbio.variation.recall/releases/download/v#{version}/bcbio-variation-recall"
  sha1 "a581da94867499f652619e5d7d0245f443cc8ae1"

  def install
    bin.install "bcbio-variation-recall"
  end

  test do
    system 'bcbio-variation-recall version'
  end
end
