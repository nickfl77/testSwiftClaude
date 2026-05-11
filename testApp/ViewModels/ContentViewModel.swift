import Foundation

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var items: [Item] = []

    func loadItems() async {
        items = [
            Item(title: "First Item", subtitle: "Subtitle one"),
            Item(title: "Second Item", subtitle: "Subtitle two"),
        ]
    }

    func addItem() {
        let count = items.count + 1
        items.append(Item(title: "Item \(count)", subtitle: "Subtitle \(count)"))
    }
}
