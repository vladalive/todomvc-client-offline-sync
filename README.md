# TodoMVC client on Marionette.js with offline sync

# Usage

## Requirements

* [Node.js](http://nodejs.org/)

## Install

    npm install -g yo grunt-cli bower
    git clone git@github.com:vladalive/todomvc-client-offline-sync.git
    cd todomvc-client-offline-sync
    npm install
    bower install

## Configure

Copy example config files and add your own keys and values:

    cp app/scripts/settings.coffee.example \
       app/scripts/settings.coffee

    cp grunt-settings.json.example \
       grunt-settings.json

## Start development server

    grunt server --force

Application is now available at:

    http://localhost:9003/

## Build application

    grunt build

## Build PhoneGap package and upload instantly

    grunt release

# License

The MIT License (MIT)

Copyright (c) 2013 [Vlad Alive](http://github.com/vladalive)
