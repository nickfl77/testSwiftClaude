import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            Text("Search")
                .foregroundStyle(.secondary)
                .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
