//
//  NCMBRelation.swift
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
//@class NCMBObject;
//@class NCMBQuery;
//
///**
// NCMBRelationは、オブジェクトの関係を管理するクラスです。
// */
//@interface NCMBRelation : NSObject
public class NCMBRelation: NSObject {
//
/////リレーションを格納している親オブジェクト
//@property(nonatomic) NCMBObject *parent;
    public var parent: NCMBObject? //### NO retain cycle?
//
/////リレーションを格納している親オブジェクトのキー
//@property(nonatomic) NSString *key;
    public var key: String?
//
/////リレーション先のクラス名
//@property(nonatomic) NSString *targetClass;
    public var targetClass: String?
//
///**
// リレーションで示されたオブジェクトのクラス名を指定してクエリを生成
// */
//- (NCMBQuery *)query;
//
///**
// Relation初期化用
// @param parent リレーション元のオブジェクト
// @param key リレーションを作成するキー
// */
//- (id)initWithClassName:(NCMBObject *)parent key:(NSString *)key;
//
///**
// 指定されたクラス名を設定したNCMBRelationのインスタンスを返却する
// @param className リレーション先のクラス名
// */
//- (id)initWithClassName:(NSString *)className;
//
///**
// リレーションに指定したオブジェクトを追加
// @param object 指定するオブジェクト
// */
//- (void)addObject:(NCMBObject *)object;
//
///**
// リレーションから指定したオブジェクトを削除
// @param object 指定するオブジェクト
// */
//- (void)removeObject:(NCMBObject *)object;
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
//#import "NCMBRelation.h"
//#import "NCMBRelationOperation.h"
//#import "NCMBObject.h"
//#import "NCMBObject+Private.h"
//#import "NCMBQuery.h"
//
//@implementation NCMBRelation
//
//-(id)init{
//    self = [super init];
//    if (self) {
//        self.parent = nil;
//        self.key = nil;
//        self.targetClass = nil;
//    }
//    return self;
//}
//
////Relation初期化用
//- (id)initWithClassName:(NCMBObject *)parentObj key:(NSString *)forKey{
    public init(parent parentObj: NCMBObject, key forKey: String?) {
//    self = [super init];
//    if (self) {
//        self.parent = parentObj;
        self.parent = parentObj
//        self.key = forKey;
        self.key = forKey
//        self.targetClass = nil;
        self.targetClass = nil
        super.init()
//    }
//    return self;
//}
    }
//
///**
// 指定されたクラス名を設定したNCMBRelationのインスタンスを返却する
// @param className リレーション先のクラス名
// */
//- (id)initWithClassName:(NSString *)className{
    public init(className: String) {
//    self = [super init];
//    if (self) {
//        self.parent = nil;
        self.parent = nil
//        self.key = nil;
        self.key = nil
//        self.targetClass = className;
        self.targetClass = className
        super.init()
//    }
//    return self;
//}
    }
//
////リレーションの検索
//- (NCMBQuery *)query{
    public func query() -> NCMBQuery {
//    NCMBQuery *query = [NCMBQuery queryWithClassName:_targetClass];
        let query = NCMBQuery(className: targetClass!)
//    [query relatedTo:_parent.ncmbClassName objectId:_parent.objectId key:_key];
        query.related(to: parent?.ncmbClassName, objectId: parent?.objectId, key: key)
//    return query;
        return query
//    //return nil;
//}
    }
//
////リレーションの追加
//- (void)addObject:(NCMBObject *)object{
//    [self addDuplicationCheck:object];
//    NSMutableSet * addObject = [NSMutableSet set];
//    [addObject addObject:object];
//    NCMBRelationOperation *operation = [[NCMBRelationOperation alloc]init:addObject newRelationsToRemove:nil];
//    self.targetClass = operation.tagetClass;
//    [self.parent performOperation:self.key byOperation:operation];
//}
//
//
////リレーションの削除
//- (void)removeObject:(NCMBObject *)object{
//    [self removeDuplicationCheck:object];
//    NSMutableSet *removeObject = [NSMutableSet set];
//    [removeObject addObject:object];
//    NCMBRelationOperation *operation = [[NCMBRelationOperation alloc]init:nil newRelationsToRemove:removeObject];
//    self.targetClass = operation.tagetClass;
//    [self.parent performOperation:self.key byOperation:operation];
//}
//
////前回Addしたオブジェクトと重複しなければエラー
//-(void)addDuplicationCheck:(NCMBObject *)object{
//    id value = [[self.parent currentOperations] objectForKey:self.key];
//    if(value && [value isKindOfClass:[NCMBRelationOperation class]]){
//        NCMBRelationOperation *relationOperation = (NCMBRelationOperation *)value;
//        if(relationOperation.relationToRemove.count > 0){
//            BOOL deplication = false;
//            for (id objectId in relationOperation.relationToRemove){
//                if(objectId == object.objectId){
//                    deplication = true;
//                }
//            }
//            if(!deplication){
//                    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Add objects in a Remove Must be the same. Call SaveAsync() to send the data." userInfo:nil] raise];
//            }
//        }
//    }
//}
//
////前回Removeしたオブジェクトと重複しなければエラー
//-(void)removeDuplicationCheck:(NCMBObject *)object{
//    id value = [[self.parent currentOperations] objectForKey:self.key];
//    if(value && [value isKindOfClass:[NCMBRelationOperation class]]){
//        NCMBRelationOperation *relationOperation = (NCMBRelationOperation *)value;
//        if(relationOperation.relationToAdd.count > 0){
//            BOOL deplication = false;
//            for (id objectId in relationOperation.relationToAdd){
//                if(objectId == object.objectId){
//                    deplication = true;
//                }
//            }
//            if(!deplication){
//                [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Remove objects in a Add Must be the same. Call SaveAsync() to send the data." userInfo:nil] raise];
//            }
//
//        }
//    }
//}
//
////get時の判定
//-(void)ensureParentAndKey:(NCMBObject *)someParent key:(NSString *)someKey{
//    if(self.parent == nil){
//        self.parent = someParent;
//    }
//    if(self.key == nil){
//        self.key = someKey;
//    }
//    if(self.parent != someParent){
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Internal error. One NCMBRelation retrieved from two different NCMBObjects." userInfo:nil] raise];
//    }
//    if(self.key == someKey){
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Internal error. One NCMBRelation retrieved from two different Keys." userInfo:nil] raise];
//    }
//}
//
//-(NSMutableDictionary *)encodeToJson{
//    NSMutableDictionary *json = [[NSMutableDictionary alloc]init];
//    [json setObject:@"__type" forKey:@"Relation"];
//    [json setObject:@"className" forKey:self.targetClass];
//    return json;
//}
//
//@end
//
}
