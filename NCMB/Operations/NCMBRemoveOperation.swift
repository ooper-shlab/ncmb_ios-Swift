//
//  NCMBRemoveOperation.swift
//  NCMB
//
//  Created by 開発 on 2019/05/01.
//  Copyright © 2019 OOPer's. All rights reserved.
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
//@interface NCMBRemoveOperation : NSObject
public class NCMBRemoveOperation: NCMBOperation {
//
//@property (nonatomic,strong)NSMutableSet *objects;
    public var objects: Set<AnyHashable> = []
//
//- (NCMBRemoveOperation *)initWithClassName:(id)newValue;
//
//- (NSMutableDictionary *)encode;
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key;
//
//- (id)mergeWithPrevious:(id)previous;
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
//#import "NCMBRemoveOperation.h"
//#import "NCMBDeleteOperation.h"
//#import "NCMBSetOperation.h"
//#import "NCMBObject.h"
//
//@implementation NCMBRemoveOperation
//
//- (NCMBRemoveOperation *)initWithClassName:(id)newValue{
    public init(className newValue: Any) {
//    self = [super init];
//    if( self ) {
//        self.objects =  [NSMutableSet set];
//        if ([newValue isKindOfClass:[NSArray class]]) {
        if let array = newValue as? [AnyHashable] {
//            NSMutableArray *newArray = (NSMutableArray *)newValue;
//            [self.objects addObjectsFromArray:newArray];
            self.objects.formUnion(array)
//        }else{
        } else {
//            self.objects = [NSMutableSet setWithSet:newValue];
            self.objects = newValue as! Set
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
        var json: [AnyHashable: Any] = [:]
//    [json setObject:@"Remove" forKey:@"__op"];
        json["__op"] = "Remove"
//    NSArray *objects = [self.objects allObjects];//NSSetの全ての要素をNSArray型で取得する
        let objects = Array(self.objects)
//    [json setObject:objects forKey:@"objects"];
        json["objects"] = objects
//    return json;
        return json
//}
    }
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key{
    public func apply(_ oldValue: Any?, ncmbObject object: NCMBObject?, for key: String?) -> Any? {
//
//    if (oldValue == nil) {
        guard let oldValue = oldValue else {
//        return [NSMutableArray array];
            return [Any]()
//    }
        }
//
//    if ([oldValue isKindOfClass:[NSArray class]]) {
        if let array = oldValue as? [AnyHashable] {
//        //前回のキー要素から今回指定したobjectsの値削除
//        NSMutableArray *newValue = [NSMutableArray array];
//        [newValue setArray:oldValue];
            var newValue = array
//        NSArray *removedList = [self.objects allObjects];
            let removedSet = self.objects
//        [newValue removeObjectsInArray:removedList];
            newValue.removeAll{removedSet.contains($0)}
//
//        /** 以下NCMBObjectの重複処理　ObjectIdが同じものを配列から削除*/
//        NSMutableArray *objectsToBeRemoved = [NSMutableArray array];//remove対象のobject格納
            var objectsToBeRemoved: [AnyHashable] = []
//        NSArray *objectsToBeRemovedList = [[NSArray alloc]init];//remove対象のobject格納
//        NSMutableSet *objectIds = [NSMutableSet set];//remove対象(NCMBObject)のobjectId格納
            var objectIds: Set<String> = []
//
//        //NSSetからNSArrayに変換。NSArrayからNSMutableArrayに変換
//        objectsToBeRemovedList = [self.objects allObjects];
//        [objectsToBeRemoved addObjectsFromArray:objectsToBeRemovedList];
            objectsToBeRemoved.append(contentsOf: self.objects)
            
//
//        //今回指定したobjectsからnewValueの値削除
//        [objectsToBeRemoved removeObjectsInArray:newValue];
            objectsToBeRemoved.removeAll{newValue.contains($0)}
//
//        //削除対象(NCMBOBject)のobjectIdを取得
//        NSEnumerator *localEnumerator = [objectsToBeRemoved objectEnumerator];//
//        id removeNCMBObject;
//        while (removeNCMBObject = [localEnumerator nextObject]) {
            for case let removeNCMBObject as NCMBObject in objectsToBeRemoved where removeNCMBObject.objectId != nil {
//            if ([removeNCMBObject isKindOfClass:[NCMBObject class]]){
//                [objectIds addObject:[removeNCMBObject objectId]];
                objectIds.insert(removeNCMBObject.objectId!)
//            }
//        }
            }
//
//        //取得したobjectIdと同じNCMBObjectを削除
//        id NCMBObj;
//        for(int i=0; i<[newValue count]; i++){
//            NCMBObj = [newValue objectAtIndex:i];
//            if ([NCMBObj isKindOfClass:[NCMBObject class]] && [objectIds containsObject:[NCMBObj objectId]]){
//                [newValue removeObjectAtIndex:i];
//            }
//        }
            newValue.removeAll {
                if let ncmbOjb = $0 as? NCMBObject, let objectId = ncmbOjb.objectId {
                    return objectIds.contains(objectId)
                } else {
                    return false
                }
            }
//        return newValue;
            return newValue.map{$0.base}
//    }
        }
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Operation is invalid after previous operation." userInfo:nil] raise];
//    return nil;
        fatalError("Operation is invalid after previous operation.")
//}
    }
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
//    if ([previous isKindOfClass:[NCMBDeleteOperation class]]) {
        if previous is NCMBDeleteOperation {
//        return [[NCMBSetOperation alloc]initWithClassName:[NSMutableArray array]];
            return NCMBSetOperation(newValue: [] as [Any])
//    }
        }
//
//    if ([previous isKindOfClass:[NCMBSetOperation class]]) {
        if let previsouSet = previous as? NCMBSetOperation {
//        id Value = [((NCMBSetOperation *)previous) getValue];
            let value = previsouSet.getValue()
//        if ([Value isKindOfClass:[NSArray class]]) {
            if let array = value as? [Any] {
//            //apply結果を元にインスタンス生成
//            return [[NCMBSetOperation alloc] initWithClassName:[self apply:Value NCMBObject:nil forkey:nil]];
                return NCMBSetOperation(newValue: self.apply(array, ncmbObject: nil, for: nil)!)
//        }
            }
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can only add an item to a List." userInfo:nil] raise];
            fatalError("You can only add an item to a List.")
//    }
        }
//    if ([previous isKindOfClass:[NCMBRemoveOperation class]]) {
        if let previousRem = previous as? NCMBRemoveOperation {
//        //前回の値をresultに代入
//        NSMutableSet *newValue = [NSMutableSet setWithSet:((NCMBRemoveOperation *)previous).objects];
            var newValue = previousRem.objects
//        //今回引数の値(remove対象)をresultに代入
//        for (id obj in self.objects) {
//            [newValue addObject:obj];
//        }
            newValue.formUnion(self.objects)
//        return [[NCMBRemoveOperation alloc] initWithClassName:newValue];
            return NCMBRemoveOperation(className: newValue)
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
