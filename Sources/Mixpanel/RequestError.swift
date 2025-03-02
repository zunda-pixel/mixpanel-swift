import Foundation
import HTTPTypes

struct RequestError: Error {
  var data: Data
  var response: HTTPResponse
}
