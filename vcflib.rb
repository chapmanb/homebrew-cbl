require 'formula'

class RecursiveGitDownloadStrategy < GitDownloadStrategy
  def clone_args
    args = %w{clone}
    args << '--recursive'
    args << @url << @clone
  end
  def stage
    FileUtils.cp_r Dir[@clone+"{.}"], Dir.pwd
    checkout
  end
  def repo_valid?
    false
  end
  def submodules?
    false
  end
end

class Vcflib < Formula
  homepage 'https://github.com/ekg/vcflib'
  version '2015-03-13'
  url 'https://github.com/ekg/vcflib.git', :using => RecursiveGitDownloadStrategy, :revision => 'b1e9b31'

  # Fix /usr/bin hashbang: https://github.com/ekg/vcflib/pull/84
  patch do
    url "https://patch-diff.githubusercontent.com/raw/ekg/vcflib/pull/84.diff"
    sha256 "e4ad6d11b864c47834be5eed67edeb6d6bb52ed83bbb0f93683def3fa1735458"
  end

  def install
    ENV.deparallelize
    if OS.mac?
      # FIX => missing makefile var: https://github.com/ekg/tabixpp/issues/5
      inreplace "tabixpp/Makefile", "SUBDIRS=.", "SUBDIRS=.\nLOBJS=tabix.o"
      # FIX => ld: internal error: atom not found in symbolIndex(<snip>) for architecture x86_64
      inreplace "smithwaterman/Makefile", "LDFLAGS=-Wl,-s", "LDFLAGS="
    end
    inreplace 'Makefile' do |s|
      s.sub! "CXXFLAGS = -O3 -D_FILE_OFFSET_BITS=64", "CXXFLAGS = -msse2 -O3 -D_FILE_OFFSET_BITS=64"
    end
    system 'make'
    bin.install Dir['bin/*']
    doc.install %w[LICENSE README.md]
  end

  test do
    assert_match "genotype", shell_output("vcfallelicprimitives -h 2>&1", 0)
  end
end
