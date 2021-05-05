# Introduction

I wasn't using my Glacier backups anymore, specifically backups created with a Mac app that I had deleted ages ago. When I wanted to delete the vaults I discovered how difficult that was: they must be empty to be deleted and you can only delete the archives inside them programmatically (via API, etc.) I wrote this to make it a little bit easier.

Glacier is slow and asynchronous, for example step 1.2 could take hours. A smarter, more complex script could be written to handle all the steps automatically in a single run. To make it easier to read and more robust I probably should have used Python. But since I only needed to run it once, this was enough for me (and hopefully it will be for you too). If you just want to clean up your Glacier, this is way cheaper than buying a third party GUI tool to do the same.

# Disclaimer

The purpose of these scripts is to DELETE all the archives in the specified Glacier vaults and then delete the vaults themselves. If you don't want to do that, don't run the scripts!

Also, I ran these scripts exactly once (May 2021) and they worked for me. That's all. Total actual successful executions as far as I know: one. Please bear this in mind.

# Requirements

- bash

- AWS CLI

- jq

# Caveats

These are really basic bash scripts. Some string parsing is performed with cut and tr. If you have fancy vault or archive names with dots, spaces, quotes, etc., something might break. In that case you may want to check the code before running it. Anyway, if it fails it should do it harmlessly. This is, the commands will fail to run and produce the expected result, but nothing else should happen.

# HOW TO DELETE YOUR GLACIER ARCHIVES AND VAULTS

Use the scripts in order:

- 0_config.sh: edit to enter your API Keys, region, and list of Vault IDs to delete

- 1_1_retrieve_inventory.sh: run once, this will create jobs in AWS to retrieve information about the vaults

- 1_2_check_job_status.sh: run repeatedly until you get "true" for all jobs (this writes job_status.json) *this could take hours*

- 2_get_archive_ids.sh: run once to get the Archive IDs (this reads job_status.json and writes several <vault_name>.ids files)

- 3_delete_archives.sh: run once to delete the archives (this reads all <vault_name>.ids files) *this could take hours*

- 4_delete_vaults.sh: run once to delete the empty vaults

- 5_cleanup.sh: run once to delete local temporary files

# Acknowledgement

This was inspired by https://gist.github.com/veuncent/ac21ae8131f24d3971a621fac0d95be5

It's almost the same, actually. I just wanted to reduce typing and copy-paste so I wrote scripts for every step.
