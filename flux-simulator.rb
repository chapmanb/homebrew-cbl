require 'formula'

class FluxSimulator < Formula
  homepage "http://sammeth.net/confluence/display/SIM/Home"
  version "1.2.1"
  url "http://artifactory.sammeth.net/artifactory/barna/barna/barna.simulator/1.2.1/flux-simulator-1.2.1.tgz"
  sha1 "49a14b34e8700bc225175c6ebc87a343a3c41355"

  def install
    lib.install Dir["lib/*.jar"]
    bin.install("bin/flux-simulator")
  end

  test do
    system 'flux-simulator -h'
  end
end
