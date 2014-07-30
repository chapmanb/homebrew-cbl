require 'formula'

class Oncofuse < Formula
  homepage 'http://www.unav.es/genetica/oncofuse.html'
  version '1.0.6'
  url 'http://www.unav.es/genetica/oncofuse-v1.0.6.zip'
  sha1 '783fedbd21dde12355fa07875b0e82305bae5c51'

  def install
    java=share/'java/oncofuse'
    java.install Dir['*', "oncofuse-v#{version}/*"]
    bin.mkdir
    open(bin / 'oncofuse', 'w') do |file|
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
        eval java $jvm_mem_opts $jvm_prop_opts -jar #{java}/Oncofuse.jar $pass_args
      EOS
    end

  end

  test do
    system "oncofuse --version"
  end
end
