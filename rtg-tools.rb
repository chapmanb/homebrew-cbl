require 'formula'

class RtgTools < Formula
  homepage 'ftp://ftp-trace.ncbi.nih.gov/giab/ftp/tools/RTG/'
  version '1.0.0'

  url 'ftp://ftp-trace.ncbi.nih.gov/giab/ftp/tools/RTG/rtg-tools-1.0.0-nojre.zip'
  sha1 '0250d4e3ce4f697948a3a7c035615603c92c9a9d'

  def install
    java = share / 'java'
    java.install 'RTG.jar'
    doc.install 'RTGOperationsManual.pdf'
    prefix.install 'EULA.txt'
    prefix.install 'README.txt'
    prefix.install 'rtg'
    open(prefix / 'rtg.cfg', 'w') do |file|
      file.write <<-EOS.undent
        RTG_TALKBACK=     # Attempt to send crash logs to realtime genomics, true to enable
        RTG_USAGE=           # Enable simple usage logging, true to enable
        RTG_JAVA_OPTS=                 # Additional arguments passed to the JVM
        RTG_JAR=#{java}/RTG.jar
      EOS
    end
    bin.install_symlink prefix / 'rtg'
  end

  test do
    system 'rtg'
  end
end
