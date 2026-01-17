import MemberwiseInit

@MemberwiseInit(.public)
public struct PostEvent: Encodable {
  public var id: UInt
  public var event: String
  public var properties: Properties
  public var metadata: Metadata

  private enum CodingKeys: String, CodingKey {
    case id
    case event
    case properties
    case metadata = "$mp_metadata"
  }
}
