#!/bin/bash

#Script criado por Kleiton Luiz
#Para backup do LDAP do NETRASUN
#Modificado por Anderson Nascimento 14/04/09

#Variaveis
DATA=`date +%Y%m%d`
DATA_APAGAR=`date -d '5 days ago' +%Y%m%d`
BKPDEST="/dados/samba/cpd/6_Backup/"
ARQUIVO="$BKPDEST/$DATA"


#Iniciando
echo 1. Criando diretorio que irar conter o backup do dia...

/bin/mkdir -p $BKPDEST/$DATA

sleep 1

cd $BKPDEST
        /bin/rm -rf $DATA_APAGAR
echo 2. Apagado backup do dia $DATA_APAGAR...

sleep 5

echo 3. Carregando LDIF...
cd $ARQUIVO


sleep 5

/usr/sbin/slapcat -l $DATA.ldif >> $BKPDEST/$DATA/ldap.log 2>> $BKPDEST/$DATA/ldap.err

sleep 5


echo
echo 4. Comprimindo Arquivo..
/bin/tar -czvf $DATA.ldif.tar.gz $DATA.ldif >> $BKPDEST/$DATA/tar.log 2>> $BKPDEST/$DATA/tar.err


