define [
  'models/base'
], (BaseModel) ->

  class Task extends BaseModel

    defaults:
      title: ""
      completed: false
      created_at: 0

    initialize: ->
      super
      @storage = new Offline.Storage 'tasks', @,
        autoPush: true
      @set "created_at", Date.now()  if @isNew()

    toggle: ->
      @set "completed", not @isCompleted()

    isCompleted: ->
      @get "completed"
