//
//  NCMBAddOperation.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/02
//

///*
// Copyright 2017-2018 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
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
//@interface NCMBAddOperation : NSObject
public class NCMBAddOperation: NSObject, NCMBOperation {
//
//@property (nonatomic,strong)NSMutableArray *objects;
    public var objects: [Any] = []
//
//- (NCMBAddOperation *)initWithClassName:(id)newValue;
//
//- (NSMutableDictionary *)encode;
//
//- (id)mergeWithPrevious:(id)previous;
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key;
//
//
//@end
///*
// Copyright 2017-2018 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
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
//
//#import "NCMBAddOperation.h"
//#import "NCMBDeleteOperation.h"
//#import "NCMBSetOperation.h"
//
//@implementation NCMBAddOperation
//
//
//- (NCMBAddOperation *)initWithClassName:(id)newValue{
    public init(newValue: Any) {
//    self = [super init];
        super.init()
//    if( self ) {
//        self.objects = [[NSMutableArray alloc]init];
//        //配列はそのまま代入。配列以外は追加。
//        if ([newValue isKindOfClass:[NSArray class]]) {
        if let newArray = newValue as? [Any] {
//            NSMutableArray *newArray = (NSMutableArray *)newValue;
//            self.objects = newArray;
            self.objects = newArray
//        }else{
        } else {
//            [self.objects addObject:newValue];
            self.objects.append(newValue)
//        }
        }
//    }
//    return self;
//}
    }
//
//-(NSMutableDictionary *)encode{
    public func encode() -> Any {
//    NSMutableDictionary *json = [[NSMutableDictionary alloc]init];
        let json: [String: Any] = [
//    [json setObject:@"Add" forKey:@"__op"];
            "__op": "Add",
//    [json setObject:self.objects forKey:@"objects"];
            "objects": self.objects
            ]
//    return json;
        return json
//}
    }
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key{
    public func apply(_ oldValue: Any?, ncmbObject object: NCMBObject?, for key: String?) -> Any? {
//    if (oldValue == nil) {
        guard let oldValue = oldValue else {
//        return self.objects;
            return self.objects
//    }
        }
//
//    //前回の値に今回追加する値を追加
//    if ([oldValue isKindOfClass:[NSArray class]]) {
        if let oldArray = oldValue as? [Any] {
//        NSMutableArray *newValue = [NSMutableArray array];
            var newValue: [Any] = []
//
//        //前回の値をすべてnewValueに追加
//        for(int i=0; i<[oldValue count]; i++){
            for i in oldArray.indices {
//            [newValue insertObject:[oldValue objectAtIndex:i] atIndex:i];
                newValue.insert(oldArray[i], at: i)
//        }
            }
//
//        //objects(今回追加する値)の要素をすべてnewValueの末尾に追加
//        for(int i=0; i<[self.objects count]; i++){
//            [newValue addObject:[self.objects objectAtIndex:i]];
//        }
            newValue.append(contentsOf: self.objects)
//        return newValue;
            return newValue
//    }
        }
//
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Operation is invalid after previous operation." userInfo:nil] raise];
        fatalError("Operation is invalid after previous operation.")
//    return nil;
//}
    }
//
//- (id)mergeWithPrevious:(id)previous{
    public func merge(previous: NCMBOperation?) -> NCMBOperation {
//    if (previous==nil) {
        guard let previous = previous else {
//        return self;
            return self
//    }
        }
//
//    if ([previous isKindOfClass:[NCMBDeleteOperation class]]) {
        if previous is NCMBDeleteOperation {
//        return [[NCMBSetOperation alloc]initWithClassName:self.objects];
            return NCMBSetOperation(newValue: self.objects)
//    }
        }
//
//    if ([previous isKindOfClass:[NCMBSetOperation class]]) {
        if let previousSet = previous as? NCMBSetOperation {
//        id oldValue = [((NCMBSetOperation *)previous) getValue];
            let oldValue = previousSet.getValue()
//        if ([oldValue isKindOfClass:[NSArray class]]) {
            if let oldArray = oldValue as? [Any] {
//            NSMutableArray *newValue = [NSMutableArray array];
//            //前回の値をすべてnewValueに追加
//            for(int i=0; i<[oldValue count]; i++){
//                [newValue insertObject:[oldValue objectAtIndex:i] atIndex:i];
//            }
                var newValue = oldArray
//
//            //objects(今回追加する値)の要素をすべてnewValueの末尾に追加
//            for(int i=0; i<[self.objects count]; i++){
//                [newValue addObject:[self.objects objectAtIndex:i]];
//            }
                newValue.append(contentsOf: self.objects)
//            return [[NCMBSetOperation alloc] initWithClassName:newValue];
                return NCMBSetOperation(newValue: newValue)
//        }
            }
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can only add an item to a List." userInfo:nil] raise];
            fatalError("You can only add an item to a List.")
//    }
        }
//
//    if ([previous isKindOfClass:[NCMBAddOperation class]]) {
        if let previousAdd = previous as? NCMBAddOperation {
//        //オペレーション(前回)の値をすべてnewValueに追加
//        NSMutableArray *newValue = [NSMutableArray array];
//        for(int i=0; i<[((NCMBAddOperation *)previous).objects count]; i++){
//            [newValue addObject:[((NCMBAddOperation *)previous).objects objectAtIndex:i]];
//        }
            var newValue = previousAdd.objects
//
//        //objects(今回追加する値)の要素をすべてnewValueの末尾に追加
//        for(int i=0; i<[self.objects count]; i++){
//            [newValue addObject:[self.objects objectAtIndex:i]];
//        }
            newValue.append(contentsOf: self.objects)
//        return [[NCMBAddOperation alloc] initWithClassName:newValue];
            return NCMBAddOperation(newValue: newValue)
//    }
        }
//
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Operation is invalid after previous operation." userInfo:nil] raise];
        fatalError("Operation is invalid after previous operation.")
//    return nil;
//}
    }
//@end
}
