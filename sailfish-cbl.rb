class SailfishCbl < Formula
  homepage "http://www.cs.cmu.edu/~ckingsf/software/sailfish"
  # doi "10.1038/nbt.2862"
  # tag "bioinformatics"
  url "https://github.com/kingsfordgroup/sailfish/archive/v0.7.3.tar.gz"
  sha256 "f915b07d221b6833b8ce15b37d0ed1f0fb0c00b74b3ec839470e45d9c2697935"
  version "0.7.3"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "cmake" => :build
  depends_on "boost" => :recommended
  depends_on "tbb" => :recommended

  def install
    ENV.deparallelize
    mkdir "build" do
      system "cmake", ".."
      system "make"
      bin.install("src/sailfish")
    end
  end

  test do
    system "#{bin}/sailfish", "--version"
  end
end
