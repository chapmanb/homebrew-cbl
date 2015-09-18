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
  version "1.7.0-161"

  resource "wham-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/WHAM-binaries-1.7.0-161.tar.gz"
    sha256 "0ee96784edb16f52d8a241a0f5ddbb6dd678ad1a4ad0e2ef2acbdb0f6badbc28"
  end

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  if build.without? "binary"
    url 'https://github.com/jewmanchue/wham.git', :using => RecursiveGitDownloadStrategy, :revision => "26110b9"
    depends_on "bamtools"
  else
    url "https://github.com/jewmanchue/wham/archive/26110b9.tar.gz"
    sha256 "6a068b1a3158b1c324589f6d44aec6b0083094a2583149fc0a1d22310bb8c628"
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
