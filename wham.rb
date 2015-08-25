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
  version "1.7.0-146"

  resource "wham-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/WHAM-binaries-1.7.0-146.tar.gz"
    sha256 "ec5fe098b4a146b2b89a94afd2c7eddfa89857dcbd0f6dd26358b4673e60ebf4"
  end

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  if build.without? "binary"
    url 'https://github.com/jewmanchue/wham.git', :using => RecursiveGitDownloadStrategy, :revision => "cbdcd6b"
    depends_on "bamtools"
  else
    url "https://github.com/jewmanchue/wham/archive/cbdcd6b.tar.gz"
    sha256 "7aa82399c49f736f008c2b56dbf2f72acc6f94b2ba91db4470fee51a1268e130"
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
