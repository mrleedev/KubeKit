import ObjectMapper

struct RollingUpdate: ImmutableMappable {
    var maxUnavailable: Int
    var maxSurge: Int
    
    init(map: Map) throws {
        maxUnavailable = try map.value("maxUnavailable")
        maxSurge = try map.value("maxSurge")
    }
    
    func mapping(map: Map) {
        maxUnavailable >>> map["maxUnavailable"]
        maxSurge >>> map["maxSurge"]
    }
}
