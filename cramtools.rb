require 'formula'

class Cramtools < Formula
  homepage 'http://www.ebi.ac.uk/ena/about/cram_toolkit/'
  version '2.1'
  url 'https://github.com/enasequence/cramtools/raw/master/cramtools-2.1.jar'
  sha1 '5a05df4523f4eb4b00dfeb0b04e8611c923afd2e'

  def install
    java = share / 'java'
    java.install "cramtools-#{version}.jar"
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
                 *)
                    pass_args="$pass_args $arg"
                    ;;
            esac
        done
        if [ "$jvm_mem_opts" == "" ]; then
            jvm_mem_opts="$default_jvm_mem_opts"
        fi
        exec java $jvm_mem_opts $jvm_prop_opts -jar #{java}/cramtools-#{version}.jar $pass_args
      EOS
    end
  end

  test do
    system 'cramtools -h'
  end
end
