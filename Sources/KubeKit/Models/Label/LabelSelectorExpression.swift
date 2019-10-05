import ObjectMapper

struct LabelSelectorExpression: ImmutableMappable {
    var key: String
    var op: LabelSelectorExpressionOperator
    var values: [String]
    
    init(map: Map) throws {
        key = try map.value("key")
        op = try map.value("operator")
        values = try map.value("values")
    }
    
    func mapping(map: Map) {
        key >>> map["key"]
        op >>> map["operator"]
        values >>> map["values"]
    }
}
