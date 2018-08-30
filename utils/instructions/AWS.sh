#Provider, source-ssh-keyfile source-ip destination-ip source-zone destination-zone sequence-number
pings=("AWS ./keys/aws-imol-london.pem 18.130.223.116 35.180.92.154 eu-west-2c eu-west-3c 1")

#Provider, source-ssh-keyfile source-ip destination-ssh-keyfile destination-ip source-zone destination-zone connection-port sequence-number
iperfs=("AWS ./keys/aws-imol-london.pem 18.130.223.116 ./keys/aws-imol-paris.pem 35.180.92.154 eu-west-2c eu-west-3c 80 1")

#Provider, source-ssh-keyfile source-ip destination-ssh-keyfile destination-ip source-zone destination-zone connection-port sequence-number
qperfs=("AWS ./keys/aws-imol-paris.pem 35.180.92.154 ./keys/aws-imol-london.pem 18.130.223.116 eu-west-3c eu-west-2c 8080 1")
