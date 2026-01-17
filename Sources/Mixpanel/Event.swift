import MemberwiseInit

@MemberwiseInit(.public)
public struct Event {
  public var id: UInt
  public var name: String
  public var properties: Properties
  public var metadata: Metadata
}
