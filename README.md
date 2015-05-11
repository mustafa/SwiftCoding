# SwiftCoding
Automatic NSCoding for Swift

### Installing

Just add `SwiftCoding.swift` to your project.

### Example

```swift
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
```

### Contributing

Pull requests are welcome!

TODO:

[] Add support for Swift types that are not representable in Obj-C

[] 
