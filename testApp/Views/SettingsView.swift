import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Text("Settings")
                .foregroundStyle(.secondary)
                .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
