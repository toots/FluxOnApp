class window.FluxOn
  constructor: ->
    document.addEventListener "deviceready", @onReady, false

  onReady: ->
    rect = {
      x:      0,
      y:      0,
      width:  $(window).width(),
      height: $(window).height()
    }
    cordova.plugins.camerapreview.startCamera rect, "back"
    cordova.plugins.camerapreview.setColorEffect "negative"
