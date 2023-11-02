# aeivanov_infra
aeivanov Infra repository

###Основное задание###
###Подключение к someinternalhost в одну команду

ssh -i ~/.ssh/id_ed25519 -A -t appuser@158.160.104.2 ssh 10.128.0.29

###Дополнительное задание###
###Правим ~/.ssh/config

nano ~/.ssh/config

###Доступ до ВМ bastion

host bastion
  HostName 158.160.104.2
  User appuser
  IdentityFile ~/.ssh/id_ed25519

###Доступ до ВМ someinternalhost

host someinternalhost
  HostName 10.128.0.29
  User appuser
  IdentityFile ~/.ssh/id_ed25519
  ProxyCommand ssh -W %h:%p bastion

###проверяем подключение

ssh someinternalhost
###подключение к bastion

ssh bastion

bastion_IP = 158.160.104.2
someinternalhost_IP = 10.128.0.29

###ДЗ №6

testapp_IP = 84.201.134.218
testapp_port = 9292

###Сервис "Monolith Reddit"

адресс http://158.160.99.11:9292/

###Дополнительное задание
#для автоматизации установки использовался скрипт metadata.yaml

--metadata-from-file user-data=metadata.yaml

#Развертывание инстанса

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --zone ru-central1-a \
  --metadata-from-file user-data=metadata.yaml
