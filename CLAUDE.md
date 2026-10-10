# KMP_template_ios

SwiftUI-приложение. shared используется как `import shared` (`SystemInfo().getInfo()` в `ContentView.swift`).
Правки делай только внутри этого каталога.

## Как приходит shared
Готовый бинарник `Packages/KMPTemplate/shared.xcframework` подключён локальным SPM-пакетом (`Package.swift`, `.binaryTarget`). CocoaPods больше нет.
`Packages/KMPTemplate/.shared-rev` и сам XCFramework не трогай: их обновляет оркестратор через `propagate.sh`.
API shared смотри в `Packages/KMPTemplate/shared.xcframework/ios-arm64/shared.framework/Headers/shared.h`; нужного символа нет — это задача для shared-agent, впиши в `NOT_DONE`.

## Сборка (из ~/kmp-agents)
`xcodebuild -project KMP_template_ios/KMP_template_ios.xcodeproj -scheme KMP_template_ios -destination 'generic/platform=iOS Simulator' -derivedDataPath /tmp/kmp-ios-dd CODE_SIGNING_ALLOWED=NO build`
(Release: добавь `-configuration Release`.) Тестового таргета нет.

## Заметка
Строки Kotlin/Native лежат в бинарнике в UTF-16LE: обычный `strings` их не находит.

Canary: IOS-UGJ9ZC
