class MyAppConfig extends AppConfig {
    app := ""

    __New(configStorage, container, parentKey := "", autoLoad := true) {
        this.app := container.GetApp()
        super.__New(configStorage, container, parentKey, autoLoad)
    }

    ; Example callbacks for settings changes
    ; OpenDestinationDir() {
    ;     Run(this["destination_dir"])
    ; }

    ; ChangeDestinationDir(existingDir := "") {
    ;     if (existingDir == "") {
    ;         existingDir := this["destination_dir"]
    ;     }

    ;     destinationDir := this.SelectDestinationDir(existingDir)

    ;     if (destinationDir != "") {
    ;         this["destination_dir"] := destinationDir
    ;     }

    ;     return destinationDir
    ; }

    ; SelectDestinationDir(existingDir) {
    ;     if (existingDir != "") {
    ;         existingDir := "*" . existingDir
    ;     }

    ;     return DirSelect(existingDir, 3, "Create or select the folder to write library data to.")
    ; }
}
