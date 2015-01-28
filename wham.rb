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
  version '1.7.0-6'
  url 'https://github.com/jewmanchue/wham.git', :using => RecursiveGitDownloadStrategy, :revision => "f3e05eb"

  depends_on "bamtools"

  def install
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
    (share/"wham").install "utils/WHAM_training_data.txt"
    (share/"wham").install "utils/classify_WHAM_vcf.py"
    (share/"wham").install "utils/whamToBed.pl"
  end

  test do
    system 'WHAM-BAM'
  end
end
