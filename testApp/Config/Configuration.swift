import Foundation

enum Configuration {
    enum Environment: String {
        case test
        case production
    }

    static var apiBaseURL: URL {
        guard
            let raw = Bundle.main.infoDictionary?["APIBaseURL"] as? String,
            let url = URL(string: raw)
        else {
            fatalError("APIBaseURL missing or malformed in Info.plist — check xcconfig")
        }
        return url
    }

    static var googleMapsAPIKey: String {
        guard
            let key = Bundle.main.infoDictionary?["GoogleMapsAPIKey"] as? String,
            !key.isEmpty
        else {
            fatalError("GoogleMapsAPIKey missing in Info.plist — check xcconfig")
        }
        return key
    }

    static var environment: Environment {
        guard
            let raw = Bundle.main.infoDictionary?["AppEnvironment"] as? String,
            let env = Environment(rawValue: raw)
        else {
            return .production
        }
        return env
    }
}
