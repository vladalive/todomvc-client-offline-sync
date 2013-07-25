define [
  'backbone'
  'backbone_marionette'
], (Backbone, Marionette) ->

  vent = new Backbone.Wreqr.EventAggregator()

  # vent.on "all", ->
  #   console.log arguments

  vent.on "tasks:filter", (filter) ->
    filter = filter or "all"
    $("#todoapp").attr "class", "filter-" + filter

  vent
