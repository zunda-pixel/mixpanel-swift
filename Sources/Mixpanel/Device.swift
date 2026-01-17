import Foundation
import MemberwiseInit

@MemberwiseInit(.public)
public struct Device: Hashable, Sendable {
  public var model: String
  public var manufacturer: String
}
