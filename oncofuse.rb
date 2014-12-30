require 'formula'

class Oncofuse < Formula
  homepage 'https://github.com/mikessh/oncofuse'
  version '1.0.9'
  url 'https://github.com/mikessh/oncofuse/releases/download/1.0.9a/oncofuse-1.0.9.zip'
  sha1 'c23a93bed693a4641a834f10b69bacf2a4e6cb74'

  def install
    # avoid confusion with __MACOSX folder
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
