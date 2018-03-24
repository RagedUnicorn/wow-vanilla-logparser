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

mod.testSpellFailedLocalPlayerEn = me

me.tag = "TestSpellFailedLocalPlayerEn"

-- global
local _G = getfenv(0)
local eventName = "SpellFailedLocalPlayer"

--[[
  global function to start all tests
]]--
function _G.__PVPW__TEST_SPELL_SPELL_FAILED_LOCAL_PLAYER_EN__Test()
  mod.testReporter.StartTestRun("global_spell_failed_local_player_en_all")
  mod.testReporter.StartTestEventSet(eventName)

  -- silence logging to errorlevel
  mod.logger.logLevel = 4

  me.RunAll()
end

--[[
  @param {boolean} playManual
    true if testqueue is started manually
    false if testqueue should be started
]]--
function me.RunAll()
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCastInterrupted)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCastInterrupted)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameCastInterrupted)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCastActionInProgress)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCastActionInProgress)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameCastActionInProgress)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCastNothingToDispel)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCastNothingToDispel)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameCastNothingToDispel)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCastNotEnoughMana)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCastNotEnoughMana)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameCastNotEnoughMana)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCastNoTarget)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCastNoTarget)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameCastNoTarget)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNameCastCantDoWhileMoving)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNameCastCantDoWhileMoving)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNameCastCantDoWhileMoving)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformNoTarget)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformNoTarget)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformNoTarget)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformOutOfRange)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformOutOfRange)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformOutOfRange)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformMustBeInFrontOfTarget)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformMustBeInFrontOfTarget)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformMustBeInFrontOfTarget)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformInvalidTarget)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformInvalidTarget)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformInvalidTarget)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformNotEnoughEnergy)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformNotEnoughEnergy)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformNotEnoughEnergy)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformNotRecovered)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformNotRecovered)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformNotRecovered)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformCantDoWhileDisoriented)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformCantDoWhileDisoriented)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformCantDoWhileDisoriented)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformTargetToClose)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformTargetToClose)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformTargetToClose)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformInCombat)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformInCombat)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformInCombat)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformMustBeStealth)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformMustBeStealth)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformMustBeStealth)
  mod.testReporter.AddToTestQueue(me.TestParseNormalSpellNamePerformTargetIsCombat)
  mod.testReporter.AddToTestQueue(me.TestParseMultiwordSpellNamePerformTargetIsCombat)
  mod.testReporter.AddToTestQueue(me.TestParseSpecialCharacterSpellNamePerformTargetIsCombat)

  mod.testReporter.PlayTestQueue()
end

