import ObjectMapper

class DeploymentRequest {
    enum Routes {
        case read(name: String, path: String = "/apis/apps/v1/namespaces/default/deployments/\(name)")
        case status(name: String, path: String = "/apis/apps/v1/namespaces/default/deployments/\(name)/status")
    }
    
    static func read(name: String) {
        return AF.request(Routes.read(name: name).path, method: .get).responseString { response in
            
        }
    }
}
