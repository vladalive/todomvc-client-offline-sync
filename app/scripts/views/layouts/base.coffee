define [
  'backbone_marionette'
  'views/base/mixins'
], (Marionette, ViewsMixins) ->

  class BaseLayout extends Marionette.Layout

  _.extend BaseLayout.prototype, ViewsMixins

  BaseLayout
