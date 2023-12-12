//
//  NSCache+Subscript.swift
//  Earthquakes-iOS
//
//  Created by nat on 12/12/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

extension NSCache where KeyType == NSString, ObjectType == CacheEntryObject {
    subscript(_ url: URL) -> CacheEntry? {
        //  a getter that retrieves a cacheEntryObject and returns the CacheEntry
        get {
            let key = url.absoluteString as NSString
            let value = object(forKey: key)
            return value?.entry
        }
        //  a setter that stores CacheEntryObject
        set {
            let key = url.absoluteString as NSString
            if let entry = newValue {
                let value = CacheEntryObject(entry: entry)
                setObject(value, forKey: key)
            } else {
                removeObject(forKey: key)
            }
        }
    }
}
