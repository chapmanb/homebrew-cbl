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

class Wham < Formula
  homepage "https://github.com/jewmanchue/wham"
  version "1.7.0-154"

  resource "wham-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/WHAM-binaries-1.7.0-154.tar.gz"
    sha256 "e2189f41851acb583c4b3704edbe3f9e4a09c7eb0d7192b8ed61d1d3e094b14f"
  end

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  if build.without? "binary"
    url 'https://github.com/jewmanchue/wham.git', :using => RecursiveGitDownloadStrategy, :revision => "c7993e3"
    depends_on "bamtools"
  else
    url "https://github.com/jewmanchue/wham/archive/c7993e3.tar.gz"
    sha256 "18b599cb3025c1df711af94542f6dd16070010db504f60de85e1f6f8fca6c1f4"
  end

  def install
    if build.with? "binary"
      resource("wham-binary").stage {
        bin.install "WHAM-BAM"
        bin.install "WHAM-GRAPHENING"
        bin.install "mergeIndvs"
      }
    else
      inreplace "Makefile" do |s|
        # Link bamtools dependency to external brew package
        s.gsub! "src/bamtools/include", "#{Formula["bamtools"].opt_include}/bamtools"
        s.gsub! "-L./", "-L./ -L#{Formula["bamtools"].opt_lib}"
        s.gsub! "src/bamtools/lib/", "#{Formula["bamtools"].opt_lib}"
        s.gsub! "bamtools libbamtools.a", ""
        s.gsub! "buildWHAMBAM: libbamtools.a", "buildWHAMBAM:"
      end
      system "make"
      bin.install "bin/WHAM-BAM"
      bin.install "bin/WHAM-GRAPHENING"
      bin.install "bin/mergeIndvs"
    end
    (share/"wham").install "data/WHAM_training_data.txt"
    (share/"wham").install "utils/classify_WHAM_vcf.py"
    (share/"wham").install "utils/whamToBed.pl"
  end

  test do
    system 'WHAM-BAM'
  end
end
