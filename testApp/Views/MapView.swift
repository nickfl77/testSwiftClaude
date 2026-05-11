import GoogleMaps
import SwiftUI

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel: MapViewModel

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(
            withLatitude: viewModel.cameraPosition.latitude,
            longitude: viewModel.cameraPosition.longitude,
            zoom: 14
        )
        let mapView = GMSMapView(frame: .zero, camera: camera)
        mapView.isMyLocationEnabled = viewModel.locationAuthorized
        mapView.settings.myLocationButton = true
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.isMyLocationEnabled = viewModel.locationAuthorized

        if let location = viewModel.locationManager.userLocation {
            let camera = GMSCameraPosition.camera(
                withLatitude: location.latitude,
                longitude: location.longitude,
                zoom: 14
            )
            mapView.animate(to: camera)
        }
    }
}