function me.TestParseNormalSpellNameCastInterrupted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCastInterrupted",
    "dummyspell",
    "You fail to cast Dummyspell: Interrupted.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNameCastInterrupted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCastInterrupted",
    "dummy_spell",
    "You fail to cast Dummy Spell: Interrupted.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNameCastInterrupted()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameCastInterrupted",
    "dummy_spell",
    "You fail to cast Dummy (Spell):-'s: Interrupted.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNameCastActionInProgress()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCastActionInProgress",
    "dummyspell",
    "You fail to cast Dummyspell: Another action is in progress.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNameCastActionInProgress()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCastActionInProgress",
    "dummy_spell",
    "You fail to cast Dummy Spell: Another action is in progress.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNameCastActionInProgress()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameCastActionInProgress",
    "dummy_spell",
    "You fail to cast Dummy (Spell):-'s: Another action is in progress.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNameCastNothingToDispel()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCastNothingToDispel",
    "dummyspell",
    "You fail to cast Dummyspell: Nothing to dispel.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNameCastNothingToDispel()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCastNothingToDispel",
    "dummy_spell",
    "You fail to cast Dummy Spell: Nothing to dispel.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNameCastNothingToDispel()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameCastNothingToDispel",
    "dummy_spell",
    "You fail to cast Dummy (Spell):-'s: Nothing to dispel.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNameCastNotEnoughMana()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCastNotEnoughMana",
    "dummyspell",
    "You fail to cast Dummyspell: Not enough mana.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNameCastNotEnoughMana()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCastNotEnoughMana",
    "dummy_spell",
    "You fail to cast Dummy Spell: Not enough mana.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNameCastNotEnoughMana()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameCastNotEnoughMana",
    "dummy_spell",
    "You fail to cast Dummy (Spell):-'s: Not enough mana.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNameCastNoTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCastNoTarget",
    "dummyspell",
    "You fail to cast Dummyspell: No target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNameCastNoTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCastNoTarget",
    "dummy_spell",
    "You fail to cast Dummy Spell: No target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNameCastNoTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameCastNoTarget",
    "dummy_spell",
    "You fail to cast Dummy (Spell):-'s: No target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNameCastCantDoWhileMoving()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNameCastCantDoWhileMoving",
    "dummyspell",
    "You fail to cast Dummyspell: Can't do that while moving.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNameCastCantDoWhileMoving()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNameCastCantDoWhileMoving",
    "dummy_spell",
    "You fail to cast Dummy Spell: Can't do that while moving.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNameCastCantDoWhileMoving()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNameCastCantDoWhileMoving",
    "dummy_spell",
    "You fail to cast Dummy (Spell):-'s: Can't do that while moving.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformNoTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformNoTarget",
    "dummyspell",
    "You fail to perform Dummyspell: No target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformNoTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformNoTarget",
    "dummy_spell",
    "You fail to perform Dummy Spell: No target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformNoTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformNoTarget",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: No target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformOutOfRange()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformOutOfRange",
    "dummyspell",
    "You fail to perform Dummyspell: Out of range.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformOutOfRange()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformOutOfRange",
    "dummy_spell",
    "You fail to perform Dummy Spell: Out of range.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformOutOfRange()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformOutOfRange",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: Out of range.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformMustBeInFrontOfTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformMustBeInFrontOfTarget",
    "dummyspell",
    "You fail to perform Dummyspell: You must be in front of your target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformMustBeInFrontOfTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformMustBeInFrontOfTarget",
    "dummy_spell",
    "You fail to perform Dummy Spell: You must be in front of your target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformMustBeInFrontOfTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformMustBeInFrontOfTarget",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: You must be in front of your target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformInvalidTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformInvalidTarget",
    "dummyspell",
    "You fail to perform Dummyspell: Invalid target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformInvalidTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformInvalidTarget",
    "dummy_spell",
    "You fail to perform Dummy Spell: Invalid target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformInvalidTarget()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformInvalidTarget",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: Invalid target.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformNotEnoughEnergy()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformNotEnoughEnergy",
    "dummyspell",
    "You fail to perform Dummyspell: Not enough energy.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformNotEnoughEnergy()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformNotEnoughEnergy",
    "dummy_spell",
    "You fail to perform Dummy Spell: Not enough energy.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformNotEnoughEnergy()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformNotEnoughEnergy",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: Not enough energy.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformNotRecovered()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformNotRecovered",
    "dummyspell",
    "You fail to perform Dummyspell: Not yet recovered.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformNotRecovered()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformNotRecovered",
    "dummy_spell",
    "You fail to perform Dummy Spell: Not yet recovered.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformNotRecovered()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformNotRecovered",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: Not yet recovered.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformCantDoWhileDisoriented()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformCantDoWhileDisoriented",
    "dummyspell",
    "You fail to perform Dummyspell: Can't do that while disoriented.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformCantDoWhileDisoriented()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformCantDoWhileDisoriented",
    "dummy_spell",
    "You fail to perform Dummy Spell: Can't do that while disoriented.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformCantDoWhileDisoriented()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformCantDoWhileDisoriented",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: Can't do that while disoriented.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformTargetToClose()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformTargetToClose",
    "dummyspell",
    "You fail to perform Dummyspell: Target to close.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformTargetToClose()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformTargetToClose",
    "dummy_spell",
    "You fail to perform Dummy Spell: Target to close.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformTargetToClose()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformTargetToClose",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: Target to close.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformInCombat()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformInCombat",
    "dummyspell",
    "You fail to perform Dummyspell: You are in combat.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformInCombat()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformInCombat",
    "dummy_spell",
    "You fail to perform Dummy Spell: You are in combat.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformInCombat()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformInCombat",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: You are in combat.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformMustBeStealth()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformMustBeStealth",
    "dummyspell",
    "You fail to perform Dummyspell: Must be in Stealth.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformMustBeStealth()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformMustBeStealth",
    "dummy_spell",
    "You fail to perform Dummy Spell: Must be in Stealth.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformMustBeStealth()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformMustBeStealth",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: Must be in Stealth.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseNormalSpellNamePerformTargetIsCombat()
  mod.testHelper.TestParse(
    eventName,
    "TestParseNormalSpellNamePerformTargetIsCombat",
    "dummyspell",
    "You fail to perform Dummyspell: Target is in combat.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseMultiwordSpellNamePerformTargetIsCombat()
  mod.testHelper.TestParse(
    eventName,
    "TestParseMultiwordSpellNamePerformTargetIsCombat",
    "dummy_spell",
    "You fail to perform Dummy Spell: Target is in combat.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end

function me.TestParseSpecialCharacterSpellNamePerformTargetIsCombat()
  mod.testHelper.TestParse(
    eventName,
    "TestParseSpecialCharacterSpellNamePerformTargetIsCombat",
    "dummy_spell",
    "You fail to perform Dummy (Spell):-'s: Target is in combat.",
    mod.testHelper.eventTypeSpellFailedLocalPlayer
  )
end
