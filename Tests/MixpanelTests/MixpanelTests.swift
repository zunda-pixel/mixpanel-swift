import Testing
import Mixpanel
import Foundation

@Suite
struct MixpanelTests {
  @Test
  func sendEvent() async throws {
    let client = Client(
      httpClient: .urlSession(.shared),
      token: ProcessInfo.processInfo.environment["TOKEN"]!,
      os: OS(name: "iOS", version: "26.2"),
      deviceId: UUID().uuidString,
      device: Device(
        model: "iPhone 17",
        manufacturer: "Apple"
      ),
      screenSize: .init(width: 123, height: 123),
      userId: UUID().uuidString,
      appVersion: "1.0.0",
      appBuildNumber: "1.0.0",
      libraryVersion: "1.0.0",
      radio: "AT&T",
      useWifi: true
    )
    
    try await client.track(events: [
      Event(
        id: 1,
        name: "app_open",
        properties: Event.Properties(time: .now, duration: nil, distinctId: UUID().uuidString, hadPersistedDistinctId: false),
        metadata: Metadata(sessionId: UUID().uuidString, sessionStartSec: .now, eventId: UUID().uuidString, sessionSeqId: 1)
      ),
    ])
  }
}
