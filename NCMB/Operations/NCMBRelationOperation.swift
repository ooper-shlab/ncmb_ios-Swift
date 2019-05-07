//
//  NCMBRelationOperation.swift
//  NCMB
//
//  Created by 開発 on 2019/05/02.
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
//@interface NCMBRelationOperation : NSObject
public class NCMBRelationOperation: NCMBOperation {
//
//@property (nonatomic,strong)NSString *tagetClass;
    public var tagetClass: String?
//@property (nonatomic,strong)NSMutableSet *relationToAdd;
    public var relationToAdd: Set<String>
//@property (nonatomic,strong)NSMutableSet *relationToRemove;
    public var relationToRemove: Set<String>
//
//
//- (id)init:(NSMutableSet *)newRelationsToAdd newRelationsToRemove:(NSMutableSet *)newRelationsToRemove;
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key;
//
//- (id)mergeWithPrevious:(id)previous;
//
//- (id)encode;
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
//#import "NCMBRelationOperation.h"
//#import "NCMBObject.h"
//#import "NCMBRelation.h"
//#import "NCMBDeleteOperation.h"
//#import "NCMBRelation+Private.h"
//
//@implementation NCMBRelationOperation
//
//- (id)init:(NSMutableSet *)newRelationsToAdd newRelationsToRemove:(NSMutableSet *)newRelationsToRemove{
    public init(_ newRelationsToAdd: Set<NCMBObject>?, newRelationsToRemove: Set<NCMBObject>?) {
//    self = [super init];
//    if( self ) {
//        //子のクラス名
//        self.tagetClass = nil;
//        //add対象のobjectID
//        self.relationToAdd = [NSMutableSet set];
        self.relationToAdd = []
//        //remove対象のobjectID
//        self.relationToRemove = [NSMutableSet set];
        self.relationToRemove = []
//
//        //add操作時
//        if (newRelationsToAdd != nil) {
        if let newRelationsToAdd = newRelationsToAdd {
//            for (NCMBObject *object in newRelationsToAdd) {
            for object in newRelationsToAdd {
//                //objectId判定
//                if ([object objectId] == nil) {
                if let objectId = object.objectId {
//                    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"must need object ids" userInfo:nil] raise];
                    self.relationToAdd.insert(objectId)
//                }else{
                } else {
//                    [self.relationToAdd addObject:[object objectId]];
                    fatalError("must need object ids")
//                }
                }
//                //対象のクラス判定
//                if (self.tagetClass == nil) {
                if self.tagetClass == nil {
//                    self.tagetClass = object.ncmbClassName;
                    self.tagetClass = object.ncmbClassName
//                }else{
                } else {
//                    NSString *str = [NSString stringWithFormat:@"relation class is %@",self.tagetClass];
                    let str = "relation class is \(self.tagetClass!)"
//                    [[NSException exceptionWithName:NSInternalInconsistencyException reason:str userInfo:nil] raise];
                    fatalError(str)
//                }
                }
//            }
            }
//        }
        }
//
//        //remove操作時
//        if (newRelationsToRemove != nil) {
        if let newRelationsToRemove = newRelationsToRemove {
//            for (NCMBObject *object in newRelationsToRemove) {
            for object in newRelationsToRemove {
//                //objectId判定
//                if ([object objectId] == nil) {
                if let objectId = object.objectId {
//                    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"must need object ids" userInfo:nil] raise];
                    self.relationToRemove.insert(objectId)
//                }else{
                } else {
//                    [self.relationToRemove addObject:[object objectId]];
                    fatalError("must need object ids")
//                }
                }
//                //対象のクラス判定
//                if (self.tagetClass == nil) {
                if self.tagetClass == nil {
//                    self.tagetClass = object.ncmbClassName;
                    self.tagetClass = object.ncmbClassName
//                }else{
                } else {
//                    NSString *str = [NSString stringWithFormat:@"relation class is %@",self.tagetClass];
                    let str = "relation class is \(self.tagetClass!)"
//                    [[NSException exceptionWithName:NSInternalInconsistencyException reason:str userInfo:nil] raise];
                    fatalError(str)
//                }
                }
//            }
            }
//        }
        }
//        if (self.tagetClass == nil) {
        if self.tagetClass == nil {
//            [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"All objects in a relation must be of the same class." userInfo:nil] raise];
            fatalError("All objects in a relation must be of the same class.")
//        }
        }
//
//    }
//    return self;
//}
    }
//
////merge用コンストラクタ
//- (id)initWithClassName:(NSString *)newTargetClass newRelationsToAdd:(NSMutableSet *)newRelationsToAdd newRelationsToRemove:(NSMutableSet *)newRelationsToRemove{
    private init(className newTargetClass: String?, newRelationsToAdd: Set<String>, newRelationsToRemove: Set<String>) {
//    self = [super init];
//    if( self ) {
//        //子のクラス名
//        self.tagetClass = newTargetClass;
        self.tagetClass = newTargetClass
//        //add対象のobjectID
//        self.relationToAdd = [NSMutableSet setWithSet:newRelationsToAdd];
        self.relationToAdd = newRelationsToAdd
//        //remove対象のobjectID
//        self.relationToRemove = [NSMutableSet setWithSet:newRelationsToRemove];
        self.relationToRemove = newRelationsToRemove
//    }
//    return self;
//}
    }
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key{
    public func apply(_ oldValue: Any?, ncmbObject object: NCMBObject?, for key: String?) -> Any? {
//    //relationクラスのparent(NCMBObject)とkeyとクラス名の更新
        guard let ncmbObject = object else {
            fatalError("object needs to be an NCMBObject")
        }
//    if (oldValue == nil || ([oldValue isKindOfClass:[NSArray class]] && [oldValue count] == 0)) {
        if oldValue == nil || oldValue! is [Any] && (oldValue as! [Any]).isEmpty {
//        NCMBRelation *relation = [[NCMBRelation alloc]initWithClassName:object key:key];
            let relation = NCMBRelation(parent: ncmbObject, key: key)
//        relation.targetClass = self.tagetClass;
            relation.targetClass = self.tagetClass
//        return relation;
            return relation
//    }
        }
//
//    //relationクラスのクラス名の更新
//    if ([oldValue isKindOfClass:[NCMBRelation class]]) {
        if let relation = oldValue as? NCMBRelation {
//        NCMBRelation *relation = oldValue;
//        //関連付けするオブジェクトのクラス判定
//        if (self.tagetClass != nil && [relation targetClass] != nil) {
            if self.tagetClass != nil && relation.targetClass != nil {
//            if (![[relation targetClass] isEqual:self.tagetClass]) {
                if relation.targetClass != self.tagetClass {
//                NSString * str = [NSString stringWithFormat:@"Related object object must be of class %@, but %@ esd passed in.",[relation targetClass],self.tagetClass];
                    let str = "Related object object must be of class \(relation.targetClass!), but \(self.tagetClass!) esd passed in."
//                [[NSException exceptionWithName:NSInternalInconsistencyException reason:str userInfo:nil] raise];
                    fatalError(str)
//            }
                }
//            relation.targetClass = self.tagetClass;
                relation.targetClass = self.tagetClass
//        }
            }
//        return relation;
            return relation
//    }
        }
//
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Operation is invalid after previous operation." userInfo:nil] raise];
//    return nil;
        fatalError("Operation is invalid after previous operation.")
//}
    }
//
////encode実行時の__opとobjectsのオペレーション作成
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
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can't modify a relation after deleting it." userInfo:nil] raise];
            fatalError("You can't modify a relation after deleting it.")
//    }
        }
//
//    if ([previous isKindOfClass:[NCMBRelationOperation class]]) {
        if let previousOperation = previous as? NCMBRelationOperation {
//        NCMBRelationOperation *previousOperation = previous;
//        if ([previousOperation tagetClass] != nil && ![[previousOperation tagetClass] isEqual:self.tagetClass]) {
            if let targetClass = previousOperation.tagetClass, targetClass != self.tagetClass {
//            NSString * str = [NSString stringWithFormat:@"Related object object must be of class %@, but %@ esd passed in.",[previousOperation tagetClass],self.tagetClass];
                let str = "Related object object must be of class \(targetClass), but \(self.tagetClass ?? "nil") esd passed in."
//            [[NSException exceptionWithName:NSInternalInconsistencyException reason:str userInfo:nil] raise];
                fatalError(str)
//        }
            }
//
//        NSMutableSet *newRelationsToAdd = [NSMutableSet setWithSet:[previousOperation relationToAdd]];
            var newRelationsToAdd = previousOperation.relationToAdd
//        NSMutableSet *newRelationsToRemove = [NSMutableSet setWithSet:[previousOperation relationToRemove]];
            var newRelationsToRemove = previousOperation.relationToRemove
//
//        //addデータ操作時 addするobjectIdをすべて追加する
//        if (self.relationToAdd != nil) {
            if !self.relationToAdd.isEmpty {
//            NSMutableSet *SelfRelationsToAdd = [NSMutableSet setWithSet:self.relationToAdd];
//            for (NSString *str in SelfRelationsToAdd) {
//                [newRelationsToAdd addObject:str];
//            }
                newRelationsToAdd.formUnion(self.relationToAdd)
//
//            for (NSString *str in self.relationToAdd) {
//                [newRelationsToRemove removeObject:str];
//            }
                newRelationsToRemove.subtract(self.relationToAdd)
//        }
            }
//
//        //removeデータ操作時 removeするobjectIdをすべて追加する
//        if (self.relationToRemove != nil) {
            if !self.relationToRemove.isEmpty {
//            for (NSString *str in self.relationToRemove) {
//                [newRelationsToAdd removeObject:str];
//            }
                newRelationsToAdd.subtract(self.relationToRemove)
//            NSMutableSet *SelfRelationsToRemove = [NSMutableSet setWithSet:self.relationToRemove];
//            for (NSString *str in SelfRelationsToRemove) {
//                [newRelationsToRemove addObject:str];
//            }
                newRelationsToRemove.subtract(self.relationToRemove)
//
//        }
            }
//        return [[NCMBRelationOperation alloc]initWithClassName:self.tagetClass newRelationsToAdd:newRelationsToAdd newRelationsToRemove:newRelationsToRemove];
            return NCMBRelationOperation(className: self.tagetClass, newRelationsToAdd: newRelationsToAdd, newRelationsToRemove: newRelationsToRemove)
//    }
        }
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@ userInfo:nil] raise];
        fatalError("Operation is invalid after previous operation.")
