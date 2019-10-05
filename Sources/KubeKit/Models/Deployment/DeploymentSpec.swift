import ObjectMapper

struct DeploymentTemplate {}

struct DeploymentSpec: ImmutableMappable {
    var replicas: Int
    var selector: LabelSelector
    var template: DeploymentTemplate
    var strategy: DeploymentStrategy
    
    init(map: Map) throws {
        replicas = try map.value("replicas")
        selector = try map.value("selector")
        template = try map.value("template")
        strategy = try map.value("strategy")
    }
    
    func mapping(map: Map) {
        replicas >>> map["replicas"]
        selector >>> map["selector"]
        template >>> map["template"]
        strategy >>> map["strategy"]
    }
}
