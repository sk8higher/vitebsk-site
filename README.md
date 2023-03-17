# Витебск - мой город
[![Coverage Status](https://coveralls.io/repos/github/sk8higher/vitebsk-site/badge.svg?branch=main)](https://coveralls.io/github/sk8higher/vitebsk-site?branch=main)

[Деплой на fly.io](https://vitebsk-site.fly.dev/)

---

# Настройка окружения для запуска приложения

## Установка Windows Subsystem for Linux

Необходимо запустить консоль Powershell от имени администратора, выполнить следующие команды:

    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Далее установить Ubuntu WSL из [Microsoft Store](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6).

(Возможно понадобится перезагрузка)

## Установка Ruby

Заходим в Ubuntu WSL, устанавливаем необходимые зависимости для Ruby:

    sudo apt-get update
    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

Далее устанавливаем инструмент rbenv для установки и запуска различных версий Ruby:

    cd
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    exec $SHELL

Для установки Ruby:

    rbenv install 3.1.2
    rbenv global 3.1.2

Устанавливаем гем bundler:

    gen install bundler
    rbenv rehash

Устанавливаем Node.js, Yarn:

    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    sudo apt update
    sudo apt-get install -y nodejs yarn

Устанавливаем Rails:

    gem install rails
    rbenv rehash

## Запуск проекта

Для того чтобы перейти на необходимый диск:

    cd /mnt/c

(Вместо c - диск, на который нужно перейти)

Клонируем репозиторий:

    git clone https://github.com/sk8higher/vitebsk-site

Если возникли проблемы с доступом, то:

    sudo nano /etc/wsl.conf

В файле пишем:

    [automount]
    options = "metadata"

Через консоль Powershell:

    wsl --shutdown

Заходим заново в WSL и клонируем репозиторий.

## Запуск проекта из консоли

    cd vitebsk-site

Для установки гемов:

    bundle install

Применим миграции к БД:

    rails db:migrate RAILS_ENV=development

(Вместо development возможно production, в зависимости от необходимого окружения)

(Возможно понадобится сборка стилей перед запуском сервера)

    rails assets:precompile

Для запуска приложения в режиме development используем

    bin/dev

Для запуска приложения в режиме production

    foreman start -f Procfile.prod

После запуска приложения оно будет доступно по адресу `localhost:3000`.
