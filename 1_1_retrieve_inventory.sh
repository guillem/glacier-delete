
. 0_config.sh

for VAULT in $VAULTS_TO_DELETE; do
	aws glacier initiate-job --job-parameters '{"Type": "inventory-retrieval"}' --account-id $ACCOUNT_ID --vault-name $VAULT
done
