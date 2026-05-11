import CoreLocation
import Foundation

@MainActor
final class MapViewModel: ObservableObject {
    @Published var cameraPosition: CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: 51.5074,
        longitude: -0.1278
    )

    let locationManager = LocationManager()

    var locationDenied: Bool {
        locationManager.authorizationStatus == .denied ||
        locationManager.authorizationStatus == .restricted
    }

    var locationAuthorized: Bool {
        locationManager.authorizationStatus == .authorizedWhenInUse ||
        locationManager.authorizationStatus == .authorizedAlways
    }

    func onMapAppear() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestPermission()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdating()
        default:
            break
        }
    }
}
