#!/bin/sh

list=$(cat bla.txt)
for p in $list; do
	echo "current p: $p"
        sanitized_package_name=${p#@*/}
        cat my-file.txt | grep drone-convert-service
        cat my-file.txt | grep 'vaca'
        echo "sanitized_package_name $sanitized_package_name"
        is_package_stage_only=$(cat my-file.txt | grep -c $sanitized_package_name)
        if [[ $is_package_stage_only -ne 0 ]]; then
        	continue
        fi
done

