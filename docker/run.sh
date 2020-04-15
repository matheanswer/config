#!/bin/bash

WORK_DIR="${1:-$(pwd)}"

STYLE='\e[1;33m' # bold yellow
CLEAR='\e[0m'

for DIR in ${WORK_DIR}/*; do
	if [[ -d "${DIR}" ]] && [[ -x "${DIR}/run.sh" ]]; then
		NAME=${DIR##*/}
		echo -e "${STYLE}${NAME}${CLEAR}"
		${DIR}/run.sh
	fi
done
