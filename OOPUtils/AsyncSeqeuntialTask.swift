//
//  OOPAsyncSequential.swift
//  NCMB
//
//  Created by 開発 on 2019/05/05.
//  Copyright © 2019 OOPer's. All rights reserved.
//

import Foundation

public class AsyncSeqeuntialTask<IteratorType: IteratorProtocol> {
    private var iterator: IteratorType
    
    public typealias TaskType = (IteratorType.Element, AsyncSeqeuntialTask<IteratorType>)->Void
    public typealias CompletionType = (AsyncSeqeuntialTask<IteratorType>)->Void
    
    private var task: TaskType?
    private var completion: CompletionType?
    
    private(set) public var error: Error?
    
    public var userInfo: [String: Any] = [:]
    
    public init(iterator: IteratorType, task: @escaping TaskType, completion: CompletionType?)
    {
        self.iterator = iterator
        self.task = task
        self.completion = completion
    }
    public convenience init<SequenceType: Sequence>(_ sequence: SequenceType, task: @escaping TaskType, completion: @escaping CompletionType)
        where SequenceType.Iterator == IteratorType
    {
        self.init(iterator: sequence.makeIterator(), task: task, completion: completion)
    }
    public convenience init<SequenceType: Sequence>(_ sequence: SequenceType, task: @escaping TaskType)
        where SequenceType.Iterator == IteratorType
    {
        self.init(iterator: sequence.makeIterator(), task: task, completion: nil)
    }

    public func next() {
        if let nextValue = iterator.next() {
            task?(nextValue, self)
        } else {
            completion?(self)
        }
    }
    
    public func terminate(error: Error) {
        self.error = error
        completion?(self)
    }
    
    public func onCompletion(_ completion: @escaping CompletionType) -> AsyncSeqeuntialTask {
        self.completion = completion
        return self
    }
    
    public func start() {
        self.next()
    }
}
