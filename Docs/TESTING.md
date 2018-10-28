# Testing

> LogParser contains basic tests for all supported events. The bulk of testing however should be done in the Addon that makes use of the LogParser Addon.

The tests inside the test folder are split into a test suite for each supported event and also separated by the locale. Additionally there is a TestReporter that is responsible for creating a report of the tests by writing readable output into the chat window or a sort of log file.

## Testreporter

Some notes to the TestReporter:

The TestReporter was written because there is no provided way by Blizzard to test WoW-Addons. The reporter is not highly advanced and lacks functionalities that can be found in other languages and the available testing frameworks. However there is no such framework for WoW.

To visualize the result of the tests the reporter logs directly into the chat message window. To be able to read the results it might be necessary to disable other inputs into this window and making sure the addon is not set to debugging mode - see `LP_Logger.lua` to set the loglevel. The reporter logs what test is going to run, whether the test was successful or not and the end of a test.

## How to Run Tests

By default the test files are not included into the project file. Make sure that all of the files inside `./Test` are included in `LogParser.toc`.

Tests can either be run separately or all together. `LP_TestAll.lua` is used to test through all tests and provides a global function to start the tests `__LP__TEST_ALL()`.

Running functions from the chat message window can be done with `/run`

`/run __LP__TEST_ALL()`

All testsuites for each event can be run separately.

```lua
/run __LP__TEST_[EVENTNAME]_\_[LOCALE]\__Test
```

## Testing different Locale

The Addon supports currently german and english locale. To run the tests either a german and english client are required or one can manipulate `GetLocale` function to run the tests.

The Addon checks on upstart what locale the client is and loads different functions and data based on the locale. To trick the Addon into thinking the client has a different locale than it actually has we can manipulate the GetLocale function.

See `Code\LP_Core.lua` for a reference

```lua
local _G = getfenv(0)

function _G.GetLocale()
  return "deDE"
end
```

By overriding the GetLocale function we can return whatever locale we want. It is important to do this very early before the actual Addon initializing otherwise the wrong functions and data might already have loaded. After that `/run __LP__TEST_ALL()` can be used to run the tests. The Addon will use only the chosen locale tests.

***Note:*** This only works for running the tests because all the combat messages that are parsed are hardcoded. As soon as a real event is received and it doesn't match it will not work.

## Logging Tests to File

Logging to a file from within WoW is very limited. For this to work savedvariables are used to store big blobs of text.

Configure the `LogParser.toc` file with the LogParserTestLog variable:


```
## SavedVariables: LogParserTestLog
```

Make sure that the variable itself is initialized (this is done in `LP_TestReporter.lua`)

```lua
LogParserTestLog = {}
```

Additionally the TestReporter has to be configured to log to a logFile

```lua
local writeLogFile = true
```

After running a test and logging out the report should be inside the Addon configuration file.

`[World of Warcraft installation-folder]/WTF/Account/[username]/SavedVariables/LogParser.lua`

***Note:*** The file will be big if all tests were ran make sure to search for the keyword `fail` to find tests that failed.

**Notes:**

The TestReport also allows to reset the content of this savedvariables with the function `ClearSavedTestReports`. Calling this function before starting the tests might be the best way to be able to read the report afterwards. However the TestReporter is able to store multiple different reports.

Because of the limitation of how WoW writes text to files it is necessary to at least logout with the current loggedin character. Make sure that you do a clean logout and not forcing to close the game by alt + f4 or something similar otherwise the result cannot be written to the file and will be lost.

## Debugging

If a test fails and further debugging is needed it might be necessary to set the loglevel for the logger inside the different testsuites. As of now the full testsuite tests set the loglevel to 1 (error) to prevent cluttering of the output. However this can be changed for the purpose of debugging the tests but has to be done manually in each testsuite.
