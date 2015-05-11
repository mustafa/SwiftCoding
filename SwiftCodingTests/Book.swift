//
//  Book.swift
//  SwiftCoding
//
//  Created by Mustafa Furniturewala on 5/10/15.
//  Copyright (c) 2015 Mustafa. All rights reserved.
//

import Foundation


@objc public class Book: NSObject, NSCoding {
    dynamic var title: String?
    dynamic var author: String?
    dynamic var pageCount: NSNumber?
    dynamic var categories: [String]?
    dynamic var available: NSNumber?
    
    // MARK: NSCoding
    
    required convenience public init(coder decoder: NSCoder) {
        self.init()
        setupWithCoder(coder: decoder)
    }
    
    public func encodeWithCoder(coder: NSCoder) {
        encode(coder)
    }
}