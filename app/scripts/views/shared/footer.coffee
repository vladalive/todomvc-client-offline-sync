define [
  'views/base/item_view'
  'templates/shared/footer'
  'vent'
], (BaseItemView, template, vent) ->

  class FooterView extends BaseItemView

    template: template

    ui:
      filters: "#filters a"

    events:
      "click #clear-completed": "onClearClick"

    collectionEvents:
      all: "render"

    templateHelpers:

      activeCountLabel: ->
        ((if @activeCount is 1 then "item" else "items")) + " left"

    initialize: ->
      @listenTo vent, "tasks:filter", @updateFilterSelection, this
      @

    serializeData: ->
      active = @collection.getActive().length
      total = @collection.length

      activeCount: active
      totalCount: total
      completedCount: total - active

    onRender: ->
      @$el.toggle @collection.length > 0
      @updateFilterSelection()

    updateFilterSelection: ->
      @ui.filters.removeClass("selected").filter("[href=\"" + (location.hash or "#") + "\"]").addClass "selected"

    onClearClick: ->
      completed = @collection.getCompleted()
      completed.forEach (task) ->
        task.destroy()
