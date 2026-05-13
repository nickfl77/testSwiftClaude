import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MapViewModel()

    var body: some View {
        ZStack {
            MapView(viewModel: viewModel)
                .ignoresSafeArea()

            VStack {
                Picker("Map Type", selection: $viewModel.mapType) {
                    ForEach(MapType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(.ultraThinMaterial)

                Spacer()
            }

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
