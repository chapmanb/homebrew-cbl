require 'formula'

class Qsignature < Formula
  homepage 'http://sourceforge.net/p/adamajava/wiki/Home/'
  version '0.1pre'
  url 'http://downloads.sourceforge.net/project/adamajava/qsignature.tar.bz2'
  sha1 'be0e50472221dfb7946e0fdebbe4a817ed7097f9'

  def install
    jarversion = '0.1pre'
    java = share / 'java'
    java.install "*.jar"
    bin.mkdir
    open(bin / 'qsignature', 'w') do |file|
      file.write <<-EOS.undent
        #!/bin/bash
        default_jvm_mem_opts="-Xms750m -Xmx8g"
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
        eval java $jvm_mem_opts $jvm_prop_opts -cp #{java}/qsignature-#{jarversion}.jar $pass_args
      EOS
    end
  end

  test do
    system 'qsignature -h'
  end
end
