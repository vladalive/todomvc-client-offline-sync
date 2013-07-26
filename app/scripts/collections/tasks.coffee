define [
  'backbone'
  'models/task'
  'settings'
], (Backbone, Task, SETTINGS) ->

  class Tasks extends Backbone.Collection

    model: Task

    url: SETTINGS.server.root_url + '/v1/tasks'

    initialize: ->
      @storage = new Offline.Storage 'tasks', @

    getCompleted: ->
      @filter @_isCompleted

    getActive: ->
      @reject @_isCompleted

    comparator: (task) ->
      task.get "created_at"

    _isCompleted: (task) ->
      task.isCompleted()
