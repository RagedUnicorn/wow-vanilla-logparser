# LogParser

![](/Docs/lp_ragedunicorn_love_vanilla.png)

> LogParser is an Addon for parsing combatlog messages and dispatching the results to other Addons that subscribed to such events

**Note:** The Addon on its own is not helpful to the player. It is to be understood as a helper that is used by other Addons.

![](/Docs/badge_wow_vanilla.png)

**Note:** With the release of World of Warcraft classic this addon is entering maintenance only mode. This means that no new features will be implemented and only the most important bugs are fixed. There is no classic version of this addon because it is no longer needed to have an extra addon for parsing combatlog messages.

## Installation

WoW-Addons are installed directly in your WoW directory:

`[WoW-installation-directory]\Interface\AddOns`

Make sure to get the newest version of the Addon from the releases tab:

[LogParser-Releases](https://github.com/RagedUnicorn/wow-vanilla-logparser/releases)

> Note: If the Addon is not showing up in your ingame Addonlist make sure that the Addon is named `LogParser` in your Addons folder

## How to use

The Addon has to be separately installed. It is not intended to be used as a library. The reasoning behind this Addon is to prevent doing the same work multiple times. Multiple Addons can subscribe to the same event effectively meaning the message only has to be parsed once and can be used by all subscribed Addons.

### Subscribe

To register a callback to an event call the `SubscribeEvent` function and pass both the type of the event and the callback to the function

```lua
--[[
  @param {number} status
    0 failed to parse message
    1 successfully parsed message
  @param {table} spellData
]]--
function callback(status, spellData)

end

local identifier, eventType = lp.subscriptionManager.SubscribeEvent(
  "addon identifier", -- e.g. com.ragedunicorn.[addon-name]
  callback,
  "event" -- e.g "CHAT_MSG_SPELL_SELF_DAMAGE"
)
```

The callback will be called with the status of the parser and if successful the gathered data. The addon identifier can be freely chosen but it is recommend to use a unique identificator for your addon. Using a reverse domain style notation ensures this.

Status `1` if parsing was successful
Status `0` if parsing failed

The gathered spell data format depends on the type of the event. For details see `LP_Parser.lua`

```lua
{
  ["type"] = "eventType", -- {string} e.g. CHAT_MSG_SPELL_SELF_DAMAGE
  ["spellType"] = spell, -- {number} see LP_CONSTANTS.SPELL_TYPES
  ["source" | "target" etc.], -- {string} depending on what can be extracted from the message
  ...
}
```

### Unsubscribe

By saving the returned identifier the Addon can unsubscribe at some later point when it is no longer needed. This step is optional but should be used if an Addon can be configured to be disabled or if the Addon is no longer interested in the subscribed event.

```lua
lp.eventManager.UnsubscribeEvent(identifier)
```

### Versioning

Addons that use LogParser should make sure that they check for the actual version of LogParser and their expected version before loading the Addon. A version mismatch might result in unexpected errors.

```lua
-- during initialization get version of installed LogParser
local actualVersion = lp.version.GetVersion()
-- compare version with expected version
if actualVersion == expectedVersion then
  -- load addon
else
  -- do not load addon
end
```

## Supported Events

| EventType                                    |
| -------------------------------------------- |
| CHAT_MSG_SPELL_FAILED_LOCALPLAYER            |
| CHAT_MSG_COMBAT_HOSTILE_DEATH                |
| CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE          |
| CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS  |
| CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF            |
| CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE          |
| CHAT_MSG_SPELL_AURA_GONE_OTHER               |
| CHAT_MSG_SPELL_SELF_DAMAGE                   |
| CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE |

**Note:** LogParser does not aim to be able to parse every message encountered in a combat log. It instead focuses on those needed in an actual Addon implementation. If parsing does not work LogParser can be further developed to support such messages. Because of this LogParser itself does not contain a lot of tests. The tests are placed directly in the Addons using the parser to see if the results fits their usage.

## Locale Support

Because the combat log messages that the Addon receives are in the language of the client a separate parser has to be developed depending on the language. This library currently supports `enUS` and `deDE`.

## Development

### Switching between Environments

Switching between development and release can be achieved with maven.

```
mvn generate-resources -Dgenerate.sources.overwrite=true -P development
```

This generates and overwrites `LP_Environment.lua` and `LogParser.toc`. You need to specifically specify that you want to overwrite to files to prevent data loss. It is also possible to omit the profile because development is the default profile that will be used.

Switching to release can be done as such:

```
mvn generate-resources -Dgenerate.sources.overwrite=true -P release
```

In this case it is mandatory to add the release profile.

**Note:** Switching environments has the effect changing certain files to match an expected value depending on the environment. To be more specific this means that as an example test and debug files are not included when switching to release. It also means that variables such as loglevel change to match the environment.

As to not change those files all the time the repository should always stay in the development environment. Do not commit `LogParser.toc` and `LP_Environment.lua` in their release state. Changes to those files should always be done inside `build-resources` and their respective template files marked with `.tpl`.

### Packaging the Addon

To package the addon use the `package` phase.

```
mvn package -P development
```

This generates an addon package for development. For generating a release package the release profile can be used.

```
mvn package -P release
```

### Deploy a Release

Before creating a new release update `addon.tag.version` in `pom.xml`. Afterwards to create a new release and deploy to GitHub the `deploy` profile has to be used.

```
# switch environment to release
mvn generate-resources -Dgenerate.sources.overwrite=true -P release
# deploy release to GitHub
mvn package -P deploy
```

For this to work an oauth token for GitHub is required and has to be configured in your `.m2` settings file.

## License

MIT License

Copyright (c) 2019 Michael Wiesendanger

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
