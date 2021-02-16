#!/bin/sh

list=$(cat bla.txt)
for p in $list; do
	echo "current p: $p"
        sanitized_package_name=${p#@*/}
	echo "sanitized_package_name $sanitized_package_name"
        is_package_stage_only=$(cat my-file.txt | grep -c $sanitized_package_name)
        if [[ $is_package_stage_only -ne 0 ]]; then
        	continue
        fi
	echo "deploying $sanitized_package_name"
done

