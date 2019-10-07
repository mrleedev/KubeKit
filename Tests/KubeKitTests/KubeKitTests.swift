import XCTest

@testable import KubeKit

final class KubeKitTests: XCTestCase {
    let repoRoot = URL(fileURLWithPath: #file.replacingOccurrences(of: "KubeKitTests/KubeKitTests.swift", with: ""))

    func testLoadConfigWithValidFilePath() throws {
        let testConfigPath = repoRoot.appendingPathComponent("Resources/kubeconfig.yml").path
        let config = try KubeKit.loadConfig(fromFile: testConfigPath)

        XCTAssertEqual(config.kind, .config)
        XCTAssertEqual(config.currentContext, "context2")
    }

    static var allTests = [
        ("testLoadConfigWithValidFilePath", testLoadConfigWithValidFilePath)
    ]
}
