

SplitPath(A_ScriptDir,, &scriptDir)
SplitPath(scriptDir, &appName)

packageName := ConfirmValue(
    "volantis/project-starter",
    "Enter your project's package name. It requires a namespace and a slash, such as volantis/project-starter.",
    "Package Name"
)

appName := ConfirmValue(
    appName,
    "Enter your project's name. It can include spaces, and most special characters should be fine.",
    "Project Name"
)

appKey := ConfirmValue(
    StrReplace(appName, " ", ""),
    "Enter your project key. It should be a single word, and special characters should be avoided.",
    "Project Key"
)

description := ConfirmValue(
    "My really cool project.",
    "Enter your project description. It should be relatively short, usually a sentence or two.",
    "Project Description"
)

authorName := ConfirmValue(
    "My Organization",
    "Enter your name or your company's name, as a proper noun.",
    "Author Name"
)

stringMap := Map(
    "volantis/project-starter", packageName,
    "MyApp", appKey,
    "My App", appName,
    "The start of a really cool project!", description,
    "ben@volantisdev.com", ""
    "My Organization", authorName,
    "Ben McClure", authorName,
    "CurrentYear", A_YYYY,
)

files := [
    ".gitignore",
    "MyApp.ahk",
    "MyApp.services.json",
    "volantis.json"
    "lib\MyAppApp.ahk",
    "lib\MyAppConfig.ahk",
    "lib\MyAppState.ahk"
]

for , sourceFile in files {
    destFile := ReplaceStrings(sourceFile)

    if (sourceFile != destFile) {
        FileMove(scriptDir . "\" . sourceFile, scriptDir . "\" . destFile)
    }

    contents := FileRead(scriptDir . "\" . destFile)
    contents := ReplaceStrings(contents)

    FileDelete(scriptDir . "\" . destFile)
    FileAppend(contents, scriptDir . "\" . destFile)
}

MsgBox("Your new project is ready! Feel free to delete this script and its corresponding config in volantis.json unless you're creating your own project template.")

ConfirmValue(value, title, description) {
    result := InputBox(description, title,, value)

    if (result.Result != "OK" || result.Value = "") {
        ExitApp
    }

    return result.Value
}

ReplaceStrings(text) {
    for sourceString, destString in stringMap {
        text := StrReplace(text, sourceString, destString)
    }

    return text
}
