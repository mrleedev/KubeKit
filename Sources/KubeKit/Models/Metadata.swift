import Foundation
import ObjectMapper

struct Metadata: ImmutableMappable {
    var name: String
    var namespace: String
    var selfLink: String
    var uid: String
    var resourceVersion: String
    var creationTimestamp: Date
    var labels: [String: String]?
    var annotations: [String: String]?
    
    init(map: Map) throws {
        name = try map.value("name")
        namespace = try map.value("namespace")
        selfLink = try map.value("selfLink")
        uid = try map.value("uid")
        resourceVersion = try map.value("resourceVersion")
        creationTimestamp = try map.value("creationTimestamp", using: DateTransform())
        labels = try? map.value("labels")
        annotations = try? map.value("annotations")
    }
    
    func mapping(map: Map) {
        name >>> map["name"]
        namespace >>> map["namespace"]
        selfLink >>> map["selfLink"]
        uid >>> map["uid"]
        resourceVersion >>> map["resourceVersion"]
        creationTimestamp >>> (map["creationTimestamp"], DateTransform())
        labels >>> map["labels"]
        annotations >>> map["annotations"]
    }
}
