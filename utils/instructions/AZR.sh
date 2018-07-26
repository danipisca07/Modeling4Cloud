echo Enable ping from 40.113.125.208 to 40.89.141.170
ssh -i ./keys/gcp ubuntu@40.113.125.208 bash -c "'
rm -r -f ~/Modeling4Cloud
mkdir ~/Modeling4Cloud
mkdir ~/Modeling4Cloud/utils/
sudo apt-get install expect -qq
sudo apt-get install hping3 -qq
sudo apt-get install git -qq'"
scp -r -i ./keys/gcp ./setupHping.sh ubuntu@40.113.125.208:~
scp -r -i ./keys/gcp ../registerHpingCsv.sh ubuntu@40.113.125.208:~/Modeling4Cloud/utils/
scp -r -i ./keys/gcp ../curlCsv.sh ubuntu@40.113.125.208:~/Modeling4Cloud/utils/
ssh -i ./keys/gcp ubuntu@40.113.125.208 bash -c "'./setupHping.sh AZR eu-occ fr-cent 40.89.141.170 1 http://137.204.57.136:3100/api/upload '"
echo COMPLETE
