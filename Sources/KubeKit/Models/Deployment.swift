import Foundation

struct Deployment: Codable {
    let kind: Kind
    let apiVersion: String
    let metadata: Metadata
    let status: Status
    let spec: Spec
    
    
    struct Status: Codable {
        let observedGeneration: Int
        let replicas: Int
        let updatedReplicas: Int
        let availableReplicas: Int
    }
    
    struct Spec: Codable {
        let replicas: Int
        let selector: LabelSelector
        let template: Template
        let strategy: Strategy
        
        struct Template: Codable {
            
        }
        
        struct Strategy: Codable {
            var type: StrategyType
            var rollingUpdate: RollingUpdate?
            
            enum StrategyType: String, Codable {
                case Recreate
                case RollingUpdate
            }

            struct RollingUpdate: Codable {
                var maxUnavailable: Int
                var maxSurge: Int
            }
        }
    }
}
