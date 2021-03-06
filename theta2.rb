require 'formula'

class Theta2 < Formula
  homepage "https://github.com/raphael-group/THetA"
  version "0.62-2015-03-08"
  url "https://github.com/raphael-group/THetA/archive/86c1d4b.tar.gz"
  sha1 "c94963be7fff41309882e1e79ace9aa927dc560d"

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
