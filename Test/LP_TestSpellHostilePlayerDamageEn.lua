--[[
  MIT License

  Copyright (c) 2018 Michael Wiesendanger

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
]]--

--[[
  To run the tests make sure to include this file into LogParser.toc.

  start test by calling from the game with /run [functionName]
]]--
local mod = lp
local me = {}

mod.testSpellHostilePlayerDamageEn = me

me.tag = "TestSpellHostilePlayerDamageEn"

-- global
local _G = getfenv(0)
local eventName = "SpellHostilePlayerDamage"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_SPELL_HOSTILE_PLAYER_DAMAGE_EN__Test()
  mod.testReporter.StartTestRun("global_spell_hostile_player_damage_en_all")
  mod.testReporter.StartTestEventSet(eventName)

  -- silence logging to errorlevel
  mod.logger.logLevel = 1

  me.RunAll()
end

--[[
  @param {boolean} playManual
    true if testqueue is started manually
    false if testqueue should be started
]]--
function me.RunAll()
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameHits)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameHits)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameHits)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCrits)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCrits)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCrits)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameBeginsToCast)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameBeginsToCast)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameBeginsToCast)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameResisted)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameResisted)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameResisted)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameBlocked)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameBlocked)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameBlocked)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameMissed)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameMissed)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameMissed)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameImmune)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameImmune)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameImmune)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameParried)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameParried)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameParried)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameDodged)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameDodged)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameDodged)

  mod.testReporter.PlayTestQueue()
end

function me.TestParseNormalSpellNameHits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameHits",
    "dummyspell",
    "$player$'s Dummyspell hits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameHits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameHits",
    "dummy_spell",
    "$player$'s Dummy Spell hits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameHits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameHits",
    "dummy_spell",
    "$player$'s Dummy (Spell):-'s hits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameCrits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCrits",
    "dummyspell",
    "$player$'s Dummyspell crits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameCrits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCrits",
    "dummy_spell",
    "$player$'s Dummy Spell crits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameCrits()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCrits",
    "dummy_spell",
    "$player$'s Dummy (Spell):-'s crits you for $amount$.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameBeginsToCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameBeginsToCast",
    "dummyspell",
    "$player$ begins to cast Dummyspell.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameBeginsToCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameBeginsToCast",
    "dummy_spell",
    "$player$ begins to cast Dummy Spell.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSpecialCharacterSpellNameBeginsToCast()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameBeginsToCast",
    "dummy_spell",
    "$player$ begins to cast Dummy (Spell):-'s.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameResisted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameResisted",
    "dummyspell",
    "$player$'s Dummyspell was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameResisted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameResisted",
    "dummy_spell",
    "$player$'s Dummy Spell was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSpecialCharacterSpellNameResisted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameResisted",
    "dummy_spell",
    "$player$'s Dummy (Spell):-'s was resisted.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameBlocked()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameBlocked",
    "dummyspell",
    "$player$'s Dummyspell was blocked.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameBlocked()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameBlocked",
    "dummy_spell",
    "$player$'s Dummy Spell was blocked.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSpecialCharacterSpellNameBlocked()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameBlocked",
    "dummy_spell",
    "$player$'s Dummy (Spell):-'s was blocked.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end


function me.TestParseNormalSpellNameMissed()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameMissed",
    "dummyspell",
    "$player$'s Dummyspell misses you.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameMissed()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameMissed",
    "dummy_spell",
    "$player$'s Dummy Spell misses you.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSpecialCharacterSpellNameMissed()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameMissed",
    "dummy_spell",
    "$player$'s Dummy (Spell):-'s misses you.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameImmune()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameImmune",
    "dummyspell",
    "$player$'s Dummyspell failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameImmune()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameImmune",
    "dummy_spell",
    "$player$'s Dummy Spell failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSpecialCharacterSpellNameImmune()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameImmune",
    "dummy_spell",
    "$player$'s Dummy (Spell):-'s failed. You are immune.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameParried()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameParried",
    "dummyspell",
    "$player$'s Dummyspell was parried.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameParried()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameParried",
    "dummy_spell",
    "$player$'s Dummy Spell was parried.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSpecialCharacterSpellNameParried()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameParried",
    "dummy_spell",
    "$player$'s Dummy (Spell):-'s was parried.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseNormalSpellNameDodged()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameDodged",
    "dummyspell",
    "$player$'s Dummyspell was dodged.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseMultiwordSpellNameDodged()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameDodged",
    "dummy_spell",
    "$player$'s Dummy Spell was dodged.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end

function me.TestParseSpecialCharacterSpellNameDodged()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameDodged",
    "dummy_spell",
    "$player$'s Dummy (Spell):-'s was dodged.",
    mod.testHelper.eventTypeSpellHostilePlayerDamage
  )
end
