import ObjectMapper

struct LabelSelector: ImmutableMappable {
    var matchLabels: [String: String]?
    var matchExpression: LabelSelectorExpression?
    
    init(map: Map) {
        
    }
}
