import Foundation
import MemberwiseInit

@MemberwiseInit(.public)
public struct OS {
  public var name: String
  public var version: String
}

@MemberwiseInit(.public)
public struct Device {
  public var model: String
  public var manufacturer: String
}

@MemberwiseInit(.public)
public struct Properties: Encodable {
  public var token: String
  public var time: Date
  public var userId: String?
  public var duration: TimeInterval?
  public var appVersion: String
  public var screenSize: CGSize
  public var deviceId: String
  public var distinctId: String
  public var appBuildNumber: String
  public var libraryVersion: String
  public var radio: String
  public var wifi: Bool
  public var device: Device
  public var os: OS
  public var hadPersistedDistinctId: Bool

  private enum CodingKeys: String, CodingKey {
    case token
    case time
    case userId = "$user_id"
    case duration = "$duration"
    case appVersion = "$app_version_string"
    case screenHeight = "$screen_height"
    case screenWidth = "$screen_width"
    case model = "$model"
    case deviceId = "$device_id"
    case distinctId = "distinct_id"
    case appBuildNumber = "$app_build_number"
    case libraryVersion = "$lib_version"
    case radio = "$radio"
    case wifi = "$wifi"
    case osVersion = "$os_version"
    case manufacturer = "$manufacturer"
    case os = "$os"
    case hadPersistedDistinctId = "$had_persisted_distinct_id"
  }

  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.token, forKey: .token)
    try container.encode(round(self.time.timeIntervalSince1970 * 1000), forKey: .time)
    try container.encodeIfPresent(self.userId, forKey: .userId)
    try container.encodeIfPresent(
      self.duration.map { Double(String(format: "%.3f", $0)) },
      forKey: .duration
    )
    try container.encode(self.appVersion, forKey: .appVersion)
    try container.encode(self.screenSize.width, forKey: .screenHeight)
    try container.encode(self.screenSize.height, forKey: .screenWidth)
    try container.encode(self.deviceId, forKey: .deviceId)
    try container.encode(self.distinctId, forKey: .distinctId)
    try container.encode(self.appBuildNumber, forKey: .appBuildNumber)
    try container.encode(self.libraryVersion, forKey: .libraryVersion)
    try container.encode(self.radio, forKey: .radio)
    try container.encode(self.wifi, forKey: .wifi)
    try container.encode(self.device.model, forKey: .model)
    try container.encode(self.device.manufacturer, forKey: .manufacturer)
    try container.encode(self.os.name, forKey: .os)
    try container.encode(self.os.version, forKey: .osVersion)
    try container.encode(self.hadPersistedDistinctId, forKey: .hadPersistedDistinctId)
  }
}
