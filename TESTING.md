# Testing

## Test Targets

Add test targets in Xcode via **File → New → Target**:

- `testAppTests` — unit tests for ViewModels and Models
- `testAppUITests` — end-to-end UI tests via `XCUIApplication`

## Unit Tests

Test ViewModels in isolation using `@MainActor`:

```swift
import XCTest
@testable import testApp

@MainActor
final class ContentViewModelTests: XCTestCase {

    func testLoadItemsPopulatesList() async throws {
        let vm = ContentViewModel()
        XCTAssertTrue(vm.items.isEmpty)
        await vm.loadItems()
        XCTAssertFalse(vm.items.isEmpty)
    }

    func testAddItemIncrementsCount() async throws {
        let vm = ContentViewModel()
        await vm.loadItems()
        let initial = vm.items.count
        vm.addItem()
        XCTAssertEqual(vm.items.count, initial + 1)
    }
}
```

## UI Tests

```swift
import XCTest

final class testAppUITests: XCTestCase {

    func testRootListIsVisible() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.navigationBars["testApp"].exists)
    }
}
```

## Running Tests

| Method | Command |
|--------|---------|
| Xcode  | `Cmd+U` |
| CLI    | `xcodebuild test -scheme testApp -destination 'platform=iOS Simulator,name=iPhone 16'` |

## Guidelines

- Unit test every public ViewModel method
- Keep tests `@MainActor` to match ViewModel isolation
- Avoid testing SwiftUI view internals — test ViewModel state instead
- UI tests cover critical user flows only (not exhaustive coverage)
