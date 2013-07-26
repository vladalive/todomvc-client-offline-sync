define [
  'backbone'
  'backbone_offline'
], (Backbone, Offline) ->

  class BaseModel extends Backbone.Model

    initialize: ->
      super
      @on 'change', =>
        @set 'updated_at', @_timeStamp(),
          silent: true

    _timeStamp: ->
      (new Date).toJSON()
