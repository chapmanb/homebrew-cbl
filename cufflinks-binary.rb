require 'formula'

class CufflinksBinary < Formula
  homepage "http://cole-trapnell-lab.github.io/cufflinks/"
  version "2.2.1"
  if OS.mac?
    url "http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.OSX_x86_64.tar.gz"
    sha1 "13d4a4f754a2c9e088444739c619d4fdd7040708"
  else
    url "http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz"
    sha1 "55fcb817faae45f465ccfaddceacc217307fc33a"
  end

  def install
    bin.install Dir["cuff*"]
    bin.install "gffread"
    bin.install "gtf_to_sam"
    doc.install %w[README LICENSE AUTHORS]
  end

  test do
    system "#{bin}/cuffdiff 2>&1 |grep -q cuffdiff"
  end
end
