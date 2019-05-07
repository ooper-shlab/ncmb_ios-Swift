//
//  NCMBOperation.swift
//  NCMB
//
//  Created by 開発 on 2019/05/01.
//  Copyright © 2019 OOPer's. All rights reserved.
//

import Foundation

public protocol NCMBOperation: class {
    func encode() -> Any
    func apply(_ oldValue: Any?, ncmbObject object: NCMBObject?, for key: String?) -> Any?
    func merge(previous: NCMBOperation?) -> NCMBOperation
}

public class NCMBOperationSet: Sequence, ExpressibleByDictionaryLiteral {
    public typealias Element = (key: String, value: NCMBOperation)
    
    private var operations: [String: NCMBOperation] = [:]
    
    public subscript(key: String) -> NCMBOperation? {
        get {
            return operations[key]
        }
        set {
            operations[key] = newValue
        }
    }
    
    public func makeIterator() -> Dictionary<String, NCMBOperation>.Iterator {
        return operations.makeIterator()
    }
    
    public var keys: Dictionary<String, NCMBOperation>.Keys {
        return operations.keys
    }
    
    public var values: Dictionary<String, NCMBOperation>.Values {
        return operations.values
    }
    
    public var isEmpty: Bool {
        return operations.isEmpty
    }
    
    public init() {}

    public required init(dictionaryLiteral elements: (String, NCMBOperation)...) {
        self.operations = Dictionary(elements, uniquingKeysWith: {_,_ in
            fatalError("Duplicate key")
        })
    }
}
