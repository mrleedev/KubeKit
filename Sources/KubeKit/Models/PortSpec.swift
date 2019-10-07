import Foundation

struct PortSpec: Codable {
    let containerPort: Int
    let proto: PortProtocol
    
    enum CodingKeys: String, CodingKey {
        case containerPort
        case proto = "protocol"
    }
    
    enum PortProtocol: String, Codable {
        case tcp = "TCP"
        case udp = "UDP"
        case http = "HTTP"
    }
}
