# kdbd_infra
kdbd Infra repository

# Домашнее задание 3

bastion_IP = 130.193.50.138  
someinternalhost_IP = 10.130.0.29  

Домен с подписанным сертификатом - 130-193-50-138.sslip.io  

Подключение к someinternalhost в одну команду:  
ssh -J appuser@130.193.50.138 appuser@10.130.0.29

Для подключения через команду ssh someinternalhost:  
добавить в ~/.ssh/config
```
Host bastion
	Hostname 130.193.50.138
    User appuser

Host someinternalhost
	Hostname 10.130.0.29
	User appuser
	ProxyJump bastion
```