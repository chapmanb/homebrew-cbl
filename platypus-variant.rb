require 'formula'

class PlatypusVariant < Formula
  homepage 'http://www.well.ox.ac.uk/platypus'
  version '0.7.4'
  url 'http://www.well.ox.ac.uk/bioinformatics/Software/Platypus-latest.tgz'
  sha256 '450d15f113096ed109c0de751786e12fa46dcb37cbe19f39b857fb8b5d766093'

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
