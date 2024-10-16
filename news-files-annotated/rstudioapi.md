# rstudioapi (development version)

# rstudioapi 0.17.0

!begin-bullets-1!

-   !begin-bullet!
    Added `getMode()`, which can be used to differentiate between
    Desktop and Server installations of RStudio. (#280)
    !end-bullet!

!end-bullets-1!

# rstudioapi 0.16.0

!begin-bullets-2!

-   !begin-bullet!
    `restartSession()` gains the `clean` argument, for RStudio 2024.04
    and newer.

    !end-bullet!
-   !begin-bullet!
    Added `setGhostText()` for setting ghost text in the current editor.

    !end-bullet!

!end-bullets-2!

# rstudioapi 0.15.0

!begin-bullets-3!

-   !begin-bullet!
    Added `getDelegatedAzureToken` for Posit Workbench users needing to
    expose OAuth2 tokens for Azure services that have already had
    permissions configured
    !end-bullet!

!end-bullets-3!

# rstudioapi 0.14

!begin-bullets-4!

-   !begin-bullet!
    `documentPath()` now marks the encoding of file paths as UTF-8.
    (#257)

    !end-bullet!
-   !begin-bullet!
    `getSourceEditorContext()` gains the `id` argument, to be used to
    request the editor context for a document with an already-known ID.
    (#251)

    !end-bullet!
-   !begin-bullet!
    Added `documentOpen()`, for opening a document in RStudio and
    optionally navigating the cursor to a particular point in the file.
    The method is synchronous and returns the document ID upon
    completion.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `rstudioapi::askForSecret()` would erroneously
    fall back to using `rstudioapi::askForPassword()` during Knit.

    !end-bullet!
-   !begin-bullet!
    Added `registerCommandCallback`, `registerCommandStreamCallback`,
    and `unregisterCommandCallback`, used to execute a callback after an
    IDE command is executed.

    !end-bullet!

!end-bullets-4!

# rstudioapi 0.13

!begin-bullets-5!

-   !begin-bullet!
    Fixed an issue where `rstudioapi::insertText()` would fail. (#208)
    !end-bullet!

!end-bullets-5!

# rstudioapi 0.12

!begin-bullets-6!

-   !begin-bullet!
    Fixed an issue where remote `rstudioapi` calls would erroneously use
    a previous response in some cases.

    !end-bullet!
-   !begin-bullet!
    Allow `navigateToFile` to accept an empty file. This file will
    default to the file currently in view in the active column.

    !end-bullet!
-   !begin-bullet!
    Added `registerChunkExecCallback` and `unregisterChunkExecCallback`,
    used to execute a callback after a chunk is ran.

    !end-bullet!

!end-bullets-6!

# rstudioapi 0.11

!begin-bullets-7!

-   !begin-bullet!
    `rstudioapi::launcherResourceLimit()` now properly delegates the
    type and memory arguments. (#164)

    !end-bullet!
-   !begin-bullet!
    `rstudioapi` gains the function `highlightUi()`, used to highlight
    UI elements in newer versions of RStudio.

    !end-bullet!
-   !begin-bullet!
    Paths returned from `selectFile()` are now properly marked with
    UTF-8 encoding.

    !end-bullet!
-   !begin-bullet!
    It is now possible for `rstudioapi` to communicate with a parent
    RStudio session, for R sessions launched as RStudio jobs. Use
    `rstudioapi::isAvailable(child_ok = TRUE)` to assert that it's okay
    to check that `rstudioapi` is available and is running within an
    RStudio job.

    !end-bullet!
-   !begin-bullet!
    Added `bugReport()`, a helper function for reporting RStudio bugs on
    the GitHub issue tracker with an issue template pre-populated with
    some helpful diagnostic information.

    !end-bullet!
-   !begin-bullet!
    Added `userIdentity` and `systemUsername`, used to retrieve
    information about the current user.

    !end-bullet!

!end-bullets-7!

# rstudioapi 0.10

!begin-bullets-8!

-   !begin-bullet!
    Added the parameters `echo` and `focus` to `sendToConsole()`.
    !end-bullet!

!end-bullets-8!

# rstudioapi 0.9

!begin-bullets-9!

-   !begin-bullet!
    Added functions for displaying jobs in RStudio's Jobs pane:
    `jobAdd()`, `jobRemove()`, etc.

    !end-bullet!
-   !begin-bullet!
    Added `translateLocalUrl()`, for translating localhost URLs to
    externally addressable ones on RStudio Server.

    !end-bullet!

!end-bullets-9!

# rstudioapi 0.8

!begin-bullets-10!

-   !begin-bullet!
    Added functions for installing + using build tools:
    `buildToolsCheck()`, `buildToolsInstall()`, `buildToolsExec()`

    !end-bullet!
-   !begin-bullet!
    Added functions for installing + using themes: `addTheme()`,
    `applyTheme()`, `convertTheme()`, `getThemes()`, `getThemeInfo()`.

    !end-bullet!
-   !begin-bullet!
    Added `previewSql()`, for previewing output from executing a SQL
    query.

    !end-bullet!
-   !begin-bullet!
    Added `askForSecret()`, for prompting the user to enter a password
    or otherwise privileged information.

    !end-bullet!
-   !begin-bullet!
    Fixed an issue where `getActiveProject()` failed for non-ASCII
    paths. (#86)

    !end-bullet!

!end-bullets-10!

# rstudioapi 0.7

!begin-bullets-11!

-   !begin-bullet!
    Added methods for prompting the user for file paths: `selectFile()`,
    `selectDirectory()`.

    !end-bullet!
-   !begin-bullet!
    `askForPassword()` gains a default prompt (#41)

    !end-bullet!
-   !begin-bullet!
    Add `createProjectTemplate()` function

    !end-bullet!
-   !begin-bullet!
    Add `setPersistentValue()` / `getPersistentValue()` functions

    !end-bullet!
-   !begin-bullet!
    Add methods for interacting with Terminal tab: `terminalActivate()`,
    `terminalClear()`, `terminalCreate()`, `terminalList()`,
    `terminalBuffer()`, `terminalContext()`, `terminalVisible()`,
    `terminalBusy()`, `terminalRunning()`, `terminalKill()`,
    `terminalSend()`, `terminalExecute()`, and `terminalExitCode()`.

    !end-bullet!

!end-bullets-11!

# rstudioapi 0.6

!begin-bullets-12!

-   !begin-bullet!
    Add sendToConsole function

    !end-bullet!
-   !begin-bullet!
    Add APIs for setting cursor position in document

    !end-bullet!

!end-bullets-12!

# rstudioapi 0.5

!begin-bullets-13!

-   !begin-bullet!
    Add askForPassword function

    !end-bullet!
-   !begin-bullet!
    Add getActiveProject function

    !end-bullet!

!end-bullets-13!

# rstudioapi 0.4

!begin-bullets-14!

-   !begin-bullet!
    Add API methods for interacting with a document open in RStudio:
    'insertText()', 'modifyRange()' and 'getActiveDocumentContext()'.
    !end-bullet!

!end-bullets-14!

# rstudioapi 0.3

!begin-bullets-15!

-   !begin-bullet!
    Add stub and documentation for sourceMarker function
    !end-bullet!

!end-bullets-15!

# rstudioapi 0.2

!begin-bullets-16!

-   !begin-bullet!
    Compatibility with calling conventions for RStudio v0.99

    !end-bullet!
-   !begin-bullet!
    Stubs and documentation for versionInfo, previewRd, and viewer
    functions

    !end-bullet!

!end-bullets-16!

# rstudioapi 0.1

!begin-bullets-17!

-   !begin-bullet!
    Initial release to CRAN
    !end-bullet!

!end-bullets-17!
