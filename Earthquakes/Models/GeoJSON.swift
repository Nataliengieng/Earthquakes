//
//  GeoJSON.swift
//  Earthquakes-iOS
//
//  Created by nat on 10/12/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

struct GeoJSON: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case features
    }
    private enum FeatureCodingKeys: String, CodingKey {
        case properties
    }
    
    private(set) var quakes: [Quake] = []
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        var featuresContainer = try rootContainer.nestedUnkeyedContainer(forKey: .features)
        
        //  Loop through the features container until the isAtEnd flag is true, and try to decode each element as a Quake. If successful, add the quake to the quakes array.
        while !featuresContainer.isAtEnd {
            let propertiesContainer = try featuresContainer.nestedContainer(keyedBy: FeatureCodingKeys.self)

            if let properties = try? propertiesContainer.decode(Quake.self, forKey: .properties) {
                quakes.append(properties)
            }
        }
    }
}
