#!/bin/bash

WORK_DIR="${1:-$(pwd)}"
DATE=$(date +%y%m%d)

STYLE='\e[1;33m' # bold yellow
CLEAR='\e[0m'

for DIR in ${WORK_DIR}/*; do
	if [[ -d "${DIR}" ]] && [[ -f "${DIR}/Dockerfile" ]]; then
		NAME=${DIR##*/}
		echo -e "${STYLE}${NAME}${CLEAR}"
		docker image build \
			-f "${DIR}/Dockerfile"  \
			-t "${NAME}:${DATE}" \
			-t "${NAME}:latest" \
		    ${DIR}
	fi
done
