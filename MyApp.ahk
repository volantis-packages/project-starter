;@Ahk2Exe-SetName "My App"
;@Ahk2Exe-SetVersion "{{VERSION}}"
;@Ahk2Exe-SetCompanyName "My Organization"
;@Ahk2Exe-SetCopyright "Copyright CurrentYear My Organization"
;@Ahk2Exe-SetDescription "The start of a really cool project!"
#Warn
#Include volantis\includes\auto.ahk

appVersion := "{{VERSION}}"

MyAppApp(Map(
    "appName", "My App",
    "version", appVersion,
    "trayIcon", "resources\graphics\icon_32.ico",
    "console", true
))
