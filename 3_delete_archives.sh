
. 0_config.sh

for F in *.ids; do
	VAULT_NAME=`echo $F | cut -d. -f1`
	for ARCHIVE_ID in `jq .ArchiveList[].ArchiveId < $F`; do
		echo "Deleting archive $ARCHIVE_ID from vault $VAULT_NAME"
		aws glacier delete-archive --archive-id=$ARCHIVE_ID --vault-name $VAULT_NAME --account-id $ACCOUNT_ID
	done
done
