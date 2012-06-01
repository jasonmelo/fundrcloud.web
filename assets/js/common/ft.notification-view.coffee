namespace 'ft', (exports) ->

  class ft.NotificationView extends Backbone.View
    template: Handlebars.compile $("#notification-tmpl").html()

    className: 'notification-view'

    render: (message, title, level) =>
      $("body").prepend @$el.html @template
        message: message
        title: title
        level: level

      @$('.alert').alert().bind('closed', @destroy)

      clearTimeout @timer if @timer?
      @timer = setTimeout(@triggerClose, 10000)
      @

    triggerClose: =>
      @$('.alert').alert('close')

    destroy: =>
      @remove()

    info: (message, title) =>
      @render(message, title, "info")

    warn: (message, title) =>
      @render(message, title, "warn")

    error: (message, title) =>
      @render(message, title, "error")

    success: (message, title) =>
      @render(message, title, "success")
