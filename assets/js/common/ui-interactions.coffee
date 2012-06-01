namespace 'ft', (exports) ->

  class ft.UiInteractions

    setFullHeight: (el, relation, shim) ->
      $(el).height($(relation).height() + shim)

    getHeight: (el) ->
      $(el).height()

    setFullWidth: (el, relation, shim) ->
      $(el).width($(relation).width() + shim)

