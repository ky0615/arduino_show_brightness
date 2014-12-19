# Showing Brightness for LCD by Arduino and Node.js

## Install
In Arduino, You have to install the `Firmata`  

And then, connect the PC and Arduino.  
You can change to the PC even RaspberryPi.

This code is essential Node.js  
You should install Node.js by nvm

### initial installation

```ShellScript
$ cp config/default.json.example config/default.json
$ vim config/default.json
$ npm install
$ npm start (or coffee app.coffee)
```

## Wiring
| LCD pin name | RS | E  | D4 | D5 | D6 | D7 |
|:-------------|:--:|:--:|:--:|:--:|:--:|:--:|
| Arduino pin  | 7  | 8  | 9  | 10 | 11 | 12 |

the Brightness sensor connect the `Analog 0`

## License
Copyright (c) 2014 Koutarou Yabe  
Released under the MIT license  
http://opensource.org/licenses/mit-license.php
