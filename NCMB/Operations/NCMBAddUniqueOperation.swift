//
//  NCMBAddUniqueOperation.swift
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
//@interface NCMBAddUniqueOperation : NSObject
public class NCMBAddUniqueOperation: NSObject, NCMBOperation {
//
//@property (nonatomic,strong)NSMutableArray *objects;
    public var objects: [Any] = []
//
//- (NCMBAddUniqueOperation *)initWithClassName:(id)newValue;
//
//- (NSMutableDictionary *)encode;
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key;
//
//- (id)mergeWithPrevious:(id)previous;
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
//#import "NCMBAddUniqueOperation.h"
//#import "NCMBObject.h"
//#import "NCMBDeleteOperation.h"
//#import "NCMBSetOperation.h"
//
//@implementation NCMBAddUniqueOperation
//
//- (NCMBAddUniqueOperation *)initWithClassName:(id)newValue{
    public init(newValue: Any) {
//    self = [super init];
        super.init()
//    if( self ) {
//        self.objects =  [NSMutableArray array];
//        if ([newValue isKindOfClass:[NSArray class]]) {
        if let array = newValue as? [Any] {
//            NSMutableArray *newArray = (NSMutableArray *)newValue;
//            [self.objects addObjectsFromArray:newArray];
            self.objects = array
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
//    [json setObject:@"AddUnique" forKey:@"__op"];
            "__op": "AddUnique",
//    [json setObject:self.objects forKey:@"objects"];
            "objects": self.objects]
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
        guard let objects = self.objects as? [AnyHashable] else {
            fatalError("self.objects has invalid data")
        }
//    if ([oldValue isKindOfClass:[NSArray class]]) {
        if let array = oldValue as? [AnyHashable] {
//        NSMutableArray *newValue = [NSMutableArray array];
//        //oldValueの要素をすべてnewValueに挿入
//        for(int i=0; i<[oldValue count]; i++){
//            [newValue insertObject:[oldValue objectAtIndex:i] atIndex:i];
//        }
            var newValue = array
//
//        /** 以下NCMBObjectの重複処理　ObjectIdが同じものは上書き　違うものは末尾に追加*/
//
//        //前回のオブジェクトのobjectIDを保管する。key:各objectID　value:NSNumber
//        NSMutableDictionary *existingObjectIds = [NSMutableDictionary dictionary];
            var existingObjectIds: [AnyHashable: Int] = [:]
//        for(int i=0; i<[newValue count]; i++){
            for i in newValue.indices {
//            //前回のオブジェクトからNCMBObjectがあるか検索
//            if ([[newValue objectAtIndex:i] isKindOfClass:[NCMBObject class]]) {
                if let ncmbObject = newValue[i] as? NCMBObject {
//                //NCMBObjectがあればkeyにobjectID、valueにNSNumber追加
//                if([((NCMBObject *)[newValue objectAtIndex:i]) objectId]){
                    if let objectId = ncmbObject.objectId {
//                    [existingObjectIds setObject:[NSNumber numberWithInt:i] forKey:[((NCMBObject *)[newValue objectAtIndex:i]) objectId]];
                        existingObjectIds[objectId] = i
//                }else{
                    } else {
//                    [existingObjectIds setObject:[NSNumber numberWithInt:i] forKey:[NSNull null]];
                        existingObjectIds[NSNull()] = i
//                }
                    }
//            }
                }
//        }
            }
//
//        NSEnumerator* localEnumerator = [self.objects objectEnumerator];
//        id NCMBObj;
//        while (NCMBObj = [localEnumerator nextObject]) {
            for object in objects {
//            if ([NCMBObj isKindOfClass:[NCMBObject class]]){
                if let ncmbObj = object as? NCMBObject {
//                //objectsのobjectIdと先ほど生成したexistingObjectIdsのobjectIdが一致した場合、existingObjectIdsのvalue:NSNumberを返す。なければnilを返す。
//                NSNumber *index = [existingObjectIds objectForKey:[NCMBObj objectId]];
                    if let index = existingObjectIds[ncmbObj.objectId as AnyHashable? ?? NSNull() as AnyHashable] {
//                if (index != nil) {
//                    [newValue insertObject:NCMBObj atIndex:[index intValue]];//一致した場所にオブジェクト追加
                        newValue.insert(ncmbObj, at: index)
//                }
//                else{
                    } else {
//                    [newValue addObject:NCMBObj];//一致しなかった場合は末に追加
                        newValue.append(ncmbObj)
//                }
                    }
//            }
//            else if (![newValue containsObject:NCMBObj]){
                } else if !newValue.contains(object) {
//                [newValue addObject:NCMBObj];//NCMBObjectではなかった場合は末に追加
                    newValue.append(object)
//            }
                }
//        }
            }
//
//        return newValue;
            return newValue.map{$0.base}
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
//        return [[NCMBSetOperation alloc]initWithClassName:self.objects];
            return NCMBSetOperation(newValue: self.objects)
//    }
        }
//
//    if ([previous isKindOfClass:[NCMBSetOperation class]]) {
        if let previousSet = previous as? NCMBSetOperation {
//        id oldValue = [((NCMBSetOperation *)previous) getValue];
            let oldValue = previousSet.getValue()
//
//        if ([oldValue isKindOfClass:[NSArray class]]) {
            if oldValue is [Any] {
//            //apply結果を元にインスタンス生成
//            return [[NCMBSetOperation alloc] initWithClassName:[self apply:oldValue NCMBObject:nil forkey:nil]];
                return NCMBSetOperation(newValue: self.apply(oldValue, ncmbObject: nil, for: nil)!)
//        }
            }
//
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can only add an item to a List." userInfo:nil] raise];
            fatalError("You can only add an item to a List.")
//    }
        }
//
//    if ([previous isKindOfClass:[NCMBAddUniqueOperation class]]) {
        if let previousAddU = previous as? NCMBAddUniqueOperation {
//        //オペレーション要素全てをresultに挿入(初期化)
//        NSArray *oldValue = ((NCMBAddUniqueOperation *)previous).objects;
            let oldValue = previousAddU.objects
//        //オペレーション要素に対してapply実行
//        NSMutableArray * newValue = [self apply:oldValue NCMBObject:nil forkey:nil];
            let newValue = self.apply(oldValue, ncmbObject: nil, for: nil)
//        //apply結果を元にインスタンスの生成
//        return [[NCMBAddUniqueOperation alloc] initWithClassName:newValue];
            return NCMBAddUniqueOperation(newValue: newValue!)
//    }
        }
//
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can only add an item to a List." userInfo:nil] raise];
        fatalError("You can only add an item to a List.")
//    return nil;
//}
    }
//
//@end
}
