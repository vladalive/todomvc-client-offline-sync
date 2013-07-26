define [
  'views/base/composite_view'
  'templates/tasks/list'
  'views/tasks/item'
], (BaseCompositeView, template, TaskItemView) ->

  class TasksListView extends BaseCompositeView

    template: template

    itemView: TaskItemView

    itemViewContainer: "#tasks-list"

    ui:
      toggle: "#toggle-all"

    events:
      "click #toggle-all": "onToggleAllClick"
      "click #sync-incr": "onSyncIncrClick"

    collectionEvents:
      all: "update"

    onRender: ->
      @update()

    update: ->
      reduceCompleted = (left, right) ->
        left and right.get("completed")
      allCompleted = @collection.reduce(reduceCompleted, true)
      @ui.toggle.prop "checked", allCompleted
      @$el.toggle !!@collection.length

    onToggleAllClick: (e) ->
      isChecked = e.currentTarget.checked
      @collection.each (task) ->
        task.save completed: isChecked

    onSyncIncrClick: (e) ->
      @collection.storage.sync.incremental()
