require 'formula'

class PlatypusVariant < Formula
  homepage 'http://www.well.ox.ac.uk/platypus'
  version '0.5.2'
  url 'http://www.well.ox.ac.uk/bioinformatics/Software/Platypus-latest.tgz'
  sha256 'b6fe740804206dfa86ec4b177b39e3db0b6e6923e18a961efd2c4247189f1ee1'

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
