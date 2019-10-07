import Foundation

struct Deployment: Codable {
    let kind: Kind
    let apiVersion: String
    let metadata: Metadata
    let status: DeploymentStatus
    let spec: DeploymentSpec
}

struct DeploymentSpec: Codable {
    let replicas: Int
    let selector: LabelSelector
    let template: DeploymentSpecTemplate
    let strategy: DeploymentSpecStrategy
}

struct DeploymentSpecTemplate: Codable {
    let metadata: Metadata
    let spec: DeploymentSpecTemplateSpec
}

struct DeploymentSpecTemplateSpec: Codable {
    let containers: [Container]
    let restartPolicy: RestartPolicy
    let terminationGracePeriodSeconds: Int
    let dnsPolicy: DNSPolicy
    let securityContext: [String: String]

    enum RestartPolicy: String, Codable {
        case always = "Always"
        case never = "Never"
    }

    enum DNSPolicy: String, Codable {
        case clusterFirst = "ClusterFirst"
    }
}

struct DeploymentStatus: Codable {
    let observedGeneration: Int
    let replicas: Int
    let updatedReplicas: Int
    let availableReplicas: Int
}

enum DeploymentSpecStrategy: Codable {
    case recreate(DeploymentStrategyRecreate)
    case rollingUpdate(DeploymentStrategyRollingUpdate)

    enum CodingKeys: CodingKey {
        case recreate
        case rollingUpdate
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // finish
    }

    func encode(to encoder: Encoder) throws {
        let container = try encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .recreate(let value):
            try container.encode(value, forKey: .recreate)
        case .rollingUpdate(let value):
            try container.encode(value, forKey: .rollingUpdate)
        }
    }
}

struct DeploymentStrategyRecreate: Codable {
    let type: String
}

struct DeploymentStrategyRollingUpdate: Codable {
    let type: String
    let maxUnavailable: Int
    let maxSurge: Int
}
