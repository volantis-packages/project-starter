class MyAppApp extends GuiApp {
    OpenApp(config) {
        ; Early initialization steps here.

        ; Open main window or run main command.
        super.OpenApp(config)

        ; App has started. Late initialization steps here.
    }

    AddMainMenuEarlyItems(menuItems, showOpenItem := false) {
        menuItems := super.AddMainMenuEarlyItems(menuItems, showOpenItem)

        ; menuItems.Push(Map(
        ;     "label", "&My Label",
        ;     "name", "ParentKey",
        ;     "childItems", [
        ;         Map(
        ;             "label", "&Child Label",
        ;             "name", "MyChildKey"
        ;         )
        ;     ]
        ; ))

        return menuItems
    }

    HandleMainMenuClick(result) {
        if (result == "MyChildKey") {

        } else {
            super.HandleMainMenuClick(result)
        }

        return result
    }
}
