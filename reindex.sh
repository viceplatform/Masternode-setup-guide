#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;36m'
NC='\033[0m'

clear
echo
echo -e "${BLUE}Stopping Vice Masternode...${NC}"
echo
~/vice/src/vice-cli stop
sleep 5
echo 
echo -e "${YELLOW}Removing Block data...${NC}"
echo
rm -R ~/.vice/blocks
rm -R ~/.vice/budget.dat
rm -R ~/.vice/chainstate
rm -R ~/.vice/database
rm -R ~/.vice/sporks
rm -R ~/.vice/zerocoin
rm ~/.vice/peers.dat
rm ~/.vice/mncache.dat
rm ~/.vice/*.log
echo
echo -e "${BLUE}Starting server...${NC}"
~/vice/src/viced -daemon
sleep 5
./vice/src/vice-cli addnode=212.237.54.9:8089 add
./vice/src/vice-cli addnode=80.211.173.251:8089 add
./vice/src/vice-cli addnode=80.211.72.74:8089 add
./vice/src/vice-cli addnode=80.211.35.252:8089 add
./vice/src/vice-cli addnode=80.211.80.236:8089 add
watch -g ~/vice/src/vice-cli masternode status
