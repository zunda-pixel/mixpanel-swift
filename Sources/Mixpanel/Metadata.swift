import Foundation

public struct Metadata: Encodable {
  public var sessionId: String
  public var sessionStartSec: Date
  public var eventId: String
  public var sessionSeqId: Int

  private enum CodingKeys: String, CodingKey {
    case sessionId = "$mp_session_id"
    case sessionStartSec = "$mp_session_start_sec"
    case eventId = "$mp_event_id"
    case sessionSeqId = "$mp_session_seq_id"
  }
  
  public init(
    sessionId: String,
    sessionStartSec: Date,
    eventId: String,
    sessionSeqId: Int
  ) {
    self.sessionId = sessionId
    self.sessionStartSec = sessionStartSec
    self.eventId = eventId
    self.sessionSeqId = sessionSeqId
  }
  
  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.sessionId, forKey: .sessionId)
    try container.encode(round(self.sessionStartSec.timeIntervalSince1970), forKey: .sessionStartSec)
    try container.encode(self.eventId, forKey: .eventId)
    try container.encode(self.sessionSeqId, forKey: .sessionSeqId)
  }
}
