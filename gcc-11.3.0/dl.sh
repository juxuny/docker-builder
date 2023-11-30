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

version="11.3.0"
download_link  https://bigsearcher.com/mirrors/gcc/releases/gcc-${version}/gcc-${version}.tar.gz
