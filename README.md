# MountainViewUI
<img src="/images/MountainViewUI_Banner.png" height="200" />

[![Swift Version](https://img.shields.io/badge/Swift-5.8-orange.svg)](https://swift.org)
[![License](https://img.shields.io/github/license/misaki1301/MountainViewUI)](https://github.com/misaki1301/MountainViewUI/blob/main/LICENSE)
![build and test workflow](https://github.com/misaki1301/MountainViewUI/actions/workflows/swift.yml/badge.svg)
![issues](https://img.shields.io/github/issues/misaki1301/MountainViewUI)


MountainViewUI is a Material Design implementation for SwiftUI that brings the modern and beautiful UI elements from Google's Material Design to your iOS apps. Please note that this package is still a work in progress, and some features might be missing or subject to changes.

## Features

- **Buttons**: Beautifully designed Material buttons for various use cases.
- **Card View**: Crafted View Cards for every use case in mind.
- Other components: [To be added in future releases.]

## Installation

You can integrate MountainViewUI into your project using Swift Package Manager. Add the following as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/misaki1301/MountainViewUI.git", from: "0.2.0")
]
```

### Usage

Import the library like here:
```swift
import SwiftUI
import MountainViewUI
```
### Cards
MountainViewUI supports now CardView with closures:

### Buttons
MountainViewUI currently only support 3 types of buttons:
1. Contained
2. Filled
3. Outlined
```swift
VStack {
    MountainViewButton(text: "Contained", action: {}, buttonStyle: MountainButtonStyle())
    MountainViewButton(text: "Filled", action: {}, buttonStyle: MountainFillButtonStyle())
    MountainViewButton(text: "Outlined", action: {}, buttonStyle: MountainOutlinedButtonStyle())
}
```
other components will be added in future releases stay tune!

### Documentation
Currently I'm working in the documentation and the correct implementation of Material using its guidelines

### License
MountainViewUI is released under the MIT License. See the LICENSE file for details.


