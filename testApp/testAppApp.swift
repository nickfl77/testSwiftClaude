import GoogleMaps
import SwiftUI

@main
struct testAppApp: App {
    init() {
        GMSServices.provideAPIKey(Configuration.googleMapsAPIKey)
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
