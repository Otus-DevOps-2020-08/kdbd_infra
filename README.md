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

  # Домашнее задание 5

  Была подготовлена конфигурация для создания образа для установки приложения reddit.  
  Образ создается при помощи packer.  
  Команда для создания образа:  
  ```packer build -var-file=variables.json ./ubuntu16.json```    
  Перед запуском необходимо переменовать variables.json.example в variables.json и прописать там реальные значения.
  
  # Домашнее задание 6

  Подготовлена конфигурация terraform для создания инстанса в Yandex Cloud с Reddit app

  # Домашнее задание 7

   Подготовлена конфигурация terraform  для нескольких серверов.
   Созданы независимые конфигурации terraform  для prod  и stage

  # Домашнее задание 8

  Созданы inventory в форматах ini  и YAML.
  Протестирована работа с ansible из командной строки.
  Создан  простой playbook.

  Команда ```ansible-playbook clone.yml```   
  выводит сначала ```changed=0```, поскольку репозиторий уже существует и менять ничего не надо  
  а после удаления повторный запуск выводит ```changed=1```,  
  так как репозитория не было и он был склонирован

  # Домашнее задание 9

  Были созданы несколько вариантов плейбуков ansible для деплоя приложения reddit:  
  - один play, один файл
  - несколько play в одном файле
  - каждый play в своем файле

  Созданы плейбуки для provision packer и прописаны в конфигах packer

  # Домашнее задание 10

  Созданы отдельные роли для app и db, использовалн стандартный layout для ролей,   
  созданы окружения prod и dev, использована galaxy роль nginx для проксирования с порта 80 на приложение,  
  использован vault для шифрования credentials.  


  # Домашнее задание 11

  Создана vagrant конфигурация.  
  Исправлены роли app и db.  
  Тестирование роли db при помощи molecule.  
  Packer использует роли app и db.
