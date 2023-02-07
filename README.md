# Настройка окружения для запуска приложения

1. Установка Windows Subsystem for Linux

Необходимо запустить консоль Powershell от имени администратора, выполнить следующие команды:

    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Далее установить Ubuntu WSL из [Microsoft Store](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6).

2. Установка Ruby

Заходим в Ubuntu WSL,
