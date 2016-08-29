require 'formula'

class RtgTools < Formula
  homepage "http://realtimegenomics.com/products/rtg-tools/"
  version "3.7"

  url "https://github.com/RealTimeGenomics/rtg-tools/releases/download/3.7/rtg-tools-3.7-nojre.zip"
  sha256 "d1dc8aaae4ccb80922f4f3a915da340a1da68da8db06b4f08cce61fc03bc02c3"

  def install
    java = share / 'java'
    java.install 'RTG.jar'
    doc.install 'RTGOperationsManual.pdf'
    doc.install 'RTGOperationsManual'
    prefix.install 'LICENSE.txt'
    prefix.install 'README.txt'
    prefix.install 'ReleaseNotes.txt'
    prefix.install 'rtg'
    prefix.install 'third-party'
    prefix.install 'scripts'
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
