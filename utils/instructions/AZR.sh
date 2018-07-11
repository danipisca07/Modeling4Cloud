ssh -i ./keys/gcp ubuntu@40.113.124.89 git clone https://github.com/danipisca07/Modeling4Cloud.git

ssh -i ./keys/gcp ubuntu@40.113.124.89 ~/Modeling4Cloud/utils/registerHpingCsv.sh AZR europa-occ francia-cent 40.89.137.171 1

# Crontab
#crontab -e #[-l-r] # empty line for crontab
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh AWS 1 http://35.178.58.44:5555/api/upload