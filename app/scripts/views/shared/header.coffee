define [
  'views/base/item_view'
  'templates/shared/header'
], (BaseItemView, template) ->

  class HeaderView extends BaseItemView

    template: template

    ui:
      input: "#new-task"

    events:
      "keypress #new-task": "onInputKeypress"

    onInputKeypress: (e) ->
      ENTER_KEY = 13
      todoText = @ui.input.val().trim()
      if e.which is ENTER_KEY and todoText
        @collection.create title: todoText
        @ui.input.val ""
