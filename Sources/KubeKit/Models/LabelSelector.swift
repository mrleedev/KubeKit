import Foundation

struct LabelSelector: Codable {
    var matchLabels: [String: String]?
    var matchExpression: Expression?

    struct Expression: Codable {
        var key: String
        var op: Operator
        var values: [String]
        
        enum CodingKeys: String, CodingKey {
            case key
            case op = "operator"
            case values
        }
        
        enum Operator: String, Codable {
            case In = "in"
            case NotIn = "notin"
            case Exists = "exists"
        }
    }

}
