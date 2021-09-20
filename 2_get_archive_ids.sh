
. 0_config.sh

MY_INPUT=job_status.json

for X in `jq -c '[.JobList[].VaultARN,.JobList[].JobId]' $MY_INPUT | tr -d '[]"' | cut -d/ -f2`; do IFS=','; set -- $X;
	aws glacier get-job-output --account-id $ACCOUNT_ID --vault-name $1 --job-id="$2" $1.ids
done
