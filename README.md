# KMP Template — iOS App

[![Swift](https://img.shields.io/badge/Swift-SwiftUI-F05138.svg?logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![Kotlin Multiplatform](https://img.shields.io/badge/Kotlin-Multiplatform-7F52FF.svg)](https://kotlinlang.org/docs/multiplatform.html)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A native SwiftUI application that consumes a Kotlin Multiplatform library through a local Swift package and a prebuilt XCFramework.

This repository is the iOS example from [**KMP: Integrating into Native Projects**](https://medium.com/@vptarasov/kmp-integrating-into-native-projects-f0f35091706d). It remains a regular Xcode project while using shared Kotlin business logic through a native Apple framework.

## What the app demonstrates

- A native SwiftUI lifecycle and interface.
- Importing the KMP framework as the Swift module `shared`.
- Packaging `shared.xcframework` inside a local Swift Package Manager package.
- Calling Kotlin classes and methods directly from Swift.
- Support for physical iOS devices and Apple Silicon / Intel simulators.

The screen creates `SystemInfo` from the shared module and displays:

- the shared greeting, platform, and date;
- the iPhone or simulator model identifier;
- the iOS or iPadOS version.

## Shared integration

The local package is located at:

```text
Packages/KMPTemplate/
├── Package.swift
└── shared.xcframework
```

`Package.swift` exposes the binary framework as the `shared` library for iOS 15 and newer. The application imports it normally:

```swift
import shared

let systemInfo = SystemInfo()
```

The XCFramework is generated from [KMP_template_shared](https://github.com/TarasovVP/KMP_template_shared):

```shell
./gradlew :shared:assembleSharedReleaseXCFramework
```

The generated framework can then replace `Packages/KMPTemplate/shared.xcframework` in this repository.

## Companion repositories

These independent repositories form the complete example from the article:

| Repository | Role |
|---|---|
| [KMP_template_shared](https://github.com/TarasovVP/KMP_template_shared) | Shared KMP library and XCFramework source |
| [KMP_template_android](https://github.com/TarasovVP/KMP_template_android) | Android consumer with Jetpack Compose |
| **KMP_template_ios** | iOS consumer with SwiftUI |
| [KMP_template_desktop](https://github.com/TarasovVP/KMP_template_desktop) | JVM desktop consumer with JavaFX |
| [KMP_template_web](https://github.com/TarasovVP/KMP_template_web) | JavaScript consumer with Vite |

## Requirements

- macOS
- Xcode with Swift 5.9+ support
- iOS 15+ deployment target
- The included `shared.xcframework`, or the tools required to regenerate it from the shared repository

## Build and run

Clone and open the Xcode project:

```shell
git clone https://github.com/TarasovVP/KMP_template_ios.git
cd KMP_template_ios
open KMP_template_ios.xcodeproj
```

Choose the `KMP_template_ios` scheme and run it on an iOS simulator or device.

For a command-line simulator build:

```shell
xcodebuild \
  -project KMP_template_ios.xcodeproj \
  -scheme KMP_template_ios \
  -destination 'generic/platform=iOS Simulator' \
  CODE_SIGNING_ALLOWED=NO \
  build
```

## Project structure

```text
KMP_template_ios/
├── KMP_template_iosApp.swift     # SwiftUI application entry point
├── ContentView.swift             # UI and calls to the shared API
└── Assets.xcassets
Packages/KMPTemplate/
├── Package.swift                 # Local SPM binary target
└── shared.xcframework            # Prebuilt KMP framework
```

## Later automation

[KMP_template_agents](https://github.com/TarasovVP/KMP_template_agents) was created later as a separate orchestration harness built around this already-existing example set. It automates rebuilding and copying the XCFramework together with changes to the other consumers; it is not the source or parent project of this iOS application.

See [AI Agents for a KMP Developer](https://levelup.gitconnected.com/ai-agents-for-a-kmp-developer-82af4e8851a9) for that later automation layer.

## License

Licensed under the [MIT License](LICENSE).
