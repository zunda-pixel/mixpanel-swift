public struct Event: Encodable {
  public var id: UInt
  public var event: String
  public var properties: Properties
  public var metadata: Metadata
  
  public init(
    id: UInt,
    event: String,
    properties: Properties,
    metadata: Metadata
  ) {
    self.id = id
    self.event = event
    self.properties = properties
    self.metadata = metadata
  }
  
  private enum CodingKeys: String, CodingKey {
    case id
    case event
    case properties
    case metadata = "$mp_metadata"
  }
}
