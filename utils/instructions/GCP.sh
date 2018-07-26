echo Enable ping from 35.187.101.13 to 35.189.69.114
ssh -i ./keys/gcp ubuntu@35.187.101.13 bash -c "'
rm -r -f ~/Modeling4Cloud
mkdir ~/Modeling4Cloud
mkdir ~/Modeling4Cloud/utils/
sudo apt-get update -qq
sudo apt-get install expect -qq
sudo apt-get install hping3 -qq
sudo apt-get install git -qq'"
scp -r -i ./keys/gcp ./setupHping.sh ubuntu@35.187.101.13:~
scp -r -i ./keys/gcp ../registerHpingCsv.sh ubuntu@35.187.101.13:~/Modeling4Cloud/utils/
scp -r -i ./keys/gcp ../curlCsv.sh ubuntu@35.187.101.13:~/Modeling4Cloud/utils/
ssh -i ./keys/gcp ubuntu@35.187.101.13 bash -c "'./setupHping.sh GCP eu-west1-b eu-west2-a 35.189.69.114 1 http://137.204.57.136:3100/api/upload '"
echo COMPLETE

