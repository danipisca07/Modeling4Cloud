echo Enable ping from 159.122.184.179 to 159.8.123.35
ssh -i ./keys/ibm ubuntu@159.122.184.179 bash -c "'
rm -r -f ~/Modeling4Cloud
mkdir ~/Modeling4Cloud
mkdir ~/Modeling4Cloud/utils/
sudo apt-get update -qq
sudo apt-get install expect -qq
sudo apt-get install hping3 -qq
sudo apt-get install git -qq'"
scp -r -i ./keys/ibm ./setupHping.sh ubuntu@159.122.184.179:~
scp -r -i ./keys/ibm ../registerHpingCsv.sh ubuntu@159.122.184.179:~/Modeling4Cloud/utils/
scp -r -i ./keys/ibm ../curlCsv.sh ubuntu@159.122.184.179:~/Modeling4Cloud/utils/
ssh -i ./keys/ibm ubuntu@159.122.184.179 bash -c "'./setupHping.sh IBM MIL01 PAR01 159.8.123.35 1 http://137.204.57.136:3100/api/upload '"
echo COMPLETE
