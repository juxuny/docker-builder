#!/bin/bash
set -e
BASE_IMAGE="registry.cn-shenzhen.aliyuncs.com/juxuny-public/builder"
function build() {
	cd "$1" || exit 255
	if [ -f dl.sh ]; then
		./dl.sh
	fi
	docker build -t $BASE_IMAGE:"$1" -f Dockerfile .
	cd - || exit 255
	echo "build success: $BASE_IMAGE:$1"
}


if [[ $# -le 0 ]]; then
	for FILE in *
	do
		echo $FILE
		if [ -d ${FILE} ]; then
			TAG=$(basename ${FILE})
			echo "building image: ${TAG}"
			build ${TAG}
		fi
	done
else
        while [[ $# -gt 0 ]]; do
                build "$1"
                shift
        done
fi
