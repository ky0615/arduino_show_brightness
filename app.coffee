growl = require "growl"
Client = require('node-rest-client').Client
client = new Client()


url = "http://sensor.temp.ws/sensor"
j5 = require "johnny-five"
arduino = new j5.Board()

g_flag = false

show_notify = (text, val)->
  console.log val
  return
  unless g_flag
    data =
      data:    {val}
      headers: {"Content-Type": "application/json"}

    try
      client.post url, data, (body)->
        console.log body
    catch e
      console.log e

    g_flag = true
    setTimeout (->g_flag = false), 1000

    if val > 250
      growl "warning: 明るすぎます"
    if val < 170
      growl text
  return

arduino.on "ready", ->
  @pinMode 0, j5.Pin.INPUT
  console.log "start"
  @analogRead 0, (val)->
    show_notify "warning: 暗すぎます", val
