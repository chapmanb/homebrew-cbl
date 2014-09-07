require 'formula'

class Smash < Formula
  homepage 'https://github.com/amplab/smash/tree/master/calldiff'
  version '2014-09-05'
  url 'https://github.com/amplab/smash.git', :revision => '8d1ed10512'

  # depends_on 'maven'
  # depends_on 'java8' -- needs 8u11, since u20 has a build regression

  def install
    cd 'calldiff' do
      system 'mvn assembly:assembly'
    end
    java = share / 'java'
    java.install 'calldiff/target/calldiff-jar-with-dependencies.jar'
    bin.mkdir
    open(bin / 'smash', 'w') do |file|
      file.write <<-EOS.undent
        #!/bin/bash
        default_jvm_mem_opts="-Xms512m -Xmx2g"
        jvm_mem_opts=""
        jvm_prop_opts=""
        pass_args=""
        for arg in "$@"; do
            case $arg in
                '-D'*)
                    jvm_prop_opts="$jvm_prop_opts $arg"
                    ;;
                '-XX'*)
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
        eval java $jvm_mem_opts $jvm_prop_opts -jar #{java}/calldiff-jar-with-dependencies.jar $pass_args
      EOS
    end
  end

  test do
    system 'smash --help'
  end
end
