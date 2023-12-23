class SettingsWindow extends SettingsWindowBase {
    listViewModes := ["Report", "Tile", "List"]
    doubleClickActions := ["Edit", "Open"]

    GetDefaultConfig(container, config) {
        defaultConfig := super.GetDefaultConfig(container, config)
        ; Override default window configuration here.
        return defaultConfig
    }

    GeneralSettings() {
        ; Example of a more complex settings field
        ; this.AddHeading("Double-Click Action")
        ; chosen := this.GetItemIndex(this.doubleClickActions, this.app.Config["settings_key"])
        ; ctl := this.guiObj.AddDDL("vsettings_key xs y+m Choose" . chosen . " w250 c" . this.themeObj.GetColor("editText"), this.doubleClickActions)
        ; ctl.OnEvent("Change", "OnDoubleClickActionChange")
        ; ctl.ToolTip := "Helpful tooltip text for the drop-down list"

        ; Example of a file selector
        ; this.AddConfigLocationBlock("File Field", "settings_key", "Reload")

        ; Example of a list of checkboxes
        ; this.AddHeading("Heading Text")
        ; this.AddConfigCheckBox("Checkbox description", "settings_key")
    }

    ; Handle the various menu items for the file named FileField above.
    ; OnFileFieldMenuClick(btn) {
    ;     if (btn == "ChangeFileField") {
    ;         this.app.Config.ChangeFileField()
    ;         this.SetText("FileField", this.app.Config["settings_key"], "Bold")
    ;     } else if (btn == "OpenFileField") {
    ;         this.app.Config.OpenFileField()
    ;     } else if (btn == "ReloadFileField") {

    ;     }
    ; }

    ; OnDoubleClickActionChange(ctl, info) {
        ; this.guiObj.Submit(false)
        ; this.app.Config["settings_key"] := this.doubleClickActions[ctl.Value]
    ; }

    ReloadModifiedComponents() {
        ; If settings affects the main window, reload it here
        ; if (this.app["manager.gui"].Has("MainWindow")) {
        ;     this.app["manager.gui"]["MainWindow"].UpdateListView()
        ; }
    }
}
