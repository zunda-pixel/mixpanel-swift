import Foundation
import HTTPTypes
import HTTPTypesFoundation
import HTTPClient

public struct Client<HTTPClient: HTTPClientProtocol> {
  public var baseUrl: URL = URL(string: "https://api.mixpanel.com")!
  public var httpClient: HTTPClient
  
  public init(
    httpClient: HTTPClient
  ) {
    self.httpClient = httpClient
  }
  
  public func track(
    events: [Event]
  ) async throws {
    let request = HTTPRequest(
      method: .post,
      url: baseUrl.appending(path: "track"),
      headerFields: [
        .contentType: "application/json",
      ]
    )
    
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
