import Foundation
import Yams

struct KubeKit {
    func loadConfig(fromFile path: String) throws -> KubeConfig {
        let yaml = try String(contentsOfFile: path, encoding: .utf8)
        let decoder = YAMLDecoder()
        return try decoder.decode(KubeConfig.self, from: yaml)
    }
}
