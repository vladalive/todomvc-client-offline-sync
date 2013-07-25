define [
  'backbone_marionette'
  'vent'
  'views/layouts/main'
], (Marionette, vent, MainLayout) ->

  class AppController extends Marionette.Controller

    filterItems: (filter = '') ->
      app.layout ||= new MainLayout
      vent.trigger "tasks:filter", filter.trim()
