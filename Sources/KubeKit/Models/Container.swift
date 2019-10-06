import Foundation

struct Container: Codable {
    let name: String
    let image: String
    let ports: [PortSpec]
    let resources: [String: String]
    let terminationMessagePath: String
    let imagePullPolicy: ImagePullPolicy
    
    enum ImagePullPolicy: String, Codable {
        case Always
        case IfNotPresent
    }
}
