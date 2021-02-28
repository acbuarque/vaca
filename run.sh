ear!/bin/sh

set -v
set -e

echo $PLUGIN_GCP_SELECTOR


f=""
for i in $PLUGIN_GCP_SELECTOR; do
	echo $i
	f="$f --selector $i"
done

echo $f

#if [[ -z "$PLUGIN_GCP_ZONE" && -z "$PLUGIN_GCP_REGION" ]]; then
#  echo "both gcp_zone and gcp_region were not passed, at most one must be provided"
#  exit 1
#elif [[ -n "$PLUGIN_GCP_ZONE" && -n "$PLUGIN_GCP_REGION" ]]; then
#  echo "both gcp_zone and gcp_region were passed, at most one must be provided"
#  exit 1
#elif [ -n "$PLUGIN_GCP_ZONE" ]; then
#  export PLUGIN_GCP_ZONE="--zone=$PLUGIN_GCP_ZONE"
#elif [ -n "$PLUGIN_GCP_REGION" ]; then
#  export PLUGIN_GCP_REGION="--region=$PLUGIN_GCP_REGION"
#fi


#list=$(cat bla.txt)
#for p in $list; do
#        sanitized_package_name=$(echo $p | sed 's/@postclick\///') #${p#@*/}
#        is_package_stage_only=$(cat my-file.txt | grep -c $sanitized_package_name)
#        if [[ $is_package_stage_only -ne 0 ]]; then
#        	echo "skiping promotion of $sanitized_package_name"
#		continue
#        fi
#	echo "deploying $sanitized_package_name"
#done

