require 'formula'

class Rsem < Formula
  homepage 'http://deweylab.biostat.wisc.edu/rsem'
  version '1.2.19'
  url 'http://deweylab.biostat.wisc.edu/rsem/src/rsem-1.2.19.tar.gz'
  sha1 '04f71934dbcbac612b68b92ef4e4be5c1003f3e4'

  def install
    system 'make'
    (share/'rsem').install Dir['*']
    bin.install_symlink (share/'rsem'/'rsem-bam2readdepth')
    bin.install_symlink (share/'rsem'/'convert-sam-for-rsem')
    bin.install_symlink (share/'rsem'/'extract-transcript-to-gene-map-from-trinity')
    bin.install_symlink (share/'rsem'/'rsem-bam2readdepth')
    bin.install_symlink (share/'rsem'/'rsem-bam2wig')
    bin.install_symlink (share/'rsem'/'rsem-build-read-index')
    bin.install_symlink (share/'rsem'/'rsem-calculate-credibility-intervals')
    bin.install_symlink (share/'rsem'/'rsem-calculate-expression')
    bin.install_symlink (share/'rsem'/'rsem-control-fdr')
    bin.install_symlink (share/'rsem'/'rsem-extract-reference-transcripts')
    bin.install_symlink (share/'rsem'/'rsem-gen-transcript-plots')
    bin.install_symlink (share/'rsem'/'rsem-generate-data-matrix')
    bin.install_symlink (share/'rsem'/'rsem-generate-ngvector')
    bin.install_symlink (share/'rsem'/'rsem-get-unique')
    bin.install_symlink (share/'rsem'/'rsem-parse-alignments')
    bin.install_symlink (share/'rsem'/'rsem-plot-model')
    bin.install_symlink (share/'rsem'/'rsem-plot-transcript-wiggles')
    bin.install_symlink (share/'rsem'/'rsem-prepare-reference')
    bin.install_symlink (share/'rsem'/'rsem-preref')
    bin.install_symlink (share/'rsem'/'rsem-run-ebseq')
    bin.install_symlink (share/'rsem'/'rsem-run-em')
    bin.install_symlink (share/'rsem'/'rsem-run-gibbs')
    bin.install_symlink (share/'rsem'/'rsem-sam-validator')
    bin.install_symlink (share/'rsem'/'rsem-scan-for-paired-end-reads')
    bin.install_symlink (share/'rsem'/'rsem-simulate-reads')
    bin.install_symlink (share/'rsem'/'rsem-synthesis-reference-transcripts')
    bin.install_symlink (share/'rsem'/'rsem-tbam2gbam')
  end
end
