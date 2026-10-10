# KMP_template_ios

A SwiftUI app. shared is used as `import shared` (`SystemInfo().getInfo()` in `ContentView.swift`).
Edit only inside this directory.

## How shared arrives
The prebuilt binary `Packages/KMPTemplate/shared.xcframework` is attached as a local SPM package (`Package.swift`, `.binaryTarget`). CocoaPods is gone.
Do not touch `Packages/KMPTemplate/.shared-rev` or the XCFramework itself: the orchestrator updates them through `propagate.sh`.
Look up the shared API in `Packages/KMPTemplate/shared.xcframework/ios-arm64/shared.framework/Headers/shared.h`; if the symbol you need is missing, that is a task for shared-agent - put it in `NOT_DONE`.

## Build (from ~/kmp-agents)
`xcodebuild -project KMP_template_ios/KMP_template_ios.xcodeproj -scheme KMP_template_ios -destination 'generic/platform=iOS Simulator' -derivedDataPath /tmp/kmp-ios-dd CODE_SIGNING_ALLOWED=NO build`
(Release: add `-configuration Release`.) There is no test target.

## Note
Kotlin/Native strings are stored in the binary as UTF-16LE: plain `strings` does not find them.

Canary: IOS-UGJ9ZC
