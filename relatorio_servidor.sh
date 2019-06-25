#! /bin/bash

clear


ANTES="\033[1m"
DEPOIS="\033[0m"

NOME=$(hostname)
MEMORIA=$(free --mega | grep -w "Mem" | awk '{print $2}')
PLACADEREDE=$(ip link |awk -F: '$0 !~ "enp|vir|lo|^[^0-9]"{print $2}')
IP=$(ifconfig $PLACADEREDE |grep -w "inet" | awk '{print$2 "/" $4}')
MAC=$(ifconfig $PLACADEREDE | grep ether | awk '{print $2}')
FABRICANTE=$(lscpu | grep -w "Vendor ID:" | awk '{print $3}')
VELOCIDADE=$(lscpu | grep -w "CPU MHz:" | awk '{print $3}')
NNUCLEOS=$(lscpu | grep -w "^CPU(s):" | awk '{print $2}')
ARQUITETURA=$(lscpu | grep -w "Architecture" | awk '{print $2}')
TCP=$(netstat --tcp --listening --programs)
LOGINS=$(last -i -n 5 | grep -w -v "reboot" | grep -w -v "wtmp" | awk '{print $1 " " $3}')

echo -e "
Relatório Gerencial do Servidor $ANTES $NOME $DEPOIS

1- Informações da placa de rede $ANTES $PLACADEREDE $DEPOIS
     - IP = $ANTES $IP $DEPOIS
     - MAC = $ANTES $MAC $DEPOIS

2- Memória RAM (em MB): $ANTES $MEMORIA $DEPOIS Megabytes

3- Processador
     - Fabricante: $ANTES $FABRICANTE $DEPOIS
     - Velocidade: $ANTES $VELOCIDADE $DEPOIS MHz   
     - Número de núcleos: $ANTES $NNUCLEOS $DEPOIS
     - Arquitetura: $ANTES $ARQUITETURA $DEPOIS

4- Serviços TCP em execução 

$ANTES $TCP $DEPOIS


5- Últimos 5 logins:

Usuário  IP
$ANTES$LOGINS $DEPOIS


" 