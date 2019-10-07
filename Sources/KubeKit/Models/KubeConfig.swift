import Foundation

struct KubeConfig: Codable {
    let apiVersion: String
    let clusters: [ClusterElement]
    let contexts: [ContextElement]
    let currentContext: String
    let kind: Kind
    let preferences: [String: String]
    let users: [UserElement]

    enum CodingKeys: String, CodingKey {
        case apiVersion
        case clusters
        case contexts
        case currentContext = "current-context"
        case kind
        case preferences
        case users
    }

    struct ClusterElement: Codable {
        let name: String
        let cluster: Cluster
        
        struct Cluster: Codable {
            let certificateAuthorityData: String
            let insecureSkipTlsVerify: Bool?
            let server: URL
            
            enum CodingKeys: String, CodingKey {
                case certificateAuthorityData = "certificate-authority-data"
                case insecureSkipTlsVerify = "insecure-skip-tls-verify"
                case server
            }
        }
    }

    struct ContextElement: Codable {
        let name: String
        let context: Context
        
        struct Context: Codable {
            let cluster: String
            let namespace: String?
            let user: String
        }
    }

    struct UserElement: Codable {
        let name: String
        let user: User
        
        struct User: Codable {
            let clientCertificateData: String?
            let clientKeyData: String?
            let username: String?
            let password: String?
            
            enum CodingKeys: String, CodingKey {
                case clientCertificateData = "client-certificate-data"
                case clientKeyData = "client-key-data"
                case username
                case password
            }
        }
    }
}
