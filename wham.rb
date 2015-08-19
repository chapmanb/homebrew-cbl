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
  version "1.7.0-131"

  resource "wham-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/WHAM-binaries-1.7.0-131.tar.gz"
    sha256 "3c3882b2778fd5c960180b7f6e20a5e61c8457aaee9003388107872f52c5accd"
  end

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  if build.without? "binary"
    url 'https://github.com/jewmanchue/wham.git', :using => RecursiveGitDownloadStrategy, :revision => "60b9768"
    depends_on "bamtools"
  else
    url "https://github.com/jewmanchue/wham/archive/60b9768.tar.gz"
    sha256 "d441e87d3955d744faa93d2839e50b85cba8b45cf4754b2326d23ee9fbb77e7b"
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
