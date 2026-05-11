# Architecture

testApp follows the MVVM (Model-View-ViewModel) pattern using SwiftUI and Swift Concurrency.

## Layers

### Models (`testApp/Models/`)
Plain Swift structs. Conform to `Identifiable` for use in `List`. No business logic or side effects.

### ViewModels (`testApp/ViewModels/`)
`@MainActor final class` types conforming to `ObservableObject`. Own all business logic, data loading, and mutable state via `@Published` properties. Views never mutate data directly.

### Views (`testApp/`)
SwiftUI `View` structs. Stateless beyond simple local UI state (`@State`). Observe their ViewModel via `@StateObject` (when the view owns it) or `@ObservedObject` (when injected).

## Data Flow

```
User Action → ViewModel method → mutates @Published → SwiftUI re-renders View
```

## Async / Concurrency

- ViewModels expose `async` methods for data loading
- Views trigger these via `.task {}` modifiers (automatically cancelled on disappear)
- All ViewModel mutations happen on the `@MainActor`

## Navigation

`NavigationStack` is the root navigator. Destinations are pushed via `NavigationLink` or programmatically via ViewModel-owned path state.

## Dependency Guidelines

- Models have no dependencies
- ViewModels depend on Models and services only
- Views depend on ViewModels only — never on services or raw data directly
