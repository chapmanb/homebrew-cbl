require 'formula'

class HallLabSvTools < Formula
  homepage 'https://github.com/hall-lab/sv-tools'
  version '2014-04-28'
  url 'https://github.com/hall-lab/sv-tools.git', :revision => '06b92f8cda'

  def install
    bin.install %w[bedpeToBed12 bedpeToVcf splitReadSamToBedpe splitterToBreakpoint vcfToBedpe]
  end

  test do
    system 'bedpeToVcf -h'
  end
end
