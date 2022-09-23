# rstudioapi 0.15 (UNRELEASED)

# rstudioapi 0.14

!begin-bullets-1!

-   `documentPath()` now marks the encoding of file paths as UTF-8.
    (#257)

-   `getSourceEditorContext()` gains the `id` argument, to be used to
    request the editor context for a document with an already-known ID.
    (#251)

-   Added `documentOpen()`, for opening a document in RStudio and
    optionally navigating the cursor to a particular point in the file.
    The method is synchronous and returns the document ID upon
    completion.

-   Fixed an issue where `rstudioapi::askForSecret()` would erroneously
    fall back to using `rstudioapi::askForPassword()` during Knit.

-   Added `registerCommandCallback`, `registerCommandStreamCallback`,
    and `unregisterCommandCallback`, used to execute a callback after an
    IDE command is executed.

!end-bullets-1!

# rstudioapi 0.13

!begin-bullets-2!

-   Fixed an issue where `rstudioapi::insertText()` would fail. (#208)

!end-bullets-2!

# rstudioapi 0.12

!begin-bullets-3!

-   Fixed an issue where remote `rstudioapi` calls would erroneously use
    a previous response in some cases.

-   Allow `navigateToFile` to accept an empty file. This file will
    default to the file currently in view in the active column.

-   Added `registerChunkExecCallback` and `unregisterChunkExecCallback`,
    used to execute a callback after a chunk is ran.

!end-bullets-3!

# rstudioapi 0.11

!begin-bullets-4!

-   `rstudioapi::launcherResourceLimit()` now properly delegates the
    type and memory arguments. (#164)

-   `rstudioapi` gains the function `highlightUi()`, used to highlight
    UI elements in newer versions of RStudio.

-   Paths returned from `selectFile()` are now properly marked with
    UTF-8 encoding.

-   It is now possible for `rstudioapi` to communicate with a parent
    RStudio session, for R sessions launched as RStudio jobs. Use
    `rstudioapi::isAvailable(child_ok = TRUE)` to assert that it's okay
    to check that `rstudioapi` is available and is running within an
    RStudio job.

-   Added `bugReport()`, a helper function for reporting RStudio bugs on
    the GitHub issue tracker with an issue template pre-populated with
    some helpful diagnostic information.

-   Added `userIdentity` and `systemUsername`, used to retrieve
    information about the current user.

!end-bullets-4!

# rstudioapi 0.10

!begin-bullets-5!

-   Added the parameters `echo` and `focus` to `sendToConsole()`.

!end-bullets-5!

# rstudioapi 0.9

!begin-bullets-6!

-   Added functions for displaying jobs in RStudio's Jobs pane:
    `jobAdd()`, `jobRemove()`, etc.

-   Added `translateLocalUrl()`, for translating localhost URLs to
    externally addressable ones on RStudio Server.

!end-bullets-6!

# rstudioapi 0.8

!begin-bullets-7!

-   Added functions for installing + using build tools:
    `buildToolsCheck()`, `buildToolsInstall()`, `buildToolsExec()`

-   Added functions for installing + using themes: `addTheme()`,
    `applyTheme()`, `convertTheme()`, `getThemes()`, `getThemeInfo()`.

-   Added `previewSql()`, for previewing output from executing a SQL
    query.

-   Added `askForSecret()`, for prompting the user to enter a password
    or otherwise privileged information.

-   Fixed an issue where `getActiveProject()` failed for non-ASCII
    paths. (#86)

!end-bullets-7!

# rstudioapi 0.7

!begin-bullets-8!

-   Added methods for prompting the user for file paths: `selectFile()`,
    `selectDirectory()`.

-   `askForPassword()` gains a default prompt (#41)

-   Add `createProjectTemplate()` function

-   Add `setPersistentValue()` / `getPersistentValue()` functions

-   Add methods for interacting with Terminal tab: `terminalActivate()`,
    `terminalClear()`, `terminalCreate()`, `terminalList()`,
    `terminalBuffer()`, `terminalContext()`, `terminalVisible()`,
    `terminalBusy()`, `terminalRunning()`, `terminalKill()`,
    `terminalSend()`, `terminalExecute()`, and `terminalExitCode()`.

!end-bullets-8!

# rstudioapi 0.6

!begin-bullets-9!

-   Add sendToConsole function

-   Add APIs for setting cursor position in document

!end-bullets-9!

# rstudioapi 0.5

!begin-bullets-10!

-   Add askForPassword function

-   Add getActiveProject function

!end-bullets-10!

# rstudioapi 0.4

!begin-bullets-11!

-   Add API methods for interacting with a document open in RStudio:
    'insertText()', 'modifyRange()' and 'getActiveDocumentContext()'.

!end-bullets-11!

# rstudioapi 0.3

!begin-bullets-12!

-   Add stub and documentation for sourceMarker function

!end-bullets-12!

# rstudioapi 0.2

!begin-bullets-13!

-   Compatibility with calling conventions for RStudio v0.99

-   Stubs and documentation for versionInfo, previewRd, and viewer
    functions

!end-bullets-13!

# rstudioapi 0.1

!begin-bullets-14!

-   Initial release to CRAN

!end-bullets-14!
