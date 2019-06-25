#! /bin/bash

GRUPO=$1
USUARIO=$2
DATE=$(date +"%d de %b de %Y às %H:%M:%S")

#echo "Verificando disponibilidade para "$USUARIO"..."
#cut -f 1 -d ':' cat /etc/passwd
BUSCAUSUARIO=`cut -f 1 -d ':'  /etc/passwd | grep -w "$USUARIO"`
if [ -n "$BUSCAUSUARIO" ]
then 
    echo "Usuário existente, escolha outro login"
else
    if [ "$GRUPO" = 'professores' ] || [ "$GRUPO" = 'alunos' ] || [ "$GRUPO" = 'tecnicos' ] 
    then
        echo "Adicionando usuário"
        adduser --quiet --gecos "" $USUARIO
        echo "Adicionando ao grupo "$GRUPO""
        usermod -a -G $GRUPO $USUARIO
        cp /home/regras.txt /home/$2
        passwd -e -x 1 $2  

        cd /home/$2 
        echo "Olá "$2", seja bem-vindo(a) ao IFRN.
        Seu cargo na instituição é de: "$1"
        A ativação do seu cadastro foi realizada em: $DATE
        Bom trabalho!" > welcome_$2.txt 
    else
        echo 'Grupo invalido'
    fi

fi

