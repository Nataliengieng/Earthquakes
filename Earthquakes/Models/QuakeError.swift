//
//  QuakeError.swift
//  Earthquakes-iOS
//
//  Created by nat on 10/12/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

enum QuakeError: Error {
    case missingData
}
    
extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard a quark missing a valid code, magniture, place, or time.", comment: "")
        }
    }
}

