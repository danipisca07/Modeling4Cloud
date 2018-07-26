echo Enable ping from 18.130.223.116 to 35.180.92.154
ssh -i ./keys/aws-imol-london.pem ubuntu@18.130.223.116 bash -c "'
rm -r -f ~/Modeling4Cloud
mkdir ~/Modeling4Cloud
mkdir ~/Modeling4Cloud/utils/
sudo apt-get update -qq
sudo apt-get install expect -qq
sudo apt-get install hping3 -qq
sudo apt-get install git -qq'"
scp -r -i ./keys/aws-imol-london.pem ./setupHping.sh ubuntu@18.130.223.116:~
scp -r -i ./keys/aws-imol-london.pem ../registerHpingCsv.sh ubuntu@18.130.223.116:~/Modeling4Cloud/utils/
scp -r -i ./keys/aws-imol-london.pem ../curlCsv.sh ubuntu@18.130.223.116:~/Modeling4Cloud/utils/
ssh -i ./keys/aws-imol-london.pem ubuntu@18.130.223.116 bash -c "'./setupHping.sh AWS eu-west-2c eu-west-3c 35.180.92.154 1 http://137.204.57.136:3100/api/upload '"
echo COMPLETE
