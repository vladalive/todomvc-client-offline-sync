#global require

"use strict"

require.config

  paths:
    app: "app"
    app_deps: "config/app_deps"
    jquery: "../components/jquery/jquery"
    backbone: "../components/backbone/backbone"
    underscore: "../components/underscore/underscore"
    bootstrap: "vendor/bootstrap"
    backbone_marionette: "../components/backbone.marionette/lib/backbone.marionette"
    backbone_localstorage: "../components/backbone.localStorage/backbone.localStorage"
    backbone_offline: "vendor/backbone_offline"

  shim:

    jquery:
      exports: '$'

    underscore:
      exports: "_"

    backbone:
      exports: "Backbone"
      deps: [
        "underscore"
        "jquery"
      ]

    backbone_marionette:
      exports: "Backbone.Marionette"
      deps: ["backbone"]

    backbone_localstorage:
      deps: ["backbone"]

    backbone_offline:
      exports: "Offline"
      deps: [
        "underscore"
        "backbone"
      ]

    bootstrap:
      exports: "jquery"
      deps: ["jquery"]

    app:
      deps: [ 'app_deps' ]

require ["app", "jquery", "app_deps"], (app, $) ->
  $ ->
    window.app = app
    app.start()
