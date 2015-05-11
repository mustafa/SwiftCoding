//
//  SwiftCoding.swift
//  SwiftCoding
//
//  Created by Mustafa Furniturewala on 5/10/15.
//  Copyright (c) 2015 Mustafa. All rights reserved.
//

import Foundation

extension NSObject {
    func codableProperties() -> Dictionary<String, Any?> {
        var codableProperties = [String: Any?]()
        let mirrorOfSelf: MirrorType = reflect(self)
        let numberOfProperties = reflect(self).count
        for var i = 0; i < numberOfProperties; i++ {
            if i == 0 {
                // super
                continue;
            }
            let (name,some) = mirrorOfSelf[i]
            codableProperties[name] = unwrap(some.value)
        }
        return codableProperties
    }
    
    func unwrap(any: Any) -> Any? {
        let mi:MirrorType = reflect(any)
        if mi.disposition != .Optional {
            return any
        }
        if mi.count == 0 { return nil } // Optional.None
        let (name,some) = mi[0]
        return some.value
    }
    
    public func setupWithCoder(coder decoder: NSCoder) {
        for (key, value) in codableProperties() {
            let object: AnyObject? = decoder.decodeObjectForKey(key)
            setValue(object, forKey: key)
        }
    }
    
    public func encode(aCoder: NSCoder) {
        for (key, value) in codableProperties() {
            switch value {
                case let property as AnyObject:
                    aCoder.encodeObject(property, forKey: key)
                case let property as Int:
                    aCoder.encodeInt(Int32(property), forKey: key)
                case let property as Bool:
                    aCoder.encodeBool(property, forKey: key)                
                default:
                    println("Nil value for \(key)")
            }
        }
    }
}