import ObjectMapper

struct DeploymentStatus: ImmutableMappable {
    var observedGeneration: Int
    var replicas: Int
    var updatedReplicas: Int
    var availableReplicas: Int
    
    init(map: Map) throws {
        observedGeneration = try map.value("observedGeneration")
        replicas = try map.value("replicas")
        updatedReplicas = try map.value("updatedReplicas")
        availableReplicas = try map.value("availableReplicas")
    }
    
    func mapping(map: Map) {
        observedGeneration >>> map["observedGeneration"]
        replicas >>> map["replicas"]
        updatedReplicas >>> map["updatedReplicas"]
        availableReplicas >>> map["availableReplicas"]
    }
}
