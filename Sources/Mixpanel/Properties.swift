import Foundation

public struct Properties: Encodable {
  public var token: String
  public var time: Date
  public var userId: String?
  public var duration: TimeInterval?
  public var appVersion: String
  public var screenHeight: Int
  public var screenWidth: Int
  public var model: String
  public var deviceId: String
  public var distinctId: String
  public var appBuildNumber: String
  public var libVersion: String
  public var radio: String
  public var wifi: Bool
  public var osVersion: String
  public var manufacturer: String
  public var os: String
  public var hadPersistedDistinctId: Bool

  public init(
    token: String,
    time: Date,
    userId: String? = nil,
    duration: TimeInterval? = nil,
    appVersion: String,
    screenHeight: Int,
    screenWidth: Int,
    model: String,
    deviceId: String,
    distinctId: String,
    appBuildNumber: String,
    libVersion: String,
    radio: String,
    wifi: Bool,
    osVersion: String,
    manufacturer: String,
    os: String,
    hadPersistedDistinctId: Bool
  ) {
    self.token = token
    self.time = time
    self.userId = userId
    self.duration = duration
    self.appVersion = appVersion
    self.screenHeight = screenHeight
    self.screenWidth = screenWidth
    self.model = model
    self.deviceId = deviceId
    self.distinctId = distinctId
    self.appBuildNumber = appBuildNumber
    self.libVersion = libVersion
    self.radio = radio
    self.wifi = wifi
    self.osVersion = osVersion
    self.manufacturer = manufacturer
    self.os = os
    self.hadPersistedDistinctId = hadPersistedDistinctId
  }

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
    case libVersion = "$lib_version"
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
    try container.encode(self.screenHeight, forKey: .screenHeight)
    try container.encode(self.screenWidth, forKey: .screenWidth)
    try container.encode(self.model, forKey: .model)
    try container.encode(self.deviceId, forKey: .deviceId)
    try container.encode(self.distinctId, forKey: .distinctId)
    try container.encode(self.appBuildNumber, forKey: .appBuildNumber)
    try container.encode(self.libVersion, forKey: .libVersion)
    try container.encode(self.radio, forKey: .radio)
    try container.encode(self.wifi, forKey: .wifi)
    try container.encode(self.osVersion, forKey: .osVersion)
    try container.encode(self.manufacturer, forKey: .manufacturer)
    try container.encode(self.os, forKey: .os)
    try container.encode(self.hadPersistedDistinctId, forKey: .hadPersistedDistinctId)
  }
}
