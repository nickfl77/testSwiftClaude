import SwiftUI

struct FavouritesView: View {
    var body: some View {
        NavigationStack {
            Text("Favourites")
                .foregroundStyle(.secondary)
                .navigationTitle("Favourites")
        }
    }
}

#Preview {
    FavouritesView()
}
