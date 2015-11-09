require 'formula'
class Seqbuster < Formula
homepage 'https://github.com/lpantano/seqbuster'
version '2.3'
url 'https://github.com/lpantano/seqbuster/archive/miraligner-2.3.zip'
sha1 '260dcb6a5e3c2e6dbb6ada1944d3bb6cd5aa78f6'
def install
  java = share / 'java' / 'seqbuster'
  java.install Dir['*']
  bin.mkdir
  open(bin / 'miraligner', 'w') do |file|
  file.write <<-EOS.undent
    #!/bin/bash
    default_jvm_mem_opts="-Xms750m -Xmx4g"
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
    eval java $jvm_mem_opts $jvm_prop_opts -jar #{java}/modules/miraligner/miraligner.jar $pass_args
  EOS
  end
end
test do
  system 'miraligner -h'
end
end
