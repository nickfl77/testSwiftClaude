# testApp

iOS SwiftUI app using MVVM architecture, targeting iOS 17.0+.

## Project Structure

```
testApp/
├── testApp.xcodeproj/     # Xcode project
└── testApp/
    ├── testAppApp.swift   # @main entry point
    ├── ContentView.swift  # Root view
    ├── ViewModels/        # ObservableObject view models
    ├── Models/            # Plain Swift data models
    └── Assets.xcassets/   # Images, colors, app icon
```

## Build & Run

Open `testApp.xcodeproj` in Xcode and run on a simulator or device (iOS 17.0+).

## Key Patterns

- Each view has a corresponding ViewModel in `ViewModels/`
- Models are plain structs in `Models/`
- ViewModels are `@MainActor final class` conforming to `ObservableObject`
- Views own their ViewModel via `@StateObject`
- Data loading uses `async/await` called from `.task {}` view modifiers
- Bundle ID: `com.example.testApp` — update before App Store submission

## Branch Strategy

- `develop` — active development branch
