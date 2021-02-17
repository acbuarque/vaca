#!/bin/sh

list=$(cat bla.txt)
for p in $list; do
        sanitized_package_name=$(echo $p | sed 's/@postclick\///') #${p#@*/}
        is_package_stage_only=$(cat my-file.txt | grep -c $sanitized_package_name)
        if [[ $is_package_stage_only -ne 0 ]]; then
        	echo "skiping promotion of $sanitized_package_name"
		continue
        fi
	echo "deploying $sanitized_package_name"
done

