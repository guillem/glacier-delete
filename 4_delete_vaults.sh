
. 0_config.sh

for F in *.ids; do
	VAULT_NAME=`echo $F | cut -d. -f1`
	echo "Deleting vault $VAULT_NAME"
	aws glacier delete-vault --account-id $ACCOUNT_ID --vault-name $VAULT_NAME
done
