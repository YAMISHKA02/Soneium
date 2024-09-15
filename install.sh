#!/bin/bash

# Generate jwt.txt
openssl rand -hex 32 > jwt.txt

# Download and rename files
declare -A files=(
    ["minato-genesis.json"]="https://docs.soneium.org/assets/files/minato-genesis-5e5db79442a6436778e9c3c80a9fd80d.json"
    ["docker-compose.yml"]="https://docs.soneium.org/assets/files/docker-compose-003749bd470bb0677fb5b8e2a82103ed.yml"
    ["minato-rollup.json"]="https://docs.soneium.org/assets/files/minato-rollup-6d00cc672bf6c8e9c14e3244e36a2790.json"
    ["sample.env"]="https://docs.soneium.org/assets/files/sample-4ab2cad1f36b3166b45ce4d8fed821ab.env"
)

for file in "${!files[@]}"; do
    wget -q "${files[$file]}" -O "${file}"
done

# Rename sample.env
cp sample.env .env

# Backup original files
mkdir -p org-file
mv sample.env org-file/sample.env
cp minato-genesis.json org-file/org-minato-genesis.json
cp docker-compose.yml org-file/org-docker-compose.yml
cp minato-rollup.json org-file/org-minato-rollup.json

# Display ASCII Art "LEVEL UP"
echo ".-----------------------------------------------."
echo "| _     _______     _______ _       _   _ ____  |"
echo "|| |   | ____\ \   / / ____| |     | | | |  _ \ |"
echo "|| |   |  _|  \ \ / /|  _| | |     | | | | |_) ||"
echo "|| |___| |___  \ V / | |___| |___  | |_| |  __/ |"
echo "||_____|_____|  \_/  |_____|_____|  \___/|_|    |"
echo "| _   _  ___  ____  _____ ____                  |"
echo "|| \ | |/ _ \|  _ \| ____/ ___|                 |"
echo "||  \| | | | | | | |  _| \___ \                 |"
echo "|| |\  | |_| | |_| | |___ ___) |                |"
echo "||_| \_|\___/|____/|_____|____/                 |"
echo "'-----------------------------------------------'"
