#!/bin/bash

set -x #echo on

ls $PWD

echo "hi"

echo "hihih"

if [[ -z "$PLUGIN_PACKAGES_TO_PROMOTE_FILE_PATH" ]]; then
	echo "file with packages to promote not provided"
	exit 1
else
	export PACKAGES_TO_PROMOTE=$(cat $PACKAGES_TO_PROMOTE_FILE_PATH)
fi

echo $PACKAGES_TO_PROMOTE

