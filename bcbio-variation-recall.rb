require 'formula'

class BcbioVariationRecall < Formula
  homepage "https://github.com/chapmanb/bcbio.variation.recall/"
  version "0.1.4"
  url "https://github.com/chapmanb/bcbio.variation.recall/releases/download/v#{version}/bcbio-variation-recall"
  sha256 "9551f6cbb4ac0ae39e6dfa802fa5bb4279e59b9a3fad944a021bf661c634e4ed"

  def install
    bin.install "bcbio-variation-recall"
  end

  test do
    system 'bcbio-variation-recall version'
  end
end
