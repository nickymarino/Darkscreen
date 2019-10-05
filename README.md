# Darkscreen

Darkscreen allows you to use other iPad apps in Split View without any distractions, no hassle. 

Darkscreen provides multiple themes, including:

- Dark
- Light
- 80s
- 90s
- Outrun

## Why Darkscreen?

I really love using [Apollo for Reddit](https://apps.apple.com/us/app/apollo-for-reddit/id979274575) by Christian Selig, but he hasn't gotten a chance to create a true iPad experience for his Reddit client yet. I use Darkscreen next to Apollo in Split View so that Apollo can be in an iPhone-sized container while keeping the rest of the screen black:

```
+------------+--------+
|            |        |
|            |        |
| Darkscreen | Apollo |
|            |        |
|            |        |
+------------+--------+
```

## Why Open Source?

I found it an interesting challenge to modify the appearance of all of all views in the app immediately after a user selects a theme in a `UITableView`, and I hope this brief example can help other developers implement their own theme system. 

Even though iOS 13 introduces [system-wide Dark Mode](https://developer.apple.com/documentation/xcode/supporting_dark_mode_in_your_interface), this example app can be helpful to support any custom themes that go beyond the default dark and light styles.

## How to Update the Theme for a View

I've implemented the theme system using a [Settings Bundle](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/UserDefaults/Preferences/Preferences.html), so the `BaseViewController` can subscribe to settings (theme) changes:

```swift
func registerForSettingsChange() {
    NotificationCenter.default.addObserver(self,
                                            selector: #selector(BaseViewController.settingsChanged),
                                            name: UserDefaults.didChangeNotification,
                                            object: nil)
}
```

A `Theme` corresponds to UI styles and colors:

```swift
class Theme {
    
    // ...

    init(_ name: String, statusBar: UIStatusBarStyle, background: UIColor, primary: UIColor, secondary: UIColor) {
        self.name = name
        statusBarStyle = statusBar
        backgroundColor = background
        primaryColor = primary
        secondaryColor = secondary
    }
}
```

When a setting changes, `BaseViewController` updates its UI elements:

```swift
@objc func settingsChanged() {
    updateTheme()
}

func updateTheme() {
    // Status bar
    setNeedsStatusBarAppearanceUpdate()

    // Background color
    self.view.backgroundColor = Settings.shared.theme.backgroundColor

    // Navigation bar
    self.navigationController?.navigationBar.updateTheme()
}
```

And `UINavigationBar` is extended to support theme switching:

```swift
public extension UINavigationBar {
    func updateTheme() {
        // Background color
        barTintColor = Settings.shared.theme.backgroundColor

        // Bar item color
        tintColor = Settings.shared.theme.secondaryColor

        // Title text color
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: Settings.shared.theme.secondaryColor]

        // Status bar style
        barStyle = Settings.shared.theme.navbarStyle

        // Tell the system to update it
        setNeedsDisplay()
    }
}
```
