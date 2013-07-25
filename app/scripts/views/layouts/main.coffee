define [
  'views/layouts/base'
  'templates/layouts/main'
  'vent'
  'collections/tasks'
  'views/shared/header'
  'views/shared/footer'
  'views/tasks/list'
], (BaseLayout, template, vent, \
    Tasks, \
    HeaderView, FooterView, TasksListView) ->

  class MainLayout extends BaseLayout

    template: template

    el: '#todoapp'

    initialize: ->
      @initModels()
      @initCollections()
      @initViews()
      @initViewsEvents()
      @render()
      @collections.tasks.fetch()
      @

    initModels: ->
      @models ||= {}

    initCollections: ->
      @collections ||= {}
      @collections.tasks = new Tasks

    initViews: ->
      @views ||= {}
      @views.header = new HeaderView
        collection: @collections.tasks
      @views.footer = new FooterView
        collection: @collections.tasks
      @views.tasks = new TasksListView
        collection: @collections.tasks

    initViewsEvents: ->

    onRender: ->
      @assignSubView
        '#header': @views.header
        '#footer': @views.footer
        '#main': @views.tasks
