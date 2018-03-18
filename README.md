# LogParser

![](/Docs/pvpw_raged_unicorn_logo.png)

> LogParser is a library for parsing combatlog messages and dispatching the results to other addons that registered to such events

**Note: The addon on its own is not helpful to the player. It is to be understood as a library that is used by other addons**

## Installation

WoW-Addons are installed directly in your WoW directory:

`[WoW-installation-directory]\Interface\AddOns`

Make sure to get the newest version of the Addon from the releases tab:

[LogParser-Releases](https://github.com/RagedUnicorn/wow-logparser/releases)

> Note: If the Addon is not showing up in your ingame Addonlist make sure that the Addon is named `LogParser` in your Addons folder


## How to use

To register a callback to an event call the `RegisterCallbackHandler` function and pass both the type of the event and the callback to the function

```lua
local identifier = lp.eventManager.RegisterCallbackHandler(
  callback,
  "event"
)
```

By saving the returned identifier the callback can be unregistered at some later point when it is no longer needed. This step is optional.

```lua
  lp.eventManager.UnregisterCallbackHandler(identifier)
```
## Locale

Because the combat log messages that the addon receives are in the language of the client a separate parser has to be developed depending on the language. This library currently supports `enUS` and `deDE`.

## License

Copyright (c) 2018 Michael Wiesendanger

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