//    return nil;
//}
    }
//
//-(id)encode{
    public func encode() -> Any {
//    NSMutableDictionary *addJson = nil;
        var addJson: [String: Any]? = nil
//    NSMutableDictionary *removeJson = nil;
        var removeJson: [String: Any]? = nil
//
//    if ([self.relationToAdd count]>0) {
        if !self.relationToAdd.isEmpty {
//        addJson = [[NSMutableDictionary alloc]init];
            addJson = [
//        [addJson setObject:@"AddRelation" forKey:@"__op"];
                "__op": "AddRelation",
//        [addJson setObject:[self convertSetToArray:self.relationToAdd] forKey:@"objects"];
                "objects": self.convertSetToArray(self.relationToAdd)
            ]
//    }
        }
//
//    if ([self.relationToRemove count]>0) {
        if !self.relationToRemove.isEmpty {
//        removeJson = [[NSMutableDictionary alloc]init];
            removeJson = [
//        [removeJson setObject:@"RemoveRelation" forKey:@"__op"];
                "__op": "RemoveRelation",
//        [removeJson setObject:[self convertSetToArray:self.relationToRemove] forKey:@"objects"];
                "objects": self.convertSetToArray(self.relationToRemove)
            ]
//    }
        }
//
//    if (addJson != nil) {
        if let json = addJson {
//        return addJson;
            return json
//    }
        }
//
//    if (removeJson != nil) {
        if let json = removeJson {
//        return removeJson;
            return json
//    }
        }
//
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"A NCMBRelationOperation was created without any data." userInfo:nil] raise];
//    return nil;
        fatalError("A NCMBRelationOperation was created without any data.")
//}
    }
//
////encodeメソッド内で使用。キー(objects)の値を作成
//-(NSMutableArray *)convertSetToArray:(NSMutableSet*)set{
    private func convertSetToArray(_ set: Set<String>) -> [Any] {
//    NSMutableArray *convertArray = [[NSMutableArray alloc]init];
        var convertArray: [Any] = []
//    for (NSString *objectId in set) {
        for objectId in set {
//        NSMutableDictionary *pointer = [[NSMutableDictionary alloc]init];
            let pointer: [String: Any] = [
//        [pointer setObject:@"Pointer" forKey:@"__type"];
                "__type": "Pointer",
//        [pointer setObject:self.tagetClass forKey:@"className"];
                "className": self.tagetClass as Any,
//        [pointer setObject:objectId forKey:@"objectId"];
                "objectId": objectId
            ]
//        [convertArray addObject:pointer];
            convertArray.append(pointer)
//    }
        }
//    return convertArray;
        return convertArray
//}
    }
//
//@end
}
