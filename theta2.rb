require 'formula'

class Theta2 < Formula
  homepage "https://github.com/raphael-group/THetA"
  version "0.62"
  url "https://github.com/raphael-group/THetA/archive/8a935dbb.tar.gz"
  sha1 "05d9eb1ead43f085732250e5f4cb3e329875b8c5"

  def install
    # Does not compile and install java code only needed for BIC-seq parsing
    # Generally handles only enough installation for exome analysis.
    doc.install Dir["doc/*.txt"]
    prefix.install Dir["matlab"]
    inreplace "python/RunTHetA.py", " ###\n #", "#!/usr/bin/env python\n###\n#"
    inreplace "python/createTHetAExomeInput.py", "###\n#", "#!/usr/bin/env python\n###\n#"
    prefix.install Dir["python"]
    chmod 0755, prefix / "python/RunTHetA.py"
    chmod 0755, prefix / "python/createTHetAExomeInput.py"
    bin.install_symlink prefix / "python/RunTHetA.py" => "RunTHetA.py"
    bin.install_symlink prefix / "python/createTHetAExomeInput.py" => "createTHetAExomeInput.py"
  end

  test do
    system 'RunTHeTA.py'
  end
end
