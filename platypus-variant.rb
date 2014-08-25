require 'formula'

class PlatypusVariant < Formula
  homepage 'http://www.well.ox.ac.uk/platypus'
  version '0.7.8'
  url 'http://www.well.ox.ac.uk/bioinformatics/Software/Platypus-latest.tgz'
  sha256 'c444cb4a358aa7c1e79a90c66ceafc91ed2e34e4873428c516fc7191be4a04dd'

  def install
    system './buildPlatypus.sh'
    prefix.install Dir['*']
    bin.mkdir
    open(bin / 'platypus', 'w') do |file|
      file.write <<-EOS.undent
        #!/bin/sh
        python #{prefix}/Platypus.py "$@"
      EOS
    end
  end

  test do
    system 'platypus callVariants -h'
  end
end
