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
  version '1.7.0-13'

  resource "wham-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/WHAM-BAM-1.7.0-13"
    sha1 "09f45020e6452a495359a0ee1b882a424602aef0"
  end

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  if build.without? "binary"
    url 'https://github.com/jewmanchue/wham.git', :using => RecursiveGitDownloadStrategy, :revision => "b7460ae"
    depends_on "bamtools"
  else
    url "https://github.com/jewmanchue/wham/archive/b7460ae.tar.gz"
    sha1 "bb43f5909af8d778a6eb06f363a7b215bc45edc5"
  end

  def install
    if build.with? "binary"
      resource("wham-binary").stage { bin.install "WHAM-BAM-#{version}" => "WHAM-BAM"}
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
    end
    (share/"wham").install "data/WHAM_training_data.txt"
    (share/"wham").install "utils/classify_WHAM_vcf.py"
    (share/"wham").install "utils/whamToBed.pl"
  end

  test do
    system 'WHAM-BAM'
  end
end
