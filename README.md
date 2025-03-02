## Mixpanel Client

```swift
import Mixpanel

let clinet = Client(
  httpClient: .urlSession(.shared)
)

let events: [Event] = [
  Event(
    id: 1,
    event: "Sign Up",
    properties: Properties(
      token: "asdf5012321487dbasdf3250c12312e27178",
      time: .now,
      userId: "22222",
      appVersion: "1.0",
      screenHeight: 852,
      screenWidth: 393,
      model: "iPhone17,3",
      deviceId: "3B03068A-CC08-1231-A036-C373123138C",
      distinctId: "$device:3B231A-CC08-4434-A036-C31235B538C",
      appBuildNumber: "1",
      libVersion: "4.3.1",
      radio: "NRNSA, LTE",
      wifi: true,
      osVersion: "18.4",
      manufacturer: "Apple",
      os: "iOS",
      hadPersistedDistinctId: true
    ),
    metadata: Metadeta(
      sessionId: "0b0bd9d6a92cb38c",
      sessionStartSec: .now,
      eventId: "82cc5e35a1f9065f",
      sessionSeqId: 0
    )
  )
]

try await clinet.track(events: events)
```
