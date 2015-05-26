require 'formula'

class RtgTools < Formula
  homepage "http://realtimegenomics.com/products/rtg-tools/"
  version "3.4.4"

  url "https://github.com/RealTimeGenomics/rtg-core/releases/download/3.4.4/rtg-tools-3.4.4-nojre.zip"
  sha1 "ca6d53feadea4f2b1921292cc9f44bc64742a014"

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
