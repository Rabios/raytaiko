# raytaiko
Simple Taiko No Tatsujin engine written in Lua using [raylib](http://www.raylib.com), Via [Astie Teddy's raylib LuaJIT binding](https://github.com/TSnake41/raylib-lua),Moddable with Lua.

<img src="https://github.com/Rabios/raytaiko/blob/master/Screenshot%20(193).png">

## How to play?

When circle passes the line:

- If first color,Which is red,Hit up arrow
- If second color,Which is blue,Hit down arrow

## More added on the main game

When circle passes the line:

- If third color,Which is green,Hit left arrow
- If fourth color,Which is purple,Hit right arrow

## How to mod the game?

- In `config.lua`,You can edit game preferences and also score increasion value to multiplied by combo,And to add song in `config.resources.song` and custom level in `config.level`,Or add your own preferences to use with `game.lua` file.
- Game logic,Input,And loading content and level lies in `game.lua`,You can edit it for more levels,Or editing it fully if you have experience with [raylib-lua](https://github.com/TSnake41/raylib-lua).
- You can also edit input and circle colors and even reskin the engine,All that in `config.lua`And you can add your touches to `game.lua` if you want.

> NOTES: You might need to learn some [Lua](https://lua.org) and [LuaJIT](https://luajit.org) to mod some parts of the game

## Why this made?

My upcoming rhythm game who called Reve,Will use it's portions but if you love Taiko No Tatsujin you can do your edits on this one, You can also transform it into full game with your edit,Or make a game engine from zero using it.

So i made engine separated of the game for education and fun purposes,Edit it as you want as it's licensed in MIT license

## Credits

- Rabia Alhaffar (Main developer)

### Used

- [Lua](https://lua.org)
- [LuaJIT](https://luajit.org)
- [raylib](http://www.raylib.com)
- [raylib-lua](https://github.com/TSnake41/raylib-lua)
- [Hit sound (5.wav) by adcbicycle on freesound.org](https://freesound.org/people/adcbicycle/sounds/13909)
- [Miss sound (Throw/Swipe) by mrickey13 on freesound.org](https://freesound.org/people/mrickey13/sounds/515625)

## License
```
MIT License

Copyright (c) 2020 - 2021 Rabia Alhaffar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
