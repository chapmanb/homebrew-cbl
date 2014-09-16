require 'formula'

class PlatypusVariant < Formula
  homepage 'http://www.well.ox.ac.uk/platypus'
  version '0.7.9.2'
  url 'https://github.com/chapmanb/Platypus/releases/download/v0.7.9.2/Platypus_0.7.9.2.tgz'
  sha256 'aebc4ccc84dff17d86dbd85da050bc997763896e137a881fb7abdd59a1503c0c'

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
