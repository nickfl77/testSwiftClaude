import CoreLocation
import Foundation
import GoogleMaps

enum MapType: String, CaseIterable {
    case road = "Road"
    case satellite = "Satellite"
    case hybrid = "Hybrid"
    case terrain = "Terrain"

    var gmsType: GMSMapViewType {
        switch self {
        case .road:      return .normal
        case .satellite: return .satellite
        case .hybrid:    return .hybrid
        case .terrain:   return .terrain
        }
    }
}

@MainActor
final class MapViewModel: ObservableObject {
    @Published var cameraPosition: CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: 51.5074,
        longitude: -0.1278
    )
    @Published var mapType: MapType = .road

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
