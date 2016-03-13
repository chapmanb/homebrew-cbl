require 'formula'

class RtgTools < Formula
  homepage "http://realtimegenomics.com/products/rtg-tools/"
  version "3.6.2"

  url "https://github.com/RealTimeGenomics/rtg-tools/releases/download/3.6.2/rtg-tools-3.6.2-nojre.zip"
  sha1 "f8feb5d1e572ffd4b241413bfa51929bf56be026"

  def install
    java = share / 'java'
    java.install 'RTG.jar'
    doc.install 'RTGOperationsManual.pdf'
    prefix.install 'LICENSE.txt'
    prefix.install 'README.txt'
    prefix.install 'ReleaseNotes.txt'
    prefix.install 'rtg'
    prefix.install 'third-party'
    open(prefix / 'rtg.cfg', 'w') do |file|
      file.write <<-EOS.undent
        RTG_TALKBACK=     # Attempt to send crash logs to realtime genomics, true to enable
        RTG_USAGE=        # Enable simple usage logging, true to enable
        RTG_JAVA_OPTS=    # Additional arguments passed to the JVM
        RTG_JAR=#{java}/RTG.jar
      EOS
    end
    bin.install_symlink prefix / 'rtg'
  end

  test do
    system 'rtg'
  end
end
