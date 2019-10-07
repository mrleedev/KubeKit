import Foundation

struct LabelSelector: Codable {
    var matchLabels: [String: String]?
    var matchExpression: Expression?

    struct Expression: Codable {
        var key: String
        var operand: Operator
        var values: [String]
        
        enum CodingKeys: String, CodingKey {
            case key
            case operand = "operator"
            case values
        }
        
        enum Operator: String, Codable {
            case isIn = "In"
            case notIn = "notin"
            case exists
        }
    }

}
