#!/bin/bash
set -ex
src_dir=/open-source

function download_gcc_source() {
	version="$1"
	if [ ! -d "${src_dir}" ]; then mkdir ${src_dir}; fi
	if [ ! -f ${src_dir}/gcc-${version}.tar.gz ]; then
		curl -L https://bigsearcher.com/mirrors/gcc/releases/gcc-${version}/gcc-${version}.tar.gz --output ${src_dir}/gcc-${version}.tar.gz
	fi
}

function compile_and_install() {
	version="$1"
	cd ${src_dir}
	tar xvzf gcc-${version}.tar.gz
	cd gcc-${version}
	./configure
	make && make install 
	cd - && rm -rf gcc-${version}
}


version_list="10.4.0"
for version in ${version_list}; do
	echo "compiling version: ${version}"
	download_gcc_source ${version}
done
for version in ${version_list}; do
	echo "compiling version: ${version}"
	compile_and_install ${version}
done
