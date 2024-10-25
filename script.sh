#!/bin/bash

echo "Criando diretórios, grupos, alterando donos e permissões..."

mkdir /publico
chmod 777 /publico

FOLDERS = ('/adm', '/ven', '/sec')
GROUPS = ('GRP_ADM','GRP_VEN','GRP_SEC')

for((cont=0;cont<${#FOLDERS[@]};cont++)); do
    mkdir ${FOLDERS[$cont]}
    groupadd ${GROUPS[$cont]}
    chown root:${GROUPS[$cont]} ${FOLDERS[$cont]}
    chmod 770 ${FOLDERS[$cont]}
done

echo "Criando usuários e adicionando-os aos devidos grupos..."

for i in carlos maria joao; do
  useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done

for i in debora sebastiana roberto; do
  useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
done

for i in josefina amanda rogerio; do
  useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
done

echo "Fim....."