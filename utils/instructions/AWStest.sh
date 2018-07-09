# Server

# Connect to server
#sudo ssh -i ~/.ssh/Oregon.pem ubuntu@35.155.194.92
sudo ssh -i ./keys/aws-london.pen ubuntu@35.178.58.44 #Connetti a london
# Download
git clone -b dev https://github.com/danipisca07/Modeling4Cloud.git

# Transfer every ping to local
#sudo scp -r -i ~/.ssh/Oregon.pem ubuntu@35.155.194.92:~/Modeling4Cloud/uploads .
#sudo scp -r -i ~/.ssh/Modeling4Cloud_Oregon.pem ubuntu@35.162.65.108:~/Modeling4Cloud/uploads .
#scp -r -i ~/.ssh/Modeling4Cloud_Oregon.pem ubuntu@35.162.65.108:~/Modeling4Cloud/uploads . # Da centos

#sudo scp -r -i ~/.ssh/MongoDB_UniBO.pem centos@137.204.57.93:~/Modeling4Cloud/uploads .

# Cl-1

# Connect to cl-1
#sudo ssh -i ~/.ssh/Oregon.pem ubuntu@35.161.150.94
#sudo ssh -i ~/.ssh/Modeling4Cloud_Oregon.pem ubuntu@54.214.197.1
# Download
#git clone -b dev https://github.com/albertobagnacani/Modeling4Cloud.git

#tmux
# Run registerPingCsv from london to paris
#./registerPingCsv.sh AWS us-west-2a us-west-2a 54.71.162.201 1
../registerPingCsv.sh AWS us-west-2a us-west-3c 35.180.31.118 1

# Crontab
#crontab -e #[-l-r] # empty line for crontab
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh AWS 1 http://35.155.194.92:5555/api/upload
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh AWS 1 http://35.162.65.108:5555/api/upload
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh AWS 1 http://137.204.57.93:3100/api/upload

# Cl-2

# Connect to cl-2
#sudo ssh -i ~/.ssh/Oregon.pem ubuntu@54.71.162.201
#sudo ssh -i ~/.ssh/Modeling4Cloud_Oregon.pem ubuntu@54.71.76.125

# Download
#git clone -b dev https://github.com/albertobagnacani/Modeling4Cloud.git

#tmux
# Run registerPingCsv from client1 to client2 (same region)
#./registerPingCsv.sh AWS us-west-2a ap-southeast-2a 54.66.193.100 2
#./registerPingCsv.sh AWS us-west-2a ap-southeast-2b 54.252.165.79 2

# Crontab
#crontab -e #[-l-r] # empty line for crontab
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh AWS 2 http://35.155.194.92:5555/api/upload
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh AWS 2 http://35.162.65.108:5555/api/upload
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh AWS 2 http://137.204.57.93:3100/api/upload

# curl
# curl -F "data=@csv/AWS-1-2018-05-01.csv" http://35.155.194.92:5555/api/upload