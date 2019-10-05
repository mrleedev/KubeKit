//
//  Deployment.swift
//  KubeKit
//
//  Created by Lee Machin on 05/10/2019.
//  Copyright © 2019 Lee Machin. All rights reserved.
//

import ObjectMapper

struct Deployment: ImmutableMappable {
    var kind: Kind
    var apiVersion: String
    var metadata: Metadata
    var status: DeploymentStatus
    
    init(map: Map) throws {
        kind = try map.value("kind")
        apiVersion = try map.value("apiVersion")
        metadata = try map.value("metadata")
        status = try map.value("status")
    }
    
    func mapping(map: Map) {
        kind >>> map["kind"]
        apiVersion >>> map["apiVersion"]
        metadata >>> map["metadata"]
        status >>> map["status"]
    }
}
