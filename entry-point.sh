#!/bin/sh

set -v

set -e

echo "hi"

if [[ -z "$PLUGIN_PACKAGES_TO_PROMOTE_FILE_PATH" ]]; then
	echo "file with packages to promote not provided"
	exit 1
else
	export PACKAGES_TO_PROMOTE=$(cat $PACKAGES_TO_PROMOTE_FILE_PATH)
fi

ls

cat $PACKAGES_TO_PROMOTE_FILE_PATH

echo [ $PACKAGES_TO_PROMOTE ]

