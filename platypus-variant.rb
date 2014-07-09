require 'formula'

class PlatypusVariant < Formula
  homepage 'http://www.well.ox.ac.uk/platypus'
  version '0.7.2'
  url 'http://www.well.ox.ac.uk/bioinformatics/Software/Platypus-latest.tgz'
  sha256 'bd1c1026301f35fb68356d8543c4f75e68c61babd9efdd0132c82e334f9bd85f'

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
