#flag -i in bash necessario per caricare il sourcing in modo da poter eseguire npm
ssh -t -i ~/keys/dpiscaglia.pem ubuntu@137.204.57.136 'sudo bash -i -c " 
rm -r -f Modeling4Cloud/
git clone https://github.com/danipisca07/Modeling4Cloud.git

echo "Setup backend"
cd ~/Modeling4Cloud/backend

npm install
npm install -g nodemon
export PORT=3100
nohup nodemon start > backend.out 2> backend.err < /dev/null &

echo "Setup frontend"
cd ~/Modeling4Cloud/frontend

sudo npm install
nohup npm run-script start-dev > frontend.out 2> frontend.err < /dev/null &
"'