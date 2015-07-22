require 'formula'
class Seqbuster < Formula
homepage 'https://github.com/lpantano/seqbuster'
version '1.0'
url 'https://github.com/lpantano/seqbuster/archive/3.1.tar.gz'
sha1 '39342214043e855527e10f25a40d699160953ad1'
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
