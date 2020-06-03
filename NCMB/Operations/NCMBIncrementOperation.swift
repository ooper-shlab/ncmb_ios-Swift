//
//  NCMBIncrementOperation.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/02
//

///*
// Copyright 2017-2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// */
//
//#import <Foundation/Foundation.h>
import Foundation
//
//@interface NCMBIncrementOperation : NSObject
public class NCMBIncrementOperation: NSObject, NCMBOperation {
//
//@property (nonatomic,strong) NSNumber *amount;
    public var amount: NSNumber
//
//- (NCMBIncrementOperation *)initWithClassName:(NSNumber *)newAmount;
//
//- (NSMutableDictionary *)encode;
//
//- (NSNumber *)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key;
//
//- (id)mergeWithPrevious:(id)previous;
//
//
//@end
///*
// Copyright 2017-2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// */
//
//#import "NCMBIncrementOperation.h"
//#import "NCMBDeleteOperation.h"
//#import "NCMBSetOperation.h"
//
//@implementation NCMBIncrementOperation
//
//- (NCMBIncrementOperation *)initWithClassName:(NSNumber *)newAmount{
    public init(byAmount: Any) {
//    self = [super init];
//    if( self ) {
//        self.amount = newAmount;
        self.amount = byAmount as? NSNumber ?? NSNumber(value: 0)
//    }
//    return self;
//}
    }
//
//-(NSMutableDictionary *)encode{
    public func encode() -> Any {
//    NSMutableDictionary *json = [[NSMutableDictionary alloc]init];
        let json: [String: Any] = [
//    [json setObject:@"Increment" forKey:@"__op"];
            "__op": "Increment",
//    [json setObject:self.amount forKey:@"amount"];
            "amount": self.amount]
//    return json;
        return json
//}
    }
//
//-(NSNumber *)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key{
    public func apply(_ oldValue: Any?, ncmbObject object: NCMBObject?, for key: String?) -> Any? {
//
//    if(oldValue == nil){
        guard let oldValue = oldValue else {
//        return self.amount;
            return self.amount
//    }
        }
//
//    if([oldValue isKindOfClass:[NSNumber class]]){
        if let number = oldValue as? NSNumber {
//        float newValue = [oldValue floatValue] + [self.amount floatValue];
            let newValue = number.floatValue + self.amount.floatValue //### Why `floatValue`?
//        return [NSNumber numberWithFloat:newValue];
            return NSNumber(value: newValue)
//    }
        }
//
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"You cannot increment a non-number." userInfo:nil] raise];
        fatalError("You cannot increment a non-number.")
//    return nil;
//}
    }
//
//
//
//- (id)mergeWithPrevious:(id)previous{
    public func merge(previous: NCMBOperation?) -> NCMBOperation {
//
//    if (previous==nil) {
        guard let previous = previous else {
//        return self;
            return self
//    }
        }
//
//
//    if ([previous isKindOfClass:[NCMBDeleteOperation class]]) {
        if previous is NCMBDeleteOperation {
//        return [[NCMBSetOperation alloc]initWithClassName:self.amount];
            return NCMBSetOperation(newValue: self.amount)
//    }
        }
//
//
//    if ([previous isKindOfClass:[NCMBSetOperation class]]) {
        if let previousSet = previous as? NCMBSetOperation {
//        id oldValue = [((NCMBSetOperation *)previous) getValue];
            let oldValue = previousSet.getValue()
//
//        if ([oldValue isKindOfClass:[NSNumber class]]) {
            if let number = oldValue as? NSNumber {
//            float newValue = [oldValue floatValue] + [self.amount floatValue];
                let newValue = number.floatValue + self.amount.floatValue //### Why float?
//            return [[NCMBSetOperation alloc] initWithClassName:[NSNumber numberWithFloat:newValue]];
                return NCMBSetOperation(newValue: newValue as NSNumber)
//        }
            }
//
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"You cannot increment a non-number." userInfo:nil] raise];
            fatalError("You cannot increment a non-number.")
//    }
        }
//
//    if ([previous isKindOfClass:[NCMBIncrementOperation class]]) {
        if let previousIncr = previous as? NCMBIncrementOperation {
//        NSNumber *oldAmount = ((NCMBIncrementOperation *)previous).amount;
            let oldAmount = previousIncr.amount
//        float newValue = [oldAmount floatValue] + [self.amount floatValue];
            let newValue = oldAmount.floatValue + self.amount.floatValue //### Why float?
//        return [[NCMBIncrementOperation alloc] initWithClassName:[NSNumber numberWithFloat:newValue]];
            return NCMBIncrementOperation(byAmount: newValue as NSNumber)
//    }
        }
//
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Operation is invalid after previous operation." userInfo:nil] raise];
        fatalError("Operation is invalid after previous operation.")
//    return nil;
//}
    }
//
//
//@end
}
