class window.FluxOn
  constructor: ->
    document.addEventListener "deviceready", @onReady, false

  onReady: =>
    $("#invert").prop "disabled", false

    $("#invert").click =>
      if @isInverting()
        $("#invert").removeClass("btn-danger").addClass("btn-success").text "Negative"
        cordova.plugins.camerapreview.setColorEffect "none"
      else
        $("#invert").removeClass("btn-success").addClass("btn-danger").text "Energy"
        cordova.plugins.camerapreview.setColorEffect "negative"

    @setUpVideo()

  isInverting: ->
    $("#invert").hasClass "btn-danger"

  setUpVideo: =>
    marginTop = parseInt $("#photo-canvas").css("margin-top"), 10
    width  = $(window).width()-2*marginTop
    height = $(window).height()-$("#controls").outerHeight(true)-marginTop

    $("#photo-canvas").width  width
    $("#photo-canvas").height height

    {left, top} = $("#photo-canvas").offset()
    rect        = {
      x:      left,
      y:      top,
      width:  width,
      height: height
    }
    cordova.plugins.camerapreview.startCamera rect, "back"

    if @isInverting()
      cordova.plugins.camerapreview.setColorEffect "negative"
    else
      cordova.plugins.camerapreview.setColorEffect "none"
