define [
  'backbone'
], (Backbone) ->

  class Task extends Backbone.Model

    defaults:
      title: ""
      completed: false
      created_at: 0

    initialize: ->
      super
      @set "created_at", Date.now()  if @isNew()

    toggle: ->
      @set "completed", not @isCompleted()

    isCompleted: ->
      @get "completed"
