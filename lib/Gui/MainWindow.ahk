class MainWindow extends MainWindowBase {
    listViewColumns := ["MY STUFF"]

    __New(container, themeObj, config) {
        super.__New(container, container.Get("entity_manager.library"), themeObj, config)
    }

    GetDefaultConfig(container, config) {
        defaults := super.GetDefaultConfig(container, config)
        defaults["showDetailsPane"] := true
        defaults["addButtonText"] := "Add a Thing"
        defaults["actionButtons"] := [Map("key", "ScanButton", "label", "Scan Things")]
        return defaults
    }

    GetListViewContextMenuItems() {
        menuItems := super.GetListViewContextMenuItems()
        ; menuItems.Push(Map(
        ;     "label", "Open",
        ;     "name", "OpenLibraryPath"
        ; ))
        return menuItems
    }

    ProcessListViewContextMenuResult(result, entityId, lvItem) {
        if (result == "OpenLibraryPath") {

        } else {
            super.ProcessListViewContextMenuResult(result, entityId, lvItem)
        }
    }

    GetDetailsButtons() {
        buttons := super.GetDetailsButtons()

        buttons.InsertAt(1, Map(
            "label", "Open",
            "key", "DetailsOpenButton",
            "action", "OnDetailsOpenButton"
        ))

        return buttons
    }

    GetDetailsFields(entityObj := "") {
        fields := super.GetDetailsFields(entityObj)

        return fields
    }

    OnDetailsOpenButton(btn, info) {
        selected := this.listView.GetSelected("", true)

        if (selected.Length > 0) {
            this.OpenLibrary(selected[1])
        }
    }

    OnAddButton(btn, info) {

    }

    OnSize(guiObj, minMax, width, height) {
        super.OnSize(guiObj, minMax, width, height)

        if (minMax == -1) {
            return
        }

        this.AutoXYWH("xy", ["ScanButton"])
    }
}
