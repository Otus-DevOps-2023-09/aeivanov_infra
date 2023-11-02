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
