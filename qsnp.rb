require 'formula'

class Qsnp < Formula
  homepage 'http://qcmg.org/bioinformatics/tiki-index.php?page=qSNP'
  version '1.0'
  url 'http://qcmg.org/bioinformatics/tiki-download_file.php?fileId=27'
  sha1 '7a9dedc78c111747ea385088eebaebcde3b7ee73'

  def install
    java = share / 'java' / 'qsnp'
    java.install Dir['*.jar']
    bin.mkdir
    open(bin / 'qsnp', 'w') do |file|
      file.write <<-EOS.undent
        #!/bin/bash
        default_jvm_mem_opts="-Xms750m -Xmx2g"
        jvm_mem_opts=""
        jvm_prop_opts=""
        pass_args=""
        for arg in "$@"; do
            case $arg in
                '-D'*)
                    jvm_prop_opts="$jvm_prop_opts $arg"
                    ;;
                 '-Xm'*)
                    jvm_mem_opts="$jvm_mem_opts $arg"
                    ;;
                 '*8')
                    pass_args="$pass_args \\*8"
                    ;;
                 *)
                    pass_args="$pass_args $arg"
                    ;;
            esac
        done
        if [ "$jvm_mem_opts" == "" ]; then
            jvm_mem_opts="$default_jvm_mem_opts"
        fi
        eval java $jvm_mem_opts $jvm_prop_opts -jar #{java}/qsnp-#{version}.jar $pass_args
      EOS
    end
  end

  test do
    system 'qsnp -h'
  end
end
