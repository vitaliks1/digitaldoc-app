## Family Tree 365 - Open Source Family Tree Software - Laravel 8 Backend API
 ![Latest Stable Version](https://img.shields.io/github/release/familytree365/backend.svg)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/familytree365/backend/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/familytree365/backend/?branch=master)
[![Build Status](https://scrutinizer-ci.com/g/familytree365/backend/badges/build.png?b=master)](https://scrutinizer-ci.com/g/familytree365/backend/build-status/master)
[![Code Intelligence Status](https://scrutinizer-ci.com/g/familytree365/backend/badges/code-intelligence.svg?b=master)](https://scrutinizer-ci.com/code-intelligence)
[![StyleCI](https://github.styleci.io/repos/316440677/shield?branch=master)](https://github.styleci.io/repos/316440677)
[![CodeFactor](https://www.codefactor.io/repository/github/familytree365/backend/badge/master)](https://www.codefactor.io/repository/github/familytree365/backend/overview/master)
[![codebeat badge](https://codebeat.co/badges/911f9e33-212a-4dfa-a860-751cdbbacff7)](https://codebeat.co/projects/github-com-modulargenealogy-genealogy-master)
[![Build Status](https://travis-ci.org/familytree365/backend.svg?branch=master)](https://travis-ci.org/familytree365/backend)
[![CircleCI](https://circleci.com/gh/familytree365/backend.svg?style=svg)](https://circleci.com/gh/familytree365/backend)

## Build Setup

Run following commands
```bash
# install dependencies
$ composer install
$ cp .env.testing .env
```

Set the database information in .env [DB_DATABASE, DB_USERNAME, DB_PASSWORD], then run following commands

```bash
$ php artisan key:generate
$ php artisan migrate --path=database/migrations/landlord --database=landlord
$ php artisan db:seed

# serve with hot reload at localhost:8000
$ php artisan serve
```

## Broadcasting Setup

```bash
# install dependencies
$ npm install -g laravel-echo-server

$ laravel-echo-server configure
$ nano .env

  BROADCAST_DRIVER=redis
  REDIS_PREFIX=

$ laravel-echo-server start
```

If you want to keep it in background proccess you should install pm2 or supervisor

## Description

Browser based genealogy software for interacting and processing data efficiently. Easily create your
own family tree by importing your existing data or manual data entry. Storage of all data is securely on your own server and does
not leave your environment without your permission. In the future there will be optional
smart matching with other servers. This is the Laravel 8 backend, see the frontend repository for the Nuxt / Vue client side support.

## Demo

https://www.familytree365.com - register a free account


<!--h-->

### Thanks

Built with Laravel 8

Special thanks to [Taylor Otwell](https://laravel.com/), [Jeffrey Way](https://laracasts.com)

### Contributions

are welcome. Pull requests are great, but issues are good too.

## Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website. [[Become a sponsor](https://opencollective.com/genealogy#sponsor)]



Please write down here as English what you want me to do. with contact number.

## Ok, thank you!

If you can make two calls for me and my boss, I would be really much appreciated.

# 1. My Boss (His name is Kim Se Guk)
  - Contact number:  His Wife (You can call her like Guk Hyang's Mam 191-232-6768 or 191-370-7692)
  ## Questions:
    *Q1: He's recently sent his salary (22300 USD) to her and want to know if the money is arrived.

    Q2: He want to move the house (3 living rooms/ 15-20K USD) to Moranbong / SeSong / DaeSong county

    Q3: His wife bro is working at new job of , and he want to know his job name exactly.
    Especially, which county? 
    
    Q4: Please take care of his parent well. if , please buy good medicines for their health.

# 2. My Father contact (02-753-2792 or 191-570-1132 - My name is Chung Hyok)

A few days ago, I received letter from home, and I have a few questions.

Q1: I also sent my salary (23300 USD) to my home. Would you please confirm it if they received whole money?

Q2: I've heard that my elder bro is studying at Laywer department of University. Please confirm it again, and if yes, what is his role at classroom? Ex: platoon leader or something like that...

Q3: Please send my greetings to my bro's wife and What is her job?

Q4: What is my cousin's job exactly (His name is Gwang Hyok)? 

