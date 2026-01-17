import MemberwiseInit

@MemberwiseInit
struct PostEvent: Encodable {
  var id: UInt
  var name: String
  var properties: Properties
  var metadata: Metadata

  private enum CodingKeys: String, CodingKey {
    case id
    case name = "event"
    case properties
    case metadata = "$mp_metadata"
  }
}
