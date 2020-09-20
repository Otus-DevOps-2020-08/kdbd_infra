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

# Домашнее задание 4

testapp_IP = 84.201.173.98  
testapp_port = 9292  

Установка приложения черех startup script:
```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
  --metadata-from-file user-data=./metadata.yaml
  ```
