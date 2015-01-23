class window.FluxOn
  constructor: ->
    document.addEventListener "deviceready", @onReady, false

  onReady: =>
    $("#invert").prop "disabled", false

    $("#invert").click =>
      if @isInverting()
        $("#infobox").text "You know the day destroys the night.."
        $("#invert").removeClass("btn-danger").addClass("btn-success").text "Break on through"
        cordova.plugins.camerapreview.setColorEffect "none"
      else
        $("#infobox").text "Night divides the day"
        $("#invert").removeClass("btn-success").addClass("btn-danger").text "To the other side"
        cordova.plugins.camerapreview.setColorEffect "negative"

    @setUpVideo()

  isInverting: ->
    $("#invert").hasClass "btn-danger"

  setUpVideo: =>
    width  = parseInt($(window).width()*0.9)
    height = width

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
