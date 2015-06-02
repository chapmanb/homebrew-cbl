require 'formula'

class Impute2 < Formula
  homepage "https://mathgen.stats.ox.ac.uk/impute/impute_v2.html"
  version '2.3.2'
  if OS.mac?
    url "https://mathgen.stats.ox.ac.uk/impute/impute_v#{version}_MacOSX_Intel.tgz"
    sha1 "006a92748cb9416eaae43fa6e587778edd7a1131"
  else
    url "https://mathgen.stats.ox.ac.uk/impute/impute_v#{version}_x86_64_static.tgz"
    sha1 "e0df856109e76443fd98f58bb68dfb30dc57d9ff"
  end

  def install
    bin.install "impute2"
  end

  test do
  end
end
