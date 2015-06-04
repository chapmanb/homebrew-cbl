require 'formula'

class RtgTools < Formula
  homepage "http://realtimegenomics.com/products/rtg-tools/"
  version "3.4.5"

  url "https://github.com/RealTimeGenomics/rtg-core/releases/download/3.4.5/rtg-tools-3.4.5-nojre.zip"
  sha1 "59c6290db97401111e4a8c5213d9354c834ccc48"

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
