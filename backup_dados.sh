#! /bin/bash

ANO=$(date +"%Y")
MES=$(date +"%m")
DATA=$(date +"%Y%m%d")
EMPRESA=$(hostname)
TESTE="teste5"

#ssh davi@192.168.0.22 "mkdir -p ~/var/backups/$EMPRESA/$ANO/$MES/"
#ssh davi@192.168.0.22 "touch ~/Documents/$TESTE.txt"

mkdir -p /var/backups/$EMPRESA/$ANO/$MES/

tar -czf /var/backups/$EMPRESA/$ANO/$MES/backup-$DATA.tar.gz /home/suado

ssh davi@192.168.0.22 "mkdir -p ~/tmp/backups/"

scp /var/backups/$EMPRESA/$ANO/$MES/backup-$DATA.tar.gz davi@192.168.0.22:~/tmp/backups/ 

