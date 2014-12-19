client = new (require("node-rest-client").Client)
config = require "config"
j5 = require "johnny-five"
arduino = new j5.Board()
temp = 0

console.log config
arduino.on "ready", ->
  lcd = new j5.LCD
    # LCD pin name RS E D4 D5 D6 D7
    # Arduino pin  7  8 9  10 11 12
    pins: [7..12]
    backlight: 10
    row:2
    cols:16
  lcd.on "ready", ->
    process.on 'uncaughtException', (err)->
      lcd
        .cursor(1, 0)
        .print " Network Error"

    setInterval ->
        data =
          data:
            val: temp
          headers:
            "Content-Type": "application/json"
        client.post config.url, data, (body)->
          console.log body
        temp_str = temp.toString()
        for i in [0..3-temp_str.length]
          temp_str += " "
        lcd
          .cursor(0, 0)
          .print " Brightness: #{temp_str}"
          .cursor 1,0
          .print "                "
      , 1000
  @pinMode 0, j5.Pin.INPUT
  @analogRead 0, (val)->
    temp = val
