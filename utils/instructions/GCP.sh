# Server

# Connect to server
gcloud compute ssh ubuntu@server
# Download
git clone -b dev https://github.com/albertobagnacani/Modeling4Cloud.git

# Transfer every ping to local
gcloud compute scp --recurse ubuntu@server:~/Modeling4Cloud/uploads . # Anche da centos

# Cl-1

# Connect to cl-1
gcloud compute ssh ubuntu@client1
# Download
git clone -b dev https://github.com/albertobagnacani/Modeling4Cloud.git

tmux
# Run registerPingCsv from client1 to client2 (same region)
./registerPingCsv.sh GCP us-west1-a us-west1-a 35.203.135.186 1

# Crontab
crontab -e #[-l-r]
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh GCP 1 http://35.197.115.230:5555/api/upload
0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh GCP 1 http://137.204.57.93:3100/api/upload

# Cl-2

# Connect to cl-2
gcloud compute ssh ubuntu@client2
# Download
git clone -b dev https://github.com/albertobagnacani/Modeling4Cloud.git

tmux
# Run registerPingCsv from client1 to client2 (same region)
./registerPingCsv.sh GCP us-west1-a australia-southeast1-a 35.197.175.120 2

# Crontab
crontab -e #[-l-r]
#0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh GCP 2 http://35.197.115.230:5555/api/upload
0 0 * * * ~/Modeling4Cloud/utils/curlCsv.sh GCP 2 http://137.204.57.93:3100/api/upload

# curl
# curl -F "data=@csv/GCP-1-2018-05-01.csv" http://35.197.115.230:5555/api/upload