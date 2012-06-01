namespace 'ft', (exports) ->

  class ft.ViewLoader

    getViewHandle: (viewclass) ->
      viewlib =
        "SupportView": ln.SupportView
        "ParticipantProfileView": ln.ParticipantProfileView
        "ShareholderSetupView": ln.ShareholderSetupView
        "EditParamatersView": ln.EditParamatersView

      viewlib[viewclass]

    setupInfoPanel: ->
      topPos = $("#active-content").position().top
      rightEdge = $("#active-content").offset().left + $("#active-content").outerWidth()
      windowWidth = $(window).width()
      panelWidth = ($("#active-content").outerWidth())
      windowHeight = $(window).height()
      rightPos = 20 #windowWidth - rightEdge - 10
      cssObj =
        "top": topPos
        "right": rightPos
        "height": (windowHeight - 122)
        "width": panelWidth
      $(".panel").css cssObj

      ui = new ln.UiInteractions()
      ui.setFullWidth("#panel-content-container", "#active-content", -40)

    toggleInfoPanel: (e, viewobj, optionpkg, callback) ->
      self = @
      $panels = $(".panels > .panel")

      #check an attribute of e to see if the same or a different link was clicked
      #the name/id is passed in as an attribute of the .panel, we then check this id
      #to see if its the same on subsequent calls

      if $panels.is(":visible")
        self.hideInfoPanel()
      else
        self.showInfoPanel(viewobj, optionpkg, callback)

    hideInfoPanel: () ->
      $panels = $(".panels > .panel")
      $panels.find(".panel-content").fadeOut 250, ->
        $panels.animate
          width: "hide"
        , 500, ->
          @
      @

    showInfoPanel: (viewobj, optionpkg, callback) ->
      self = @
      $panels = $(".panels > .panel")
      $("#panel-content-container").html('')
      optionpkg.el = $("#panel-content-container")
      new viewobj(optionpkg)
      $panels.animate
        width: "show"
      , 500, ->
        $panels.find(".panel-content").fadeIn 250, ->
          callback() if callback
          $panels.find(".panel-content .close-panel").on "click", ->
            self.hideInfoPanel(self)
          @
      @

