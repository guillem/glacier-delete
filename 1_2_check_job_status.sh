
. 0_config.sh

MY_OUTPUT=job_status.json

for VAULT in $VAULTS_TO_DELETE; do
	aws glacier list-jobs --account-id $ACCOUNT_ID --vault-name $VAULT
done > $MY_OUTPUT

jq '.JobList[].Completed' $MY_OUTPUT
