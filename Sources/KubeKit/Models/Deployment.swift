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

    init(from decoder: Decoder) throws {
        // todo
    }

    func encode(to encoder: Encoder) throws {
        // todo
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
