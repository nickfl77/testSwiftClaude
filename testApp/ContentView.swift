import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MapViewModel()

    var body: some View {
        ZStack {
            MapView(viewModel: viewModel)
                .ignoresSafeArea()

            if viewModel.locationDenied {
                LocationPermissionDeniedView()
            }
        }
        .onAppear {
            viewModel.onMapAppear()
        }
    }
}

#Preview {
    ContentView()
}
