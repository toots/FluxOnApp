class window.FluxOn
  constructor: ->
    document.addEventListener "deviceready", @onReady, false

  onReady: =>
    params = {
      x:        0,
      y:        0,
      width:    $(window).width(),
      height:   $(window).height(),
      tapPhoto: false,
      camera:   CameraPreview.CAMERA_DIRECTION.BACK
    }
    CameraPreview.startCamera params, @setNegativeEffect, @onError 

  setNegativeEffect: =>
    CameraPreview.setColorEffect CameraPreview.COLOR_EFFECT.NEGATIVE, @onSuccess, @onError

  onSuccess: ->
    console.log "Success!"

  onError: (err) ->
    console.log "Error: ", err
