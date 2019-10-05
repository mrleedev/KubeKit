//
//  RollingUpdate.swift
//  KubeKit
//
//  Created by Lee Machin on 05/10/2019.
//  Copyright © 2019 Lee Machin. All rights reserved.
//

import ObjectMapper

struct RollingUpdate: ImmutableMappable {
    var maxUnavailable: Int
    var maxSurge: Int
    
    init(map: Map) throws {
        maxUnavailable = try map.value("maxUnavailable")
        maxSurge = try map.value("maxSurge")
    }
    
    func mapping(map: Map) {
        maxUnavailable >>> map["maxUnavailable"]
        maxSurge >>> map["maxSurge"]
    }
}
