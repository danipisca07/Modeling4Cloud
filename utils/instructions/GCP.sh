#Provider, source-ssh-keyfile source-ip destination-ip source-zone destination-zone sequence-number
pings=("GCP ./keys/gcp 35.187.166.139 35.189.69.114 eu-west1-b eu-west2-a 1")

#Provider, source-ssh-keyfile source-ip destination-ssh-keyfile destination-ip source-zone destination-zone connection-port sequence-number
iperfs=("GCP ./keys/gcp 35.187.166.139 ./keys/gcp 35.189.69.114 eu-west1-b eu-west2-a 80 1")

#Provider, source-ssh-keyfile source-ip destination-ssh-keyfile destination-ip source-zone destination-zone connection-port sequence-number
qperfs=("GCP ./keys/gcp 35.189.69.114 ./keys/gcp 35.187.166.139 eu-west2-a eu-west1-b 8080 1")