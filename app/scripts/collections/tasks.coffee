define [
  'backbone'
  'models/task'
], (Backbone, Task) ->

  class Tasks extends Backbone.Collection

    model: Task

    localStorage: new Backbone.LocalStorage("tasks")

    getCompleted: ->
      @filter @_isCompleted

    getActive: ->
      @reject @_isCompleted

    comparator: (task) ->
      task.get "created_at"

    _isCompleted: (task) ->
      task.isCompleted()
