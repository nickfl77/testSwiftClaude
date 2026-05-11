import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.items) { item in
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("testApp")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                        viewModel.addItem()
                    }
                }
            }
            .task {
                await viewModel.loadItems()
            }
        }
    }
}

#Preview {
    ContentView()
}
