import GoogleMaps
import SwiftUI

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel: MapViewModel

    func makeUIView(context: Context) -> GMSMapView {
        let options = GMSMapViewOptions()
        options.camera = GMSCameraPosition(
            latitude: viewModel.cameraPosition.latitude,
            longitude: viewModel.cameraPosition.longitude,
            zoom: 14
        )
        options.frame = UIScreen.main.bounds
        let mapView = GMSMapView(options: options)
        mapView.isMyLocationEnabled = viewModel.locationAuthorized
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.isMyLocationEnabled = viewModel.locationAuthorized

        if let location = viewModel.locationManager.userLocation {
            mapView.animate(to: GMSCameraPosition(
                latitude: location.latitude,
                longitude: location.longitude,
                zoom: 14
            ))
        }
    }
}
