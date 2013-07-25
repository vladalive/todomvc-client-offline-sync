define [
  'views/base/item_view'
  'templates/tasks/item'
], (BaseItemView, template) ->

  class TaskItemView extends BaseItemView

    template: template

    tagName: "li"

    ui:
      edit: ".edit"

    events:
      "click .destroy": "destroy"
      "dblclick label": "onEditClick"
      "keydown .edit": "onEditKeypress"
      "focusout .edit": "onEditFocusout"
      "click .toggle": "toggle"

    modelEvents:
      change: "render"

    onRender: ->
      @$el.removeClass "active completed"
      if @model.get("completed")
        @$el.addClass "completed"
      else
        @$el.addClass "active"

    destroy: ->
      @model.destroy()

    toggle: ->
      @model.toggle().save()

    onEditClick: ->
      @$el.addClass "editing"
      @ui.edit.focus()
      @ui.edit.val @ui.edit.val()

    onEditFocusout: ->
      title = @ui.edit.val().trim()
      if title
        @model.set("title", title).save()
        @$el.removeClass "editing"
      else
        @destroy()

    onEditKeypress: (e) ->
      ENTER_KEY = 13
      ESC_KEY = 27
      if e.which is ENTER_KEY
        @onEditFocusout()
        return
      @$el.removeClass "editing"  if e.which is ESC_KEY
