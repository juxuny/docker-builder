#!/bin/bash
BASE_IMAGE="registry.cn-shenzhen.aliyuncs.com/juxuny-public/builder"
function publish() {
	docker push $BASE_IMAGE:"$1" 
}


if [[ $# -le 0 ]]; then
	LIST=$(ls)
	for FILE in *
	do
		if [ -d ${FILE} ]; then
			TAG=$(basename ${FILE})
			echo "building image: ${TAG}"
			publish ${TAG}
		fi
	done
else
        while [[ $# -gt 0 ]]; do
                publish "$1"
                shift
        done
fi
