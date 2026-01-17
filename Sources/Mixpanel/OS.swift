import Foundation
import MemberwiseInit

@MemberwiseInit(.public)
public struct OS: Hashable, Sendable {
  public var name: String
  public var version: String
}
