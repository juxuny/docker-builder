#!/bin/bash
set -e
download_link() {
        url="$1"
        base_name=$(basename $url)
        if [ ! -f $base_name ]; then
                echo "not found: $base_name"
                echo "downloading: $url"
                curl -L --output $base_name $url
        fi
}

download_link  https://archive.apache.org/dist/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
download_link https://dl.wzxstudio.com/cache/jdk/jdk-11.0.18_linux-x64_bin.tar.gz 
