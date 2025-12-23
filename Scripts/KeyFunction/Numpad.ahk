; Numpad Functions Library
; This script provides functions for numpad key handling
; Called by Main.ahk - no direct keyboard subscription

#include "..\AuxFunction\codetokey.ahk"

;############### NUMPAD KEY HANDLER ########################
; Main function called by Main.ahk for numpad key events
; Uses global config variables loaded by Main.ahk's LoadAppConfig() function
HandleNumpadKey(code, state) {
    keyName := CodeToKey(code)

    switch keyName {
        case "NumPad0":
            return Numpad_Handle0(state)
        case "NumPad1":
            return Numpad_Handle1(state)
        case "NumPad2":
            return Numpad_Handle2(state)
        case "NumPad3":
            return Numpad_Handle3(state)
        case "NumPad4":
            return Numpad_Handle4(state)
        case "NumPad5":
            return Numpad_Handle5(state)
        case "NumPad6":
            return Numpad_Handle6(state)
        case "NumPad7":
            return Numpad_Handle7(state)
        case "NumPad8":
            return Numpad_Handle8(state)
        case "NumPad9":
            return Numpad_Handle9(state)
        case "NumPadAdd":
            return Numpad_HandlePlus(state)
        case "NumPadSub":
            return Numpad_HandleMinus(state)
        case "NumPadMult":
            return Numpad_HandleAsterisk(state)
        case "NumPadDiv":
            return Numpad_HandleSlash(state)
        case "NumPadEnter":
            return Numpad_HandleEnter(state)
        case "NumPadDel":
            return Numpad_HandleDelete(state)
        case "NumLock":
            return Numpad_HandleNumLock(state)
        default:
            return false
    }
}

