//
//  CacheEntryObject.swift
//  Earthquakes-iOS
//
//  Created by nat on 12/12/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) {
        self.entry = entry
    }
}

enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
