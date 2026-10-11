# KMP_template_ios

A SwiftUI app that uses the Kotlin Multiplatform module `shared` (`import shared`).

## Where shared comes from
A prebuilt `Packages/KMPTemplate/shared.xcframework`, attached as a local SPM package (`Package.swift`, `.binaryTarget`). shared itself also supports CocoaPods (podspec) for external consumers, but this app connects it via SPM.
The framework is built in `KMP_template_shared` and copied here by `scripts/propagate.sh` of the `kmp-agents` harness;
`Packages/KMPTemplate/.shared-rev` records which shared sources it was built from.

## Build
```
xcodebuild -project KMP_template_ios.xcodeproj -scheme KMP_template_ios \
  -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```
Or open `KMP_template_ios.xcodeproj` in Xcode. There is no test target.
