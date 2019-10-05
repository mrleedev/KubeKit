//
//  DeploymentStrategy.swift
//  KubeKit
//
//  Created by Lee Machin on 05/10/2019.
//  Copyright © 2019 Lee Machin. All rights reserved.
//

import ObjectMapper

struct DeploymentStrategy: ImmutableMappable {   
    var type: DeploymentStrategyType
    var rollingUpdate: RollingUpdate?
    
    init(map: Map) throws {
        type = try map.value("type")
        rollingUpdate = try? map.value("rollingUpdate")
    }
    
    func mapping(map: Map) {
        type >>> map["type"]
        rollingUpdate >>> map["rollingUpdate"]
    }
    
    
}
