require 'formula'

class Cramtools < Formula
  homepage 'http://www.ebi.ac.uk/ena/about/cram_toolkit/'
  version '2.1-b237'
  url 'https://github.com/enasequence/cramtools/raw/master/cramtools-2.1.jar'
  sha1 '2f63d7ca31734fa8fc854c116c183d210bb5801e'

  def install
    jarversion = '2.1'
    java = share / 'java'
    java.install "cramtools-#{jarversion}.jar"
    bin.mkdir
    open(bin / 'cramtools', 'w') do |file|
      file.write <<-EOS.undent
        #!/bin/bash
        default_jvm_mem_opts="-Xms512m -Xmx1g"
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
        eval java $jvm_mem_opts $jvm_prop_opts -jar #{java}/cramtools-#{jarversion}.jar $pass_args
      EOS
    end
  end

  test do
    system 'cramtools -h'
  end
end
