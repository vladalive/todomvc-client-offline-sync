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
      @set "created_at", @_timeStamp()  if @isNew()

    toggle: ->
      @set "completed", not @isCompleted()

    isCompleted: ->
      @get "completed"
