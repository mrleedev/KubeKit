import ObjectMapper

struct LabelSelector: ImmutableMappable {
    var matchLabels: [String: String]?
    var matchExpression: LabelSelectorExpression?
    
    init(map: Map) throws {
        matchLabels = try? map.value("matchLabels")
        matchExpression = try? map.value("matchExpression")
    }
    
    func mapping(map: Map) {
        matchLabels >>> map["matchLabels"]
        matchExpression >>> map["matchExpression"]
    }
}
