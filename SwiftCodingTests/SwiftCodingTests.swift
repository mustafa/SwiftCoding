//
//  SwiftCodingTests.swift
//  SwiftCodingTests
//
//  Created by Mustafa Furniturewala on 5/10/15.
//  Copyright (c) 2015 Mustafa. All rights reserved.
//

import UIKit
import XCTest

class SwiftCodingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let book = Book()
        book.title = "Hello World!"
        book.pageCount = 3
        book.categories = ["one", "two"]
        book.available = true
        
        var pageCount: Int?
        var categories: [String]?
        var available: Bool?
        let data = NSKeyedArchiver.archivedDataWithRootObject(book)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "book")
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("book") as? NSData {
            let book = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Book
            XCTAssertEqual(book.title!, "Hello World!")
            XCTAssertEqual(book.pageCount!, 3)
            XCTAssertEqual(book.categories!.count, 2)
            XCTAssertNil(book.author)
        }
    }
    
}
