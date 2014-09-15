require 'formula'

class PlatypusVariant < Formula
  homepage 'http://www.well.ox.ac.uk/platypus'
  version '0.7.9.1'
  url 'https://github.com/andyrimmer/Platypus/raw/master/release/AllReleases/Platypus_0.7.9.1.tgz'
  sha256 '486de22b7726ebbd39ee4a0d254ad5fe36b2fe028a230451005dbe49775cd639'

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
