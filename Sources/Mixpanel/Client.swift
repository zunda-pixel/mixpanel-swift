import Foundation
import HTTPClient
import HTTPTypes
import HTTPTypesFoundation
import MemberwiseInit

@MemberwiseInit(.public)
public struct Client<HTTPClient: HTTPClientProtocol> {
  public var baseUrl: URL = URL(string: "https://api.mixpanel.com")!
  public var httpClient: HTTPClient
  public var token: String
  public var os: OS
  public var deviceId: String
  public var device: Device
  public var screenSize: CGSize
  public var userId: String?
  public var appVersion: String
  public var appBuildNumber: String
  public var libraryVersion:String
  public var radio: String
  public var useWifi: Bool

  public func track(
    events: [Event]
  ) async throws {
    let request = HTTPRequest(
      method: .post,
      url: baseUrl.appending(path: "track"),
      headerFields: [
        .contentType: "application/json"
      ]
    )

    let events: [PostEvent] = events.map { event in
      PostEvent(
        id: event.id,
        name: event.name,
        properties: PostEvent.Properties(
          token: token,
          time: event.properties.time,
          userId: userId,
          duration: event.properties.duration,
          appVersion: appVersion,
          screenSize: screenSize,
          deviceId: deviceId,
          distinctId: event.properties.distinctId,
          appBuildNumber: appBuildNumber,
          libraryVersion: libraryVersion,
          radio: radio,
          useWifi: useWifi,
          device: device,
          os: os,
          hadPersistedDistinctId: event.properties.hadPersistedDistinctId
        ),
        metadata: event.metadata
      )
    }
    let bodyData = try JSONEncoder().encode(events)

    let (data, response) = try await httpClient.execute(
      for: request,
      from: bodyData
    )

    guard response.status != .ok else { return }

    throw RequestError(
      data: data,
      response: response
    )
  }
}

extension Client: Sendable where HTTPClient: Sendable {}
