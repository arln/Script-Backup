#!/bin/bash

# Script para realizado de backup de todo sistema.


####################
####           #####
#### VARIAVEIS #####
####           #####
####################

DATA=`date +%Y%m%d`
DATA_APAGAR=`date -d '5 days ago' +%Y%m%d`
DESTDIR="/mnt/backup"
DIRSBKP="/root /etc /var/mail /var/lib /boot"

###############################################
##                                           ##
## Criando o dir que vai conter o backup dia ##
##                                           ##
###############################################
/bin/mkdir -p $DESTDIR/$DATA


#########################################################################
##                                                                     ##
## Entrando no diretorio Backup e apagando o diretorio de 5 dias atras ##
##                                                                     ##
#########################################################################

cd $DESTDIR

        /bin/rm -rf $DATA_APAGAR
        echo "Apagado backup do dia $DATA_APAGAR"


##################################################
##                                              ##
## backup do diretorio mail e do etc da maquina ##
##                                              ##
##################################################

tar -cvzf $DESTDIR/$DATA/root-$DATA.tar.gz $DIRSBKP > /tmp/log.tar

