import Foundation

struct Metadata: Codable {
    var name: String
    var namespace: String
    var selfLink: String
    var uid: String
    var resourceVersion: String
    var creationTimestamp: Date
    var labels: [String: String]
    var annotations: [String: String]
}