Numpad_Handle0(state) {
    if (state != 1)
        return false

    global appNumPad0Location
    
    ; Check if Media Share folder is already open in Explorer
    ; Look for any Explorer window with the Media Share folder path in the address bar
    found := false
    for window in WinGetList("ahk_class CabinetWClass")
    ; Check if Media Share folder is already open in Explorer
    ; Look for any Explorer window with the Media Share folder path in the address bar
    found := false
    for window in WinGetList("ahk_class CabinetWClass")
    {
        try {
            ; Get the window's current folder path
            xl := ComObject("Shell.Application")
            for item in xl.Windows {
                if (item.HWND == window) {
                    currentPath := item.Document.Folder.Self.Path
                    if (currentPath == appNumPad0Location) {
                        WinActivate("ahk_id " . window)
                        found := true
                        break
                    }
                }
            }
        }
        if (found)
            break
    }
    
    if (!found) {
        ; If not open, launch Explorer with the Media Share folder
        Run("explorer.exe `"" . appNumPad0Location . "`"")
        ; Wait for the window to appear (max 10 seconds)
        WinWait("ahk_class CabinetWClass", , 10)
        ; Activate it once it's open
        WinActivate("ahk_class CabinetWClass")
    }
    
    return true
}

Numpad_Handle1(state) {
    if (state != 1)
        return false

    global appNumPad1Location, appNumPad1Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad1Identifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPad1Identifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPad1Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad1Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad1Identifier)
    }
    
    return true
}

Numpad_Handle2(state) {
    if (state != 1)
        return false

    global appNumPad2Location, appNumPad2Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad2Identifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPad2Identifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPad2Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad2Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad2Identifier)
    }
    
    return true
}

Numpad_Handle3(state) {
    if (state != 1)
        return false

    global appNumPad3Location, appNumPad3Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad3Identifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPad3Identifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPad3Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad3Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad3Identifier)
    }
    
    return true
}

Numpad_Handle4(state) {
    if (state != 1)
        return false

    global appNumPad4Location, appNumPad4Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad4Identifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPad4Identifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPad4Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad4Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad4Identifier)
    }
    
    return true
}

Numpad_Handle5(state) {
    if (state != 1)
        return false

    global appNumPad5Location, appNumPad5Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad5Identifier)
    {
        ; If it exists, activate it (bring to front)
        try {
            WinActivate(appNumPad5Identifier)
            ; Brief delay to allow window activation
            Sleep(100)
            ; Return true to signal main script to reinitialize keyboard
            return true
        } catch Error as e {
            ; If activation fails, continue without breaking the script
        }
    }
    else
    {
        ; If not running, launch it and wait for it to open
        try {
            Run(appNumPad5Location)
            ; Wait for the window to appear (max 20 seconds - Steam takes longer to load)
            if WinWait(appNumPad5Identifier, , 20) {
                ; Activate it once it's open
                WinActivate(appNumPad5Identifier)
                Sleep(100)
                ; Return true to signal main script to reinitialize keyboard
                return true
            }
        } catch Error as e {
            ; If launch fails, continue without breaking the script
        }
    }
    
    return false
}

Numpad_Handle6(state) {
    if (state != 1)
        return false

    global appNumPad6Location, appNumPad6Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad6Identifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPad6Identifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPad6Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad6Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad6Identifier)
    }
    
    return true
}

Numpad_Handle7(state) {
    if (state != 1)
        return false

    global appNumPad7Location, appNumPad7Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad7Identifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPad7Identifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPad7Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad7Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad7Identifier)
    }
    
    return true
}

Numpad_Handle8(state) {
    if (state != 1)
        return false

    global appNumPad8Location, appNumPad8Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad8Identifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPad8Identifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPad8Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad8Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad8Identifier)
    }
    
    return true
}

Numpad_Handle9(state) {
    if (state != 1)
        return false

    global appNumPad9Location, appNumPad9Identifier
    
    ; Check if app is already running
    if WinExist(appNumPad9Identifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPad9Identifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPad9Location)
        ; Wait for the window to appear (max 15 seconds - DaVinci takes longer to load)
        WinWait(appNumPad9Identifier, , 15)
        ; Activate it once it's open
        WinActivate(appNumPad9Identifier)
    }
    
    return true
}

Numpad_HandlePlus(state) {
    if (state != 1)
        return false

    ; Take a screenshot using Print Screen
    Send("{PrintScreen}")
    return true
}

Numpad_HandleMinus(state) {
    if (state != 1)
        return false

    activeWindow := WinGetID("A")
    WinMinimize("ahk_id " . activeWindow)
    return true
}

Numpad_HandleAsterisk(state) {
    if (state != 1)
        return false

    global appNumPadAsteriskLocation, appNumPadAsteriskIdentifier
    
    if WinExist(appNumPadAsteriskIdentifier) || ProcessExist("MouseWithoutBorders.exe") || ProcessExist("MouseWithoutBordersHelper.exe")
    {
        ; Default global exit hotkey: Ctrl+Alt+Shift+Q
        Send("^!+q")
        ; Show confirmation tooltip
        ToolTip("Mouse without Borders closed")
        SetTimer(() => ToolTip(), -2000) ; Remove tooltip after 2 seconds
    }
    else
    {
        if (appNumPadAsteriskLocation != "")
            Run(appNumPadAsteriskLocation)
    }
    
    return true
}

Numpad_HandleEnter(state) {
    if (state != 1)
        return false

    Click("XButton1")
    return true
}

Numpad_HandleDelete(state) {
    if (state != 1)
        return false

    global appNumPadDelLocation, appNumPadDelIdentifier
    
    if WinExist(appNumPadDelIdentifier)
    {
        ; If it exists, activate it (bring to front)
        WinActivate(appNumPadDelIdentifier)
    }
    else
    {
        ; If not running, launch it and wait for it to open
        Run(appNumPadDelLocation)
        ; Wait for the window to appear (max 15 seconds)
        WinWait(appNumPadDelIdentifier, , 15)
        ; Activate it once it's open
        WinActivate(appNumPadDelIdentifier)
    }
    
    return true
}

Numpad_HandleNumLock(state) {
    if (state != 1)
        return false

    global appNumPad3Location, appNumPad3Identifier
    
    ; Check if app (Zen) is already running
    if WinExist(appNumPad3Identifier)
    {
        ; If Zen exists, activate it and open YouTube
        WinActivate(appNumPad3Identifier)
        Sleep(500) ; Wait for window to be active
        Send("^t") ; Open new tab (Ctrl+T)
        Sleep(200)
        Send("youtube.com{Enter}") ; Navigate to YouTube
    }
    else
    {
        ; If not running, launch Zen and then open YouTube
        Run(appNumPad3Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad3Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad3Identifier)
        Sleep(2000) ; Wait for Zen to fully load
        Send("^l") ; Focus address bar (Ctrl+L)
        Sleep(200)
        Send("youtube.com{Enter}") ; Navigate to YouTube
    }
    
    return true
}

Numpad_HandleSlash(state) {
    if (state != 1)
        return false

    global appNumPad3Location, appNumPad3Identifier
    
    ; Check if app (Zen) is already running
    if WinExist(appNumPad3Identifier)
    ; Check if app (Zen) is already running
    if WinExist(appNumPad3Identifier)
    {
        ; If Zen exists, activate it and open facebook
        WinActivate(appNumPad3Identifier)
        Sleep(500) ; Wait for window to be active
        Send("^t") ; Open new tab (Ctrl+T)
        Sleep(200)
        Send("facebook.com{Enter}") ; Navigate to facebook
    }
    else
    {
        ; If not running, launch Zen and then open facebook
        Run(appNumPad3Location)
        ; Wait for the window to appear (max 10 seconds)
        WinWait(appNumPad3Identifier, , 10)
        ; Activate it once it's open
        WinActivate(appNumPad3Identifier)
        Sleep(2000) ; Wait for Zen to fully load
        Send("^l") ; Focus address bar (Ctrl+L)
        Sleep(200)
        Send("facebook.com{Enter}") ; Navigate to facebook
    }
    
    return true
}

