quotes = [ {
  first: "You know the day destroys the night..",
  last:  "Night divides the day"
}, {
  first: "Tried to run..",
  last:  "Tried to hide"
}, {
  first: "We chased our pleasures here..",
  last:  "Dug our treasures there"
}, {
  first: "But can you still recall..",
  last:  "The time we cried "
}, {
  first: "I found an island in your arms..",
  last:  "Country in your eyes"
}, {
  first: "Arms that chain..",
  last:  "Eyes that lie"
}, {
  first: "Made the scene..",
  last:  "Week to week"
}, {
  first: "Day to day..",
  last:  "Hour to hour"
}, {
  first: "The gate is straight..",
  last:  "Deep and wide"
} ]

class window.FluxOn
  constructor: ->
    document.addEventListener "deviceready", @onReady, false
    @quoteIndex = 0

  onReady: =>
    $("#invert").prop "disabled", false

    $("#invert").click =>
      if @isInverting()
        @quoteIndex = (@quoteIndex + 1) % quotes.length
        $("#infobox").text quotes[@quoteIndex].first
        $("#invert").removeClass("btn-danger").addClass("btn-success").text "Break on through"
        cordova.plugins.camerapreview.setColorEffect "none"
      else
        $("#infobox").text quotes[@quoteIndex].last
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
