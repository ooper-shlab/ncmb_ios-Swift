//
//  NCMBQuery.swift
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
//
//#import <Foundation/Foundation.h>
import Foundation
//
//#import "NCMBConstants.h"
//
//@class NCMBObject;
//@class NCMBUser;
//@class NCMBGeoPoint;
//
///**
// NCMBQueryは、mobile backend上のデータを検索するためのクラスです。
// */
//@interface NCMBQuery : NSObject
public class NCMBQuery {
//
/////検索を行うデータストアのクラス名
//@property (nonatomic)NSString *ncmbClassName;
    public var ncmbClassName: String
//
/////検索結果の件数
//@property (nonatomic)int limit;
    public var limit: Int = 0
//
/////検索結果のスキップ数
//@property (nonatomic)int skip;
    public var skip: Int = 0
//
/////検索結果に子オブジェクトを含める場合の親データのキー
//@property (nonatomic)NSString *includeKey;
    public var includedKey: String? = nil
//
///** @name Initialize */
//
///**
// クラス名を指定してクエリを作成する
// @param className 指定するクラス名
// @return NCMBQueryのインスタンス
// */
//+ (NCMBQuery*)queryWithClassName:(NSString*)className;
//
//#pragma mark - Query configuration
//
///** @name Configuration */
//
///**
// 子の情報も含めて親情報を取得。クエリに設定された検索条件で取得できるオブジェクトに加えて、各オブジェクトに格納された、キー（引数）のオブジェクトの情報も取得する。
// @param key 取得するキー
// */
//- (void)includeKey:(NSString *)key;
//
///**
// 「指定したキーの値が存在するオブジェクトを検索する」という検索条件を設定
// @param key 検索条件に使用するキー
// */
//- (void)whereKeyExists:(NSString *)key;
//
///**
// 「指定したキーの値が存在しないオブジェクトを検索する」という検索条件を設定
// @param key 検索条件に使用するキー
// */
//- (void)whereKeyDoesNotExist:(NSString *)key;
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)と等しいものを検索する」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値(オブジェクト)
// */
//- (void)whereKey:(NSString *)key equalTo:(id)object;
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)の値より小さいものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値(オブジェクト)
// */
//- (void)whereKey:(NSString *)key lessThan:(id)object;
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)の値以下のものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値(オブジェクト)
// */
//- (void)whereKey:(NSString *)key lessThanOrEqualTo:(id)object;
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)の値より大きいものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値(オブジェクト)
// */
//- (void)whereKey:(NSString *)key greaterThan:(id)object;
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)の値以上のものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値(オブジェクト)
// */
//- (void)whereKey:(NSString *)key greaterThanOrEqualTo:(id)object;
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)と等しくないものを検索する」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値(オブジェクト)
// */
//- (void)whereKey:(NSString *)key notEqualTo:(id)object;
//
///**
// 「指定したキーの値が指定した配列の値のうちいずれか１つと一致するものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param array 検索条件に使用する配列
// */
//- (void)whereKey:(NSString *)key containedIn:(NSArray *)array;
//
///**
// 「指定したキーに設定された配列の値と、指定した配列の値が１つ以上一致するものを検索」という検索条件を設定
// @param key 検索条件に使用するキー（指定したキーの値が配列）
// @param array 検索条件に使用する配列
// */
//- (void)whereKey:(NSString *)key containedInArrayTo:(NSArray *)array;
//
///**
// 「指定したキーの値が指定した配列の値のいずれとも一致しないものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param array 検索条件に使用する配列
// */
//- (void)whereKey:(NSString *)key notContainedIn:(NSArray *)array;
//
///**
// 「指定したキーに設定された配列の値と、指定した配列の値が１つも一致しないものを検索」という検索条件を設定
// @param key 検索条件に使用するキー（指定したキーの値が配列）
// @param array 検索条件に使用する配列
// */
//- (void)whereKey:(NSString *)key notContainedInArrayTo:(NSArray *)array;
//
///**
// 「指定したキーの値に対して、指定した配列の値が全て含まれるものを検索」という検索条件を設定。
// 指定した配列の値が全て含まれている場合は、指定したキーの値の中に一致しないものが含まれている場合でも検索される
// @param key 検索条件に使用するキー（指定したキーの値が配列）
// @param array 検索条件に使用する配列
// */
//- (void)whereKey:(NSString *)key containsAllObjectsInArrayTo:(NSArray *)array;
//
///**
// 指定位置から近い順にオブジェクトを取得。
// 取得件数はlimit依存。
// @param key 検索条件に使用するキー
// @param geoPoint 位置情報
// */
//- (void)whereKey:(NSString *)key nearGeoPoint:(NCMBGeoPoint *)geoPoint;
//
///**
// 指定位置から近い順に、指定距離までの範囲に含まれるオブジェクトを取得。
// 取得件数はlimit依存。
// @param key 検索条件に使用するキー
// @param geoPoint 位置情報
// @param maxDistance 検索範囲
// */
//- (void)whereKey:(NSString *)key nearGeoPoint:(NCMBGeoPoint *)geoPoint withinMiles:(double)maxDistance;
//
///**
// 指定位置から近い順に、指定距離までの範囲に含まれるオブジェクトを取得。
// 取得件数はlimit依存。
// @param key 検索条件に使用するキー
// @param geoPoint 位置情報
// @param maxDistance 検索範囲
// */
//- (void)whereKey:(NSString *)key nearGeoPoint:(NCMBGeoPoint *)geoPoint withinKilometers:(double)maxDistance;
//
///**
// 指定位置から近い順に、指定距離までの範囲に含まれるオブジェクトを取得。
// 取得件数はlimit依存。
// @param key 検索条件に使用するキー
// @param geoPoint 位置情報
// @param maxDistance 検索範囲
// */
//- (void)whereKey:(NSString *)key nearGeoPoint:(NCMBGeoPoint *)geoPoint withinRadians:(double)maxDistance;
//
///**
// 指定された短形範囲に含まれるオブジェクトを取得。
// 短形は、左下（南西）と右上（北東）を指定する。
// ソートは通常検索に準拠。
// 取得件数はlimit依存。
// @param key 検索条件に使用するキー
// @param southwest 南西座標
// @param northeast 北東座標
// */
//- (void)whereKey:(NSString *)key withinGeoBoxFromSouthwest:(NCMBGeoPoint *)southwest toNortheast:(NCMBGeoPoint *)northeast;
//
//
///** @name Sub Queries */
//
///**
// 「第一引数は親クエリにおけるキー、第二引数はサブクエリ（第三引数）におけるキーとし、親とサブクエリで得られた値の中で一致するものを検索」という検索条件を設定。
// @param key 親クエリにおけるキー
// @param otherKey サブクエリ（第三引数）におけるキー
// @param query サブクエリ
// */
//- (void)whereKey:(NSString *)key matchesKey:(NSString *)otherKey inQuery:(NCMBQuery *)query;
//
///**
// 「サブクエリ（第二引数）で取得できるオブジェクトの内、親クエリに指定したキー（第一引数）の値(オブジェクト)と一致するものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param query 検索条件に使用するクエリ
// */
//- (void)whereKey:(NSString *)key matchesQuery:(NCMBQuery *)query;
//
///**
// @param queries 条件にしたい複数のクエリ
// */
//+ (NCMBQuery *)orQueryWithSubqueries:(NSArray *)queries;
//
//
///** @name Order */
//
///**
// 「指定したキーで昇順に並べ替える」という検索条件を設定。すでに並べ替え設定が存在している場合は上書きされる。
// @param key 並べ替えに使用するキー
// */
//- (void)orderByAscending:(NSString *)key;
//
///**
// 「指定したキーで昇順に並べ替える」という設定を検索条件に追加。すでに並べ替え設定が存在している場合は、既存のものより優先度が低い。
// @param key 並べ替えに使用するキー
// */
//- (void)addAscendingOrder:(NSString *)key;
//
///**
// 「指定したキーで降順に並べ替える」という検索条件を設定。すでに並べ替え設定が存在している場合は上書きされる。
// @param key 並べ替えに使用するキー
// */
//- (void)orderByDescending:(NSString *)key;
//
///**
// 「指定したキーで降順に並べ替える」という設定を検索条件に追加。すでに並べ替え設定が存在している場合は、既存のものより優先度が低い。
// @param key 並べ替えに使用するキー
// */
//- (void)addDescendingOrder:(NSString *)key;
//
///**
// 「指定したNSSortDescriptor通りに並べ替える」という検索条件を設定。すでに並べ替え設定が存在している場合は上書きされる。
// @param sortDescriptor 並び替えに使用するNSSortDescriptorのインスタンス
// */
//- (void)orderBySortDescriptor:(NSSortDescriptor *)sortDescriptor;
//
///**
// 「指定した複数のNSSortDescriptor通りに並べ替える」という検索条件を設定。すでに並べ替え設定が存在している場合は上書きされる。
// @param sortDescriptors 並び替えに使用するNSSortDescriptorのインスタンスが格納された配列
// */
//- (void)orderBySortDescriptors:(NSArray *)sortDescriptors;
//
//
///** @name Getting Objects by ID */
//
///**
// 指定したクラスとobjectIDを持つオブジェクトを取得。必要があればエラーをセットし、取得することもできる。
// @param objectClass 取得するオブジェクトのクラス名
// @param objectId 取得するオブジェクトのobjectID
// @param error 処理中に起きたエラーのポインタ
// @return 指定されたNCMBObject
// */
//+ (NCMBObject *)getObjectOfClass:(NSString *)objectClass
//                        objectId:(NSString *)objectId
//                           error:(NSError **)error;
//
//
///**
// 指定したobjectIDを持つオブジェクトを取得。必要があればエラーをセットし、取得することもできる。
// @param objectId 取得するオブジェクトのobjectID
// @param error 処理中に起きたエラーのポインタ
// @return 指定されたオブジェクト
// */
//- (NCMBObject *)getObjectWithId:(NSString *)objectId error:(NSError **)error;
//
//
///**
// 指定したobjectIDを持つオブジェクトを非同期で取得。取得し終わったら与えられたblockを呼び出す。
// @param objectId 取得するオブジェクトのobjectID
// @param block 通信後に実行されるblock。blockは次の引数のシグネチャを持つ必要がある (NCMBObject *object, NSError *error)
// objectには取得したオブジェクトが渡される。errorにはエラーがなければnilが渡される。
// */
//- (void)getObjectInBackgroundWithId:(NSString *)objectId
//                              block:(NCMBObjectResultBlock)block;
//
///**
// 指定したobjectIDを持つオブジェクトを非同期で取得。取得し終わったら指定されたコールバックを呼び出す。
// @param objectId 取得するオブジェクトのobjectID
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。 (void)callbackWithResult(NCMBObject)result error:(NSError )error
// resultには取得したオブジェクトが渡され、当てはまるものがなければnilが渡される。errorにはエラーがなければnilが渡される。
// */
//- (void)getObjectInBackgroundWithId:(NSString *)objectId
//                             target:(id)target
//                           selector:(SEL)selector;
//
//
///** @name Getting User */
//
///**
// 指定したobjectIDのユーザを取得。必要があればエラーをセットし、取得することもできる。
// @param objectId 取得するユーザのobjectID
// @param error 処理中に起きたエラーのポインタ
// @return 指定されたNCMBUser
// */
//+ (NCMBUser *)getUserObjectWithId:(NSString *)objectId
//                            error:(NSError **)error;
//
//
///** @name Find Objects */
//
//
///**
// 設定されている検索条件に当てはまるオブジェクトを取得。必要があればエラーをセットし、取得することもできる。
// @param error 処理中に起きたエラーのポインタ
// @return 検索結果の配列
// */
//- (NSArray *)findObjects:(NSError **)error;
//
///**
// 設定されている検索条件に当てはまるオブジェクトを非同期で取得。取得し終わったら与えられたblockを呼び出す。
// @param block 信後に実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NSArray *objects, NSError *error）
// objectsには取得したオブジェクトが渡される。errorにはエラーがなければnilが渡される。
// */
//- (void)findObjectsInBackgroundWithBlock:(NCMBArrayResultBlock)block;
//
///**
// 設定されている検索条件に当てはまるオブジェクトを非同期で取得。取得し終わったら指定されたコールバックを呼び出す。
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NSArray )result error:(NSError )error.
// resultには取得したオブジェクトが渡され、当てはまるものがなければnilが渡される。errorにはエラーがなければnilが渡される。
// */
//- (void)findObjectsInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
///** @name Get first object */
//
///**
// 設定されている検索条件に当てはまるオブジェクトを一件取得。必要があればエラーをセットし、取得することもできる。
// @param error 処理中に起きたエラーのポインタ
// @return 検索条件に該当するオブジェクト
// */
//- (id)getFirstObject:(NSError **)error;
//
//
///**
// 設定されている検索条件に当てはまるオブジェクト一件を非同期で取得。取得し終わったら与えられたblockを呼び出す。
// @param block 通信後に実行されるblock。blockは次の引数のシグネチャを持つ必要がある（id object, NSError *error）
// objectには取得したオブジェクトが渡される。errorにはエラーがなければnilが渡される。
// */
//- (void)getFirstObjectInBackgroundWithBlock:(NCMBAnyObjectResultBlock)block;
//
///**
// 設定されている検索条件に当てはまるオブジェクト一件を非同期で取得。取得し終わったら指定されたコールバックを呼び出す。
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。 (void)callbackWithResult:(NCMBObject)result error:(NSError )error
// resultには取得したオブジェクトが渡され、当てはまるものがなければnilが渡される。errorにはエラーがなければnilが渡される。
// */
//- (void)getFirstObjectInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
///** @name Count Objects */
//
///**
// 設定されている検索条件に当てはまるオブジェクトの件数を取得。必要があればエラーをセットし、取得することもできる。
// @param error 処理中に起きたエラーのポインタ
// @return 検索条件に該当するオブジェクトの件数
// */
//- (NSInteger)countObjects:(NSError **)error;
//
///**
// 設定されている検索条件に当てはまるオブジェクトの件数を非同期で取得。取得し終わったら与えられたblockを呼び出す。
// @param block 通信後に実行されるblock。blockは次の引数のシグネチャを持つ必要がある (int number, NSError *error)
// countには取得した件数が渡される。errorにはエラーがなければnilが渡される。
// */
//- (void)countObjectsInBackgroundWithBlock:(NCMBIntegerResultBlock)block;
//
///**
// 設定されている検索条件に当てはまるオブジェクトの件数を非同期で取得。取得し終わったら指定されたコールバックを呼び出す。
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NSNumber )result error:(NSError )error
// resultには取得した件数が渡される。errorにはエラーがなければnilが渡される。 */
//- (void)countObjectsInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
///** @name Cancel */
//
///**
// 非同期通信をキャンセルする。通信キャンセル後、コールバックは呼ばれない。
// */
//- (void)cancel;
//
//
//#pragma mark cacheConfiguration
//
///** @name Cache Setting */
//
///**
// データ検索時のcachePolicyを設定する
// @param cachePolicy クエリに設定するNSURLRequestCachePolicy
// */
//- (void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy;
//
///**
// 設定されている検索条件に当てはまるキャッシュの有無を取得
// @return キャッシュが存在する場合はYESを返す
// */
//- (BOOL)hasCachedResult;
//
///**
// 設定されている検索条件に当てはまるキャッシュをクリア
// */
//- (void)clearCachedResult;
//
///**
// 全てのキャッシュをクリア
// */
//+ (void)clearAllCachedResults;
//
///**
// 指定されたオブジェクトのリレーション先オブジェクトを検索する
// @param targetClassName リレーション元のクラス名
// @param objectId リレーション元のオブジェクトID
// @param key リレーション元オブジェクトでリレーションが設定されているフィールド名
// */
//- (void)relatedTo:(NSString*)targetClassName objectId:(NSString*)objectId key:(NSString*)key;
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
//#import "NCMB.h"
//
//#import "NCMBURLSession.h"
//
//#import "NCMBObject+Private.h"
//#import "NCMBObject+Subclass.h"
//#import "NCMBRelationOperation.h"
//
//#import "SubClassHandler.h"
//#import <objc/runtime.h>
//#import "NCMBDateFormat.h"
//
//@interface NCMBQuery(){
//    dispatch_semaphore_t semaphore;
    private var __semaphore: DispatchSemaphore?
//}
//@end
//
//@interface NCMBQuery ()
//
//@property (nonatomic)NSMutableDictionary *query;
    private var query: [String: Any] = [:]
//@property (nonatomic)NSMutableArray *orderFieldsAry;
    private var orderFieldsAry: [String] = []
//@property (nonatomic)NCMBURLSession *session;
    private var session: NCMBURLSession?
//@property (nonatomic)NSURLRequestCachePolicy cachePolicy;
    private var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringCacheData
//
//@end
//
//@implementation NCMBQuery
//
//#pragma mark - init
//
//- (id)init {
//    return [self initWithClassName:@""];
//}
//
//- (id)initWithClassName:(NSString*)className{
    public init(className: String) {
//    self = [super init];
//    if (self){
//        _query = [NSMutableDictionary dictionary];
//        _orderFieldsAry = [NSMutableArray array];
//        _includeKey = nil;
//        _cachePolicy = NSURLRequestReloadIgnoringCacheData;
//        _ncmbClassName = className;
        self.ncmbClassName = className
//    }
//    return self;
//}
    }
//
///**
// クラス名を指定してクエリを作成する
// @param className 指定するクラス名
// */
    //Use `init(className:)` instead.
//+ (NCMBQuery*)queryWithClassName:(NSString*)className{
//    return [[NCMBQuery alloc] initWithClassName:className];
//}
//
//#pragma mark - description
//
//- (NSString*)description{
    var description: String {
//    NSError *error = nil;
        do {
//    NSData *json = [NSJSONSerialization dataWithJSONObject:_query
            let json = try JSONSerialization.data(withJSONObject: query,
                                                  options: .prettyPrinted)
//                                                   options:NSJSONWritingPrettyPrinted
//                                                     error:&error];
            return String(data: json, encoding: .utf8)!
//    return [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
        } catch {
            print(error)
            return "NCMBQuery"
        }
//}
    }
//
//#pragma mark - Query configuration
//
///**
// 検索条件を_queryに設定する
// @param object 検索条件に使用する値
// @param key 検索条件に使用するキー
// @param operand 検索条件
// */
//- (void)setCondition:(id)object forKey:(NSString*)key operand:(NSString*)operand{
    private func setCondition(_ object: Any, forKey key: String, operator ope: String?) {
//    if ([operand isEqualToString:@"$eq"]){
        if ope == "$eq" {
//        //equalToの場合、オペランドはないので値を直接設定する
//        //他の条件と組み合わせ不可なので、既存の設定を無視して上書きする
//        [_query setObject:[self convertToJSONFromNCMBObject:object] forKey:key];
            query[key] = self.convertToJSONFromNCMBObject(object)
//    } else if ([key isEqualToString:@"$or"] && operand == nil){
        } else if key == "$or" && ope == nil {
//        //or検索の場合、オペランドがキーに設定される
//        [_query setObject:[self convertToJSONFromNCMBObject:object] forKey:key];
            query[key] = self.convertToJSONFromNCMBObject(object)
//    } else if ([key isEqualToString:@"$relatedTo"] && operand == nil){
        } else if key == "$relatedTo" && ope == nil {
//        //relatedToの場合、オペランドがキーに設定される
//        [_query setObject:object forKey:key];
            query[key] = object
//    } else {
        } else {
//        if ([[_query allKeys] containsObject:key]){
            guard let operand = ope else {
                fatalError("operand must not be nil")
            }
            if var condition = self.query[key] as? [String: Any] {
//            //既に検索条件が設定されていた場合は統合する
//            NSMutableDictionary *condition;
//            condition = [NSMutableDictionary dictionaryWithDictionary:[_query objectForKey:key]];
//            [condition setObject:[self convertToJSONFromNCMBObject:object] forKey:operand];
                condition[operand] = self.convertToJSONFromNCMBObject(object)
//            [_query setObject:condition forKey:key];
                query[key] = condition
//        } else {
            } else {
//            [_query setObject:@{operand:[self convertToJSONFromNCMBObject:object]} forKey:key];
                query[key] = [operand: self.convertToJSONFromNCMBObject(object)]
//        }
            }
//
//    }
        }
//}
    }
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)と等しいものを検索する」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値
// */
//- (void)whereKey:(NSString*)key equalTo:(id)object{
    public func `where`(key: String, equalTo object: Any) {
//    [self setCondition:object forKey:key operand:@"$eq"];
        self.setCondition(object, forKey: key, operator: "$eq")
//}
    }
//
//- (void)whereKey:(NSString *)key notEqualTo:(id)object{
    public func `where`(key: String, notEqualTo object: Any) {
//    [self setCondition:object forKey:key operand:@"$ne"];
        self.setCondition(object, forKey: key, operator: "$ne")
//}
    }
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)の値より大きいものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値
// */
//- (void)whereKey:(NSString *)key greaterThan:(id)object{
    public func `where`(key: String, greaterThan object: Any) {
//    [self setCondition:object forKey:key operand:@"$gt"];
        self.setCondition(object, forKey: key, operator: "$gt")
//}
    }
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)の値以上を検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値
// */
//- (void)whereKey:(NSString *)key greaterThanOrEqualTo:(id)object{
    public func `where`(key: String, greaterThanOrEqualTo object: Any) {
//    [self setCondition:object forKey:key operand:@"$gte"];
        self.setCondition(object, forKey: key, operator: "$gte")
//}
    }
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)より小さいものを検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値
// */
//- (void)whereKey:(NSString *)key lessThan:(id)object{
    public func `where`(key: String, lessThan object: Any) {
//    [self setCondition:object forKey:key operand:@"$lt"];
        self.setCondition(object, forKey: key, operator: "$lt")
//}
    }
//
///**
// 「親クエリに指定したキーの値の中から指定したオブジェクト(第二引数)以下を検索」という検索条件を設定
// @param key 検索条件に使用するキー
// @param object 検索条件に使用する値
// */
//- (void)whereKey:(NSString *)key lessThanOrEqualTo:(id)object{
    public func `where`(key: String, lessThanOrEqualTo object: Any) {
//    [self setCondition:object forKey:key operand:@"$lte"];
        self.setCondition(object, forKey: key, operator: "$lte")
//}
    }
//
//- (void)whereKey:(NSString *)key containedIn:(NSArray *)array{
    public func `where`(key: String, containedIn array: [Any]) {
//    [self setCondition:array forKey:key operand:@"$in"];
        self.setCondition(array, forKey: key, operator: "$in")
//}
    }
//
//- (void)whereKey:(NSString *)key notContainedIn:(NSArray *)array{
    public func `where`(key: String, notContainedIn array: [Any]) {
//    [self setCondition:array forKey:key operand:@"$nin"];
        self.setCondition(array, forKey: key, operator: "$nin")
//}
    }
//
//- (void)whereKey:(NSString *)key containedInArrayTo:(NSArray *)array{
    public func `where`(key: String, containedInArrayTo array: [Any]) {
//    [self setCondition:array forKey:key operand:@"$inArray"];
        self.setCondition(array, forKey: key, operator: "$inArray")
//}
    }
//
//- (void)whereKey:(NSString *)key notContainedInArrayTo:(NSArray *)array{
    public func `where`(key: String, notContainedInArrayTo array: [Any]) {
//    [self setCondition:array forKey:key operand:@"$ninArray"];
        self.setCondition(array, forKey: key, operator: "$ninArray")
//}
    }
//
//- (void)whereKey:(NSString *)key containsAllObjectsInArrayTo:(NSArray *)array{
    public func `where`(key: String, containsAllObjectsInArrayTo array: [Any]) {
//    [self setCondition:array forKey:key operand:@"$all"];
        self.setCondition(array, forKey: key, operator: "$all")
//}
    }
//
//- (void)whereKey:(NSString *)key matchesKey:(NSString *)otherKey inQuery:(NCMBQuery *)query{
    public func `where`(key: String, matchesKey otherKey: String, in query: NCMBQuery) {
//    [self setCondition:@{@"query":query,@"key":otherKey} forKey:key operand:@"$select"];
        self.setCondition(["query": query, "key": otherKey], forKey: key, operator: "$select")
//}
    }
//
//- (void)whereKey:(NSString *)key matchesQuery:(NCMBQuery *)query{
    public func `where`(key: String, matches query: NCMBQuery) {
//    [self setCondition:query forKey:key operand:@"$inQuery"];
        self.setCondition(query, forKey: key, operator: "$inQuery")
//}
    }
//
//- (void)whereKeyExists:(NSString *)key{
    public func `where`(keyExists key: String) {
//    [self setCondition:[NSNumber numberWithBool:YES] forKey:key operand:@"$exists"];
        self.setCondition(true as NSNumber, forKey: key, operator: "$exists")
//}
    }
//
//- (void)whereKeyDoesNotExist:(NSString *)key{
    public func `where`(keyDoesNotExist key: String) {
//    [self setCondition:[NSNumber numberWithBool:NO] forKey:key operand:@"$exists"];
        self.setCondition(false as NSNumber, forKey: key, operator: "$exists")
//}
    }
//
//- (void)whereKey:(NSString *)key nearGeoPoint:(NCMBGeoPoint *)geoPoint{
    public func `where`(key: String, near geoPoint: NCMBGeoPoint) {
//    [self setCondition:geoPoint forKey:key operand:@"$nearSphere"];
        self.setCondition(geoPoint, forKey: key, operator: "$nearSphere")
//}
    }
//
//- (void)whereKey:(NSString *)key nearGeoPoint:(NCMBGeoPoint *)geoPoint withinKilometers:(double)maxDistance{
    public func `where`(key: String, near geoPoint: NCMBGeoPoint, withinKilometers maxDistance: Double) {
//    [self setCondition:geoPoint forKey:key operand:@"$nearSphere"];
        self.setCondition(geoPoint, forKey: key, operator: "$nearSphere")
//    [self setCondition:[NSNumber numberWithDouble:maxDistance] forKey:key operand:@"$maxDistanceInKilometers"];
        self.setCondition(maxDistance as NSNumber, forKey: key, operator: "$maxDistanceInKilometers")
//}
    }
//
//- (void)whereKey:(NSString *)key nearGeoPoint:(NCMBGeoPoint *)geoPoint withinMiles:(double)maxDistance{
    public func `where`(key: String, near geoPoint: NCMBGeoPoint, withinMiles maxDistance: Double) {
//    [self setCondition:geoPoint forKey:key operand:@"$nearSphere"];
        self.setCondition(geoPoint, forKey: key, operator: "$nearSphere")
//    [self setCondition:[NSNumber numberWithDouble:maxDistance] forKey:key operand:@"$maxDistanceInMiles"];
        self.setCondition(maxDistance as NSNumber, forKey: key, operator: "$maxDistanceInMiles")
//}
    }
//
//- (void)whereKey:(NSString *)key nearGeoPoint:(NCMBGeoPoint *)geoPoint withinRadians:(double)maxDistance{
    public func `where`(key: String, near geoPoint: NCMBGeoPoint, withinRadians maxDistance: Double) {
//    [self setCondition:geoPoint forKey:key operand:@"$nearSphere"];
        self.setCondition(geoPoint, forKey: key, operator: "$nearSphere")
//    [self setCondition:[NSNumber numberWithDouble:maxDistance] forKey:key operand:@"$maxDistanceInRadians"];
        self.setCondition(maxDistance as NSNumber, forKey: key, operator: "$maxDistanceInRadians")
//}
    }
//
//- (void)whereKey:(NSString *)key
    public func `where`(key: String,
//withinGeoBoxFromSouthwest:(NCMBGeoPoint *)southwest
        withinGeoBoxFromSouthwest southwest: NCMBGeoPoint,
//     toNortheast:(NCMBGeoPoint *)northeast{
        toNortheast northeast: NCMBGeoPoint) {
//    [self setCondition:@{@"$box":@[southwest,northeast]} forKey:key operand:@"$within"];
        self.setCondition(["$box": [southwest, northeast]], forKey: key, operator: "$within")
//}
    }
//
//+(NCMBQuery*)orQueryWithSubqueries:(NSArray *)queries{
    public func orQuery(subqueries queries: [NCMBQuery]) -> NCMBQuery? {
//    NSString *className = @"";
        var className = ""
//    NSMutableArray *jsonQueries = [NSMutableArray array];
        var jsonQueries: [Any] = []
//    for (NCMBQuery *aQuery in [queries objectEnumerator]){
        for aQuery in queries {
//        if ([className isEqualToString:@""]){
            if className == "" {
//            className = aQuery.ncmbClassName;
                className = aQuery.ncmbClassName
//            [jsonQueries addObject:[aQuery convertToJSONFromNCMBObject:aQuery.query]];
                jsonQueries.append(aQuery.convertToJSONFromNCMBObject(aQuery.query))
//        } else {
            } else {
//            if (![className isEqualToString:aQuery.ncmbClassName]){
                if className != aQuery.ncmbClassName {
//                return nil;
                    return nil
//            }
                }
//            [jsonQueries addObject:[aQuery convertToJSONFromNCMBObject:aQuery.query]];
                jsonQueries.append(aQuery.convertToJSONFromNCMBObject(aQuery.query))
//        }
            }
//    }
        }
//    NCMBQuery *query = [NCMBQuery queryWithClassName:className];
        let query = NCMBQuery(className: className)
//    [query setCondition:jsonQueries forKey:@"$or" operand:nil];
        query.setCondition(jsonQueries, forKey: "$or", operator: nil)
//
//    return query;
        return query
//}
    }
//
//
//- (void)relatedTo:(NSString*)targetClassName objectId:(NSString*)objectId key:(NSString*)key{
    public func related(to targetClassName: String?, objectId: String?, key: String?) {
//    NSDictionary *relatedDic = @{@"object":@{@"__type":@"Pointer",
        let relatedDic: [String: Any] = [
            "object": [
                "__type": "Pointer",
//                                             @"className":targetClassName,
                "className": targetClassName,
//                                             @"objectId":objectId,
                "objectId": objectId,
//                                             },
            ],
//                                 @"key":key};
            "key": key as Any]
//    [self setCondition:relatedDic forKey:@"$relatedTo" operand:nil];
        self.setCondition(relatedDic, forKey: "$relatedTo", operator: nil)
//}
    }
//
//- (void)includeKey:(NSString *)key{
    public func include(key: String) {
//    self.includeKey = key;
        self.includedKey = key
//}
    }
//
//
//#pragma mark - Order
//
////昇順
//- (void)orderByAscending:(NSString *)key{
    public func order(byAscending key: String) {
//    self.orderFieldsAry = [NSMutableArray arrayWithObject:key];
        self.orderFieldsAry = [key]
//}
    }
//
////昇順(追加)
//- (void)addAscendingOrder:(NSString *)key{
    public func addAscendingOrder(key : String) {
//    //初設定の場合
//    if(!self.orderFieldsAry){
//        self.orderFieldsAry = [NSMutableArray arrayWithCapacity:0];
//    }
//    //設定追加
//    [self.orderFieldsAry addObject:key];
        self.orderFieldsAry.append(key)
//}
    }
//
////降順
//- (void)orderByDescending:(NSString *)key{
    public func order(byDescending key: String) {
//    NSString *descendingKey = [NSString stringWithFormat:@"-%@",key];
        let descendingKey = "-\(key)"
//    self.orderFieldsAry = [NSMutableArray arrayWithObject:descendingKey];
        self.orderFieldsAry = [descendingKey]
//}
    }
//
////降順(追加)
//- (void)addDescendingOrder:(NSString *)key{
    public func addDescendingOrder(key: String) {
//    //初設定の場合
//    if(!self.orderFieldsAry){
//        self.orderFieldsAry = [NSMutableArray arrayWithCapacity:0];
//    }
//    //設定追加
//    NSString *descendingKey = [NSString stringWithFormat:@"-%@",key];
        let descendingKey = "-\(key)"
//    [self.orderFieldsAry addObject:descendingKey];
        self.orderFieldsAry.append(descendingKey)
//}
    }
//
////SortDescriptorによるソート指定
//- (void)orderBySortDescriptor:(NSSortDescriptor *)sortDescriptor{
    public func order(by sortDescriptor: NSSortDescriptor) {
//    NSString *key = sortDescriptor.key;
        guard let key = sortDescriptor.key else {
            fatalError("key must not be nil")
        }
//    BOOL isAscending = sortDescriptor.ascending;
        let isAscending = sortDescriptor.ascending
//    if(isAscending){
        if isAscending {
//        self.orderFieldsAry = [NSMutableArray arrayWithObject:key];
            self.orderFieldsAry = [key]
//    }else{
        } else {
//        NSString *descendingKey = [NSString stringWithFormat:@"-%@",key];
            let descendingKey = "-\(key)"
//        self.orderFieldsAry = [NSMutableArray arrayWithObject:descendingKey];
            self.orderFieldsAry = [descendingKey]
//    }
        }
//}
    }
//
////SortDescriptorによるソート指定
//- (void)orderBySortDescriptors:(NSArray *)sortDescriptors{
    public func order(bySortDescriptors sortDescriptors: [NSSortDescriptor]) {
//    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        var array: [String] = []
//    for(NSSortDescriptor *sortDescriptor in sortDescriptors){
        for sortDescriptor in sortDescriptors {
//        NSString *key = sortDescriptor.key;
            guard let key = sortDescriptor.key else {
                fatalError("key must not be nil")
            }
//        BOOL isAscending = sortDescriptor.ascending;
            let isAscending = sortDescriptor.ascending
//        if(isAscending){
            if isAscending {
//            [array addObject:key];
                array.append(key)
//        }else{
            } else {
//            NSString *descendingKey = [NSString stringWithFormat:@"-%@",key];
                let descendingKey = "-\(key)"
//            [array addObject:descendingKey];
                array.append(descendingKey)
//        }
            }
//    }
        }
//    self.orderFieldsAry = array;
        self.orderFieldsAry = array
//}
    }
//
//#pragma mark - findObject
//
///**
// 指定された条件でオブジェクト検索を実行する。
// @param error エラーを保持するポインタ
// @return 検索結果をNSArray型で返却する
// */
//- (NSArray*)findObjects:(NSError**)error{
//    semaphore = dispatch_semaphore_create(0);
//
//    NCMBRequest *request = [self createRequestForSearch:_query countEnableFlag:NO getFirst:NO];
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
//
//    // 通信
//    NSError __block *sessionError = nil;
//    NSMutableArray __block *objects = [NSMutableArray array];
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
//        if (requestError){
//            sessionError = requestError;
//        } else {
//            NSMutableArray *results = [NSMutableArray arrayWithArray:[responseData objectForKey:@"results"]];
//            for (NSDictionary *jsonObj in [results objectEnumerator]){
//                [objects addObject:[NCMBObject convertClass:[NSMutableDictionary dictionaryWithDictionary:jsonObj] ncmbClassName:_ncmbClassName]];
//            }
//        }
//        dispatch_semaphore_signal(semaphore);
//    }];
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//    if(error){
//        *error = sessionError;
//    }
//
//    return objects;
//}
//
//- (void)findObjectsInBackgroundWithBlock:(NCMBArrayResultBlock)block{
    public func findObjectsAsync(block: NCMBArrayResultBlock?) {
//    NCMBRequest *request = [self createRequestForSearch:_query countEnableFlag:NO getFirst:NO];
        let request = self.createRequestForSearch(query, isCountEnabled: false, shouldGetFirst: false)
//    _session = [[NCMBURLSession alloc] initWithRequestAsync:request];
        session = NCMBURLSession(requestAsync: request)
//
//    //非同期通信を実行
//    [_session dataAsyncConnectionWithBlock:^(id responseData, NSError *error) {
        session!.dataAsyncConnection {result in
            switch result {
            case .failure(let error):
                block?(.failure(error))
            case .success(let responseData):
                guard let responseDic = responseData as? [String: Any],
                    let results = responseDic["results"] as? [[String: Any]] else {
                        fatalError("Bad response")
                }
//        NSDictionary *responseDic = responseData;
//        NSMutableArray *results = [NSMutableArray arrayWithArray:[responseDic objectForKey:@"results"]];
//        NSMutableArray *objects = [NSMutableArray array];
//        for (NSDictionary *jsonObj in [results objectEnumerator]){
//            [objects addObject:[NCMBObject convertClass:[NSMutableDictionary dictionaryWithDictionary:jsonObj] ncmbClassName:_ncmbClassName]];
//        }
                let objects = results.map{NCMBObject.convertClass($0, ncmbClassName: self.ncmbClassName)}
//
//        // コールバック実行
//        [self executeUserCallback:block array:objects error:error];
                block?(.success(objects))
            }
//    }];
        }
//}
    }
//
//- (void)findObjectsInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func findObjectsAsync(target: AnyObject, selector: Selector) {
//    if (!target || !selector){
//        [NSException raise:@"NCMBInvalidValueException" format:@"target or selector must not be nil."];
//    }
//    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//    [self findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        self.findObjectsAsync {result in
            switch result {
//        [invocation retainArguments];
//        [invocation setArgument:&objects atIndex:2];
//        [invocation setArgument:&error atIndex:3];
//        [invocation invoke];
            case .success(let objects):
                _ = target.perform(selector, with: objects, with: nil)
            case .failure(let error):
                _ = target.perform(selector, with: nil, with: error)
            }
//    }];
        }
//}
    }
//
//- (NCMBRequest*)createRequestForSearch:(NSMutableDictionary*)queryDic countEnableFlag:(BOOL)countEnableFlag getFirst:(BOOL)getFirstFlag{
    private func createRequestForSearch(_ queryDic: [String: Any], isCountEnabled countEnableFlag: Bool, shouldGetFirst getFirstFlag: Bool) -> NCMBRequest {
//    NSDictionary *endpoint = @{@"user":@"users",
//                               @"role":@"roles",
//                               @"installation":@"installations",
//                               @"push":@"push",
//                               @"file":@"files"};
//    NSMutableString *baseUrl = [NSMutableString string];
//    if ([_ncmbClassName isEqualToString:@"user"] || [_ncmbClassName isEqualToString:@"role"] ||
//        [_ncmbClassName isEqualToString:@"installation"] || [_ncmbClassName isEqualToString:@"push"] ||
//        [_ncmbClassName isEqualToString:@"file"]) {
//        baseUrl = [NSMutableString stringWithFormat:@"%@", [endpoint objectForKey:_ncmbClassName]];
//    } else {
//        baseUrl = [NSMutableString stringWithFormat:@"classes/%@", _ncmbClassName];
//    }
        var baseUrl = NCMB.baseUrl(ncmbClassName: ncmbClassName)
//    NSArray *queryArray = [self queryToArray:queryDic countEnableFlag:countEnableFlag getFirstFlag:getFirstFlag];
        guard let queryArray = self.queryToArray(queryDic, isCountEnabled: countEnableFlag, shouldGetFirst: getFirstFlag) else {
            fatalError("\(#function): Invalid query")
        }
//    NSString *queryStr = @"";
//    for (int i = 0; i < [queryArray count]; i++){
//        if (i == 0){
//            queryStr = [NSString stringWithFormat:@"%@",queryArray[i]];
//        } else {
//            queryStr = [queryStr stringByAppendingString:[NSString stringWithFormat:@"&%@",queryArray[i]]];
//        }
//    }
        let queryStr = queryArray.joined(separator: "&")
//
//    [baseUrl appendString:[NSString stringWithFormat:@"?%@", queryStr]];
        baseUrl += "?\(queryStr)"
//
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:baseUrl
        let request = NCMBRequest(urlString: baseUrl,
                                  method: "GET",
                                  header: nil,
                                  body: nil)
//                                                           method:@"GET"
//                                                           header:nil
//                                                             body:nil];
//
//    return request;
        return request
//}
    }
//
//#pragma mark - getFirstObject
//
//- (id)getFirstObject:(NSError **)error{
    public func __getFirstObject() throws -> Any {
        fatalError("\(#function): Sync methods not supported")
//    semaphore = dispatch_semaphore_create(0);
//
//    NCMBRequest *request = [self createRequestForSearch:_query countEnableFlag:NO getFirst:NO];
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
//
//    // 通信
//    NSError __block *sessionError = nil;
//    NSMutableArray __block *results = nil;
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
//        if (requestError){
//            sessionError = requestError;
//        } else {
//            NSDictionary *responseDic = responseData;
//            results = [NSMutableArray arrayWithArray:[responseDic objectForKey:@"results"]];
//        }
//        dispatch_semaphore_signal(semaphore);
//    }];
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//    if(error){
//        *error = sessionError;
//    }
//
//    if ([results count] == 0){
//        return nil;
//    }
//    id obj = [NCMBObject convertClass:results[0] ncmbClassName:_ncmbClassName];
//    return obj;
//}
    }
//
//
//
//- (void)getFirstObjectInBackgroundWithBlock:(NCMBAnyObjectResultBlock)block{
    public func getFirstObjectAsync(block: @escaping NCMBObjectResultBlock) {
//    NCMBRequest *request = [self createRequestForSearch:_query countEnableFlag:NO getFirst:YES];
        let request = self.createRequestForSearch(query, isCountEnabled: false, shouldGetFirst: true)
//    _session = [[NCMBURLSession alloc] initWithRequestAsync:request];
        session = NCMBURLSession(requestAsync: request)
//    //非同期通信を実行
//    [_session dataAsyncConnectionWithBlock:^(id responseData, NSError *error) {
        session!.dataAsyncConnection {result in
//        if(block){
            switch result {
            case .failure(let error):
                block(.failure(error))
            case .success(let responseData):
//            NSDictionary *responseDic = responseData;
                guard let responseDic = responseData as? [String: Any],
//            NSMutableArray *results = [NSMutableArray arrayWithArray:[responseDic objectForKey:@"results"]];
                    let results = responseDic["results"] as? [[String: Any]] else {
                        block(.failure(NCMBError.badResponse))
                        return
                }
//            NCMBObject *obj = nil;
                var obj: NCMBObject? = nil
//            if ([results count] != 0){
                if !results.isEmpty {
//                obj = [NCMBObject convertClass:results[0] ncmbClassName:_ncmbClassName];
                    obj = NCMBObject.convertClass(results[0], ncmbClassName: self.ncmbClassName)
//            }
                }
//            block(obj,error);
                block(.success(obj))
//        }
            }
//    }];
        }
//}
    }
//
//- (void)getFirstObjectInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func getFirstObjectAsync(target: AnyObject, selector: Selector) {
//    if (!target || !selector){
//        [NSException raise:@"NCMBInvalidValueException" format:@"target or selector must not nil."];
//    }
//    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//    [self getFirstObjectInBackgroundWithBlock:^(NCMBObject *object, NSError *error) {
        self.getFirstObjectAsync {result in
            switch result {
//        [invocation retainArguments];
//        [invocation setArgument:&object atIndex:2];
//        [invocation setArgument:&error atIndex:3];
//        [invocation invoke];
            case .success(let object):
                _ = target.perform(selector, with: object, with: nil)
            case .failure(let error):
                _ = target.perform(selector, with: nil, with: error)
            }
//    }];
        }
//}
    }
//
//#pragma mark - countObject
//
//- (NSInteger)countObjects:(NSError **)error{
    public func __countObjects() throws -> Int {
        fatalError("\(#function): Sync methods not supported")
//    semaphore = dispatch_semaphore_create(0);
//    NCMBRequest *request = [self createRequestForSearch:_query countEnableFlag:YES getFirst:NO];
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
//
//    // 通信
//    NSError __block *sessionError = nil;
//    NSDictionary __block *response = nil;
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
//        if (requestError){
//            sessionError = requestError;
//        } else {
//            response = responseData;
//        }
//        dispatch_semaphore_signal(semaphore);
//    }];
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//
//    if(error){
//        *error = sessionError;
//    }
//    if ([[response allKeys] containsObject:@"count"]){
//        return [[response objectForKey:@"count"] intValue];
//    }
//    return 0;
//}
    }
//
//- (void)countObjectsInBackgroundWithBlock:(NCMBIntegerResultBlock)block{
    public func countObjectsAsync(block: @escaping NCMBIntegerResultBlock) {
//    NCMBRequest *request = [self createRequestForSearch:_query countEnableFlag:YES getFirst:NO];
        let request = self.createRequestForSearch(query, isCountEnabled: true, shouldGetFirst: false)
//    _session = [[NCMBURLSession alloc] initWithRequestSync:request];
        session = NCMBURLSession(request: request) //### Not Async?
//
//    [_session dataAsyncConnectionWithBlock:^(id response, NSError *error) {
        session?.dataAsyncConnection {result in
            switch result {
            case .success(let response):
//        NSDictionary *responseDic = response;
//        if ([[responseDic allKeys] containsObject:@"count"]){
                guard let responseDic = response as? [String: Any],
                    let count = responseDic["count"] as? Int else {
                        block(.failure(NCMBError.badResponse))
                        return
                }
//            block([[response objectForKey:@"count"] intValue], error);
                block(.success(count))
//        }else{
            case .failure(let error):
//            block(0, error);
                block(.failure(error))
//        }
            }
//    }];
            
        }
//}
    }
//
//- (void)countObjectsInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func countObjectsAsync(target: AnyObject, selector: Selector) {
//    if (!target || !selector){
//        [NSException raise:@"NCMBInvalidValueException" format:@"target or selector must not nil."];
//    }
//    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//    [self countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
        self.countObjectsAsync {result in
            switch result {
//        [invocation retainArguments];
//        [invocation setArgument:&number atIndex:2];
//        [invocation setArgument:&error atIndex:3];
//        [invocation invoke];
            case .success(let number):
                _ = target.perform(selector, with: number, with: nil)
            case .failure(let error):
                _ = target.perform(selector, with: nil, with: error)
            }
//    }];
        }
//}
    }
//
//#pragma mark - getObjectWithId
//
//-(NCMBObject*)getObjectWithId:(NSString *)objectId error:(NSError **)error{
    public func __getObject(id objectId: String) throws -> NCMBObject? {
        fatalError("\(#function): Sync methods not supported")
//    semaphore = dispatch_semaphore_create(0);
//    NSMutableDictionary *queryDic = [NSMutableDictionary dictionaryWithDictionary:@{@"objectId":objectId}];
//
//    NCMBRequest *request = [self createRequestForSearch:queryDic countEnableFlag:NO getFirst:YES];
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
//
//    // 通信
//    NSError __block *sessionError = nil;
//    NSMutableArray __block *results = nil;
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
//        if (requestError){
//            sessionError = requestError;
//        } else {
//            results = [NSMutableArray arrayWithArray:[responseData objectForKey:@"results"]];
//        }
//        dispatch_semaphore_signal(semaphore);
//    }];
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//
//    if(error){
//        *error = sessionError;
//    }
//
//    if ([results count] == 0){
//        return nil;
//    } else {
//        return [NCMBObject objectWithClassName:_ncmbClassName data:results[0]];
//    }
//}
    }
//
//- (void)getObjectInBackgroundWithId:(NSString *)objectId block:(NCMBObjectResultBlock)block{
    public func getObjectAsync(id objectId: String, block: @escaping NCMBObjectResultBlock) {
//    NSMutableDictionary *queryDic = [NSMutableDictionary dictionaryWithDictionary:@{@"objectId":objectId}];
        let queryDic: [String: Any] = ["objectId": objectId]
//
//    NCMBRequest *request = [self createRequestForSearch:queryDic countEnableFlag:NO getFirst:YES];
        let request = self.createRequestForSearch(queryDic, isCountEnabled: false, shouldGetFirst: true)
//    _session = [[NCMBURLSession alloc] initWithRequestSync:request];
        session = NCMBURLSession(request: request) //### Not Async?
//
//    [_session dataAsyncConnectionWithBlock:^(id response, NSError *error) {
        session!.dataAsyncConnection {result in
            switch result {
            case .failure(let error):
                block(.failure(error))
            case .success(let response):
//        NSDictionary *responseDic = response;
                guard let responseDic = response as? [String: Any],
//        NSMutableArray *results = [NSMutableArray arrayWithArray:[responseDic objectForKey:@"results"]];
                    let results = responseDic["results"] as? [[String: Any]],
                    !results.isEmpty else {
                        block(.failure(NCMBError.badResponse))
                        return
                }
//        if (block){
//            if ([results count] == 0){
//                block(nil, error);
//            } else {
//                block([NCMBObject objectWithClassName:_ncmbClassName data:results[0]], error);
                block(.success(NCMBObject(className: self.ncmbClassName, data: results[0])))
//            }
//        }
            }
//    }];
        }
//}
    }
//
//- (void)getObjectInBackgroundWithId:(NSString *)objectId target:(id)target selector:(SEL)selector{
    public func getObjectAsync(id objectId: String, target: AnyObject, selector: Selector) {
//    if (!target || !selector){
//        [NSException raise:@"NCMBInvalidValueException" format:@"target or selector must not nil."];
//    }
//    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//    [self getObjectInBackgroundWithId:objectId block:^(NCMBObject *object, NSError *error) {
        self.getObjectAsync(id: objectId) {result in
            switch result {
//        [invocation retainArguments];
//        [invocation setArgument:&object atIndex:2];
//        [invocation setArgument:&error atIndex:3];
//        [invocation invoke];
            case .success(let object):
                _ = target.perform(selector, with: object, with: nil)
            case .failure(let error):
                _ = target.perform(selector, with: nil, with: error)
            }
//    }];
        }
//}
    }
//
//#pragma mark - getObjectWithClass/User
//
//+(NCMBObject*)getObjectOfClass:(NSString *)objectClass objectId:(NSString *)objectId error:(NSError **)error{
    public static func __getObjectOfClass(_ objectClass: String, objectId: String) throws -> NCMBObject? {
        fatalError("\(#function): Sync methods not supported")
//    NCMBQuery *query = [NCMBQuery queryWithClassName:objectClass];
//    return [query getObjectWithId:objectId error:error];
//}
    }
//
//+(NCMBUser*)getUserObjectWithId:(NSString *)objectId error:(NSError **)error{
    public static func __getUserObject(id objectId: String) throws -> NCMBUser? {
        fatalError("\(#function): Sync methods not supported")
//    NCMBQuery *query = [NCMBQuery queryWithClassName:@"user"];
//    NCMBObject *userObj = [query getObjectWithId:objectId error:error];
//    if (userObj == nil){
//        return nil;
//    }
//    NCMBUser *user = [NCMBUser user];
//    if ([[userObj allKeys] containsObject:@"userName"]){
//        user.userName = [userObj objectForKey:@"userName"];
//    }
//    if ([[userObj allKeys] containsObject:@"mailAddress"]){
//        user.mailAddress = [userObj objectForKey:@"mailAddress"];
//    }
//    return user;
//}
    }
//
//#pragma mark - cancel
//
//- (void)cancel{
    public func cancel() {
//    if (_session.dataTask !=nil && _session.dataTask.state == NSURLSessionTaskStateRunning) {
        if let dataTask = session?.dataTask, dataTask.state == .running {
//        [_session.dataTask cancel];
            dataTask.cancel()
//        _session = nil;
            session = nil
//    }
        }
//}
    }
//
//#pragma mark - Cache Configuration
//
///**
// データ検索時のcachePolicyを設定する
// */
//- (void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy{
    public func set(cachePolicy: URLRequest.CachePolicy) {
//    _cachePolicy = cachePolicy;
        self.cachePolicy = cachePolicy
//}
    }
//
//+(void)clearAllCachedResults{
    public static func clearAllCachedResults() {
//    [[NSURLCache sharedURLCache] removeAllCachedResponses];
        URLCache.shared.removeAllCachedResponses()
//}
    }
//
//- (void)clearCachedResult{
    public func clearCachedResult() {
//    NCMBRequest *request = [self createRequestForSearch:_query countEnableFlag:NO getFirst:NO];
        let request = self.createRequestForSearch(query, isCountEnabled: false, shouldGetFirst: false)
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestAsync:request];
        let session = NCMBURLSession(requestAsync: request)
//    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:session.request];
        URLCache.shared.removeCachedResponse(for: session.request.urlRequest)
//}
    }
//
//-(BOOL)hasCachedResult{
    public func hasCachedResult() -> Bool {
//    BOOL result = NO;
        var result = false
//    NCMBRequest *request = [self createRequestForSearch:_query countEnableFlag:NO getFirst:NO];
        let request = self.createRequestForSearch(query, isCountEnabled: false, shouldGetFirst: false)
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestAsync:request];
        let session = NCMBURLSession(requestAsync: request)
//    if([[NSURLCache sharedURLCache] cachedResponseForRequest:session.request] != nil){
        if URLCache.shared.cachedResponse(for: session.request.urlRequest) != nil {
//        result = YES;
            result = true
//    }
        }
//    return result;
        return result
//}
    }
//
//
//
//#pragma mark - utility
///**
// クエリの内容を配列で返却する
// @param queryDic 配列に変換するクエリが格納されたNSDictionary
// @param countEnableFlag YESが指定されている場合にカウントを行う
// @param getFirstFlag YESが指定されている場合にlimit=1を指定する
// */
//- (NSArray*)queryToArray:(NSMutableDictionary*)queryDic countEnableFlag:(BOOL)countEnableFlag getFirstFlag:(BOOL)getFirstFlag{
    private func queryToArray(_ queryDic: [String: Any], isCountEnabled countEnableFlag: Bool, shouldGetFirst getFirstFlag: Bool) -> [String]? {
//    //queryStrを作成する
//    NSMutableArray *queryArray = [NSMutableArray array];
        var queryArray: [String] = []
//
//    NSMutableDictionary *jsonDic = [self convertToJSONFromNCMBObject:queryDic];
        let jsonDic = self.convertToJSONFromNCMBObject(queryDic) as! [String: Any]
//    NSError *convertError = nil;
//    if ([jsonDic count] != 0){
        if !jsonDic.isEmpty {
            do {
//        NSData *json = [NSJSONSerialization dataWithJSONObject:jsonDic options:kNilOptions error:&convertError];
                let json = try JSONSerialization.data(withJSONObject: jsonDic)
//        if (convertError){
//            return nil;
//        }
//        NSString *jsonParamStr = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
                let jsonParamStr = String(data: json, encoding: .utf8)!
//
//        [queryArray addObject:[NSString stringWithFormat:@"where=%@", jsonParamStr]];
                queryArray.append("where=\(jsonParamStr)")
            } catch {
                return nil
            }
//    }
        }
//    if ([_orderFieldsAry count] != 0){
        if !orderFieldsAry.isEmpty {
//        NSMutableString *orderStr = [NSMutableString stringWithString:@"order="];
//        for (int i = 0; i < [_orderFieldsAry count]; i++){
//            if (i == 0){
//                [orderStr appendString:_orderFieldsAry[i]];
//            } else {
//                [orderStr appendFormat:@",%@", _orderFieldsAry[i]];
//            }
//        }
            let orderStr = orderFieldsAry.joined(separator: ",")
//        [queryArray addObject:orderStr];
            queryArray.append(orderStr)
//    }
        }
//    if (countEnableFlag == YES || getFirstFlag == YES){
        if countEnableFlag || getFirstFlag {
//        [queryArray addObject:[NSString stringWithFormat:@"limit=%d", 1]];
            queryArray.append("limit=1")
//    } else if (_limit > 0) {
        } else if limit > 0 {
//        [queryArray addObject:[NSString stringWithFormat:@"limit=%d", _limit]];
            queryArray.append("limit=\(limit)")
//    }
        }
//    if (_skip > 0){
        if skip > 0 {
//        [queryArray addObject:[NSString stringWithFormat:@"skip=%d", _skip]];
            queryArray.append("skip=\(skip)")
//    }
        }
//    if (_includeKey != nil){
        if let includedKey = self.includedKey {
//        [queryArray addObject:[NSString stringWithFormat:@"include=%@", _includeKey]];
            queryArray.append("include=\(includedKey)")
//    }
        }
//    if (countEnableFlag){
        if countEnableFlag {
//        [queryArray addObject:@"count=1"];
            queryArray.append("count=1")
//    }
        }
//    if (convertError){
//        return nil;
//    }
//    return [queryArray sortedArrayUsingSelector:@selector(compare:)];
        return queryArray.sorted()
//}
    }
//
///**
// NCMB形式の日付型NSDateFormatterオブジェクトを返す
// */
//-(NSDateFormatter*)createNCMBDateFormatter{
    private func createNCMBDateFormatter() -> DateFormatter {
//    return [NCMBDateFormat getIso8601DateFormat];
        return NCMBDateFormat.getIso8601DateFormat()
//}
    }
//
///**
// NCMBObjectをJSONに変換する
// @param obj NCMBオブジェクト
// */
//- (id)convertToJSONFromNCMBObject:(id)obj{
    private func convertToJSONFromNCMBObject(_ obj: Any?) -> Any {
//    if (obj == NULL){
        guard let obj = obj else {
//        //objがNULLだったら
//        return [NSNull null];
            return NSNull()
        }
        switch obj {
//    } else if ([obj isKindOfClass:[NSDate class]]){
        case let dateObj as Date:
//        //objが日付型だったら
//        NSMutableDictionary *jsonObj = [NSMutableDictionary dictionary];
//        [jsonObj setObject:@"Date" forKey:@"__type"];
//        NSDateFormatter *dateFormatter = [self createNCMBDateFormatter];
            let dateFormatter = self.createNCMBDateFormatter()
//        NSString *dateStr = [dateFormatter stringFromDate:obj];
            let jsonObj: [String: Any] = [
                "__type": "Date",
//        [jsonObj setObject:dateStr forKey:@"iso"];
                "iso": dateFormatter.string(from: dateObj)
            ]
//        return jsonObj;
            return jsonObj
//    } else if ([obj isKindOfClass:[NCMBGeoPoint class]]){
        case let geoPoint as NCMBGeoPoint:
//        //objが位置情報だったら
//        NCMBGeoPoint *geoPoint = obj;
//        NSMutableDictionary *jsonObj = [NSMutableDictionary dictionary];
            let jsonObj: [String: Any] = [
//        [jsonObj setObject:@"GeoPoint" forKey:@"__type"];
                "__type": "GeoPoint",
//        [jsonObj setObject:[NSNumber numberWithDouble:geoPoint.latitude] forKey:@"latitude"];
                "latitude": geoPoint.latitude,
//        [jsonObj setObject:[NSNumber numberWithDouble:geoPoint.longitude] forKey:@"longitude"];
                "longitude": geoPoint.longitude
            ]
//        return jsonObj;
            return jsonObj
//
//    } else if ([obj isKindOfClass:[NCMBObject class]]){
        case let ncmbObj as NCMBObject:
//        //objがポインタだったら
//        NCMBObject *ncmbObj = obj;
//        NSMutableDictionary *jsonObj = [NSMutableDictionary dictionary];
            let jsonObj: [String: Any] = [
//        [jsonObj setObject:@"Pointer" forKey:@"__type"];
                "__type": "Pointer",
//        [jsonObj setObject:[ncmbObj ncmbClassName] forKey:@"className"];
                "className": ncmbObj.ncmbClassName,
//        [jsonObj setObject:[ncmbObj objectId] forKey:@"objectId"];
                "objectId": ncmbObj.objectId as Any
            ]
//        return jsonObj;
            return jsonObj
//
//    } else if ([obj isKindOfClass:[NCMBRelation class]]){
        case let relation as NCMBRelation:
//        //objがリレーションだったら
//        NCMBRelation *relation = obj;
//        NCMBObject *parentObj = relation.parent;
            let parentObj = relation.parent
//        id convertObj = [self convertToJSONDicFromOperation:[parentObj currentOperations]];
            let convertObj = self.convertToJSONDicFromOperation(parentObj?.currentOperations())
//        return convertObj;
            return convertObj
//
//    } else if ([obj isKindOfClass:[NCMBACL class]]){
        case let acl as NCMBACL:
//        //objがACLだったら
//        NCMBACL *acl = obj;
//        if ([[acl dicACL] count] == 0){
            if acl.dicACL.isEmpty {
//            return [NSNull null];
                return NSNull()
//        } else {
            } else {
//            return [acl dicACL];
                return acl.dicACL
//        }
            }
//    } else if ([obj isKindOfClass:[NSDictionary class]]){
        case let dic as [String: Any]:
//        NSMutableDictionary *jsonObj = [NSMutableDictionary dictionary];
            var jsonObj: [String: Any] = [:]
//        //objがNSDictionaryだったら再帰呼び出し
//        for (id Key in [obj keyEnumerator]){
            for (key, value) in dic {
//            id convertedObj = [self convertToJSONFromNCMBObject:[obj objectForKey:Key]];
                let convertedObj = self.convertToJSONFromNCMBObject(value)
//            [jsonObj setObject:convertedObj forKey:Key];
                jsonObj[key] = convertedObj
//        }
            }
//        return jsonObj;
            return jsonObj
//    } else if ([obj isKindOfClass:[NSArray class]]){
        case let arr as [Any]:
//        NSMutableArray *array = [NSMutableArray array];//[NSMutableArray arrayWithObject:obj];
//        for (int i = 0; i < [obj count]; i++){
//            //objがNSArrayだったら再帰呼び出し
//            array[i] = [self convertToJSONFromNCMBObject:obj[i]];
//        }
//        return array;
            return arr.map {self.convertToJSONFromNCMBObject($0)}
//    } else if ([obj isKindOfClass:[NSSet class]]){
        case let currentSet as Set<AnyHashable>:
//        NSMutableSet *currentSet = [NSMutableSet setWithObject:obj];
//        NSMutableSet *set = [NSMutableSet set];
            var set: Set<AnyHashable> = []
//        for (id value in [currentSet objectEnumerator]){
            for value in currentSet {
//            //objがNSSetだったら再帰呼び出し
//            [set addObject:[self convertToJSONFromNCMBObject:value]];
                set.insert(self.convertToJSONFromNCMBObject(value) as! AnyHashable)
//        }
            }
//        return set;
            return set
//
//    } else if ([obj isKindOfClass:[NCMBQuery class]]){
        case let query as NCMBQuery:
//        NCMBQuery *query = (NCMBQuery*)obj;
//        NSMutableDictionary *jsonQuery = [NSMutableDictionary dictionary];
//        NSMutableDictionary *subQuery = [NSMutableDictionary dictionary];
            var subQuery: [String: Any] = [:]
//        for (NSString *queryKey in [[query.query allKeys] objectEnumerator]){
            for (queryKey, value) in query.query {
//            //セットされたサブクエリの内容をすべてJSONに変換
//            [subQuery setObject:[self convertToJSONFromNCMBObject:[query.query objectForKey:queryKey]]
                subQuery[queryKey] = self.convertToJSONFromNCMBObject(value)
//                        forKey:queryKey];
//        }
            }
            var jsonQuery: [String: Any] = [
//        [jsonQuery setObject:subQuery forKey:@"where"];
                "where": subQuery,
//        [jsonQuery setObject:query.ncmbClassName forKey:@"className"];
                "className": query.ncmbClassName
            ]
//        if (query.limit > 0){
            if query.limit > 0 {
//            [jsonQuery setObject:[NSNumber numberWithInt:query.limit] forKey:@"limit"];
                jsonQuery["limit"] = query.limit
//        }
            }
//        if (query.skip > 0){
            if query.skip > 0 {
//            [jsonQuery setObject:[NSNumber numberWithInt:query.skip] forKey:@"skip"];
                jsonQuery["skip"] = query.skip
//        }
            }
//        return jsonQuery;
            return jsonQuery
//    }
        default:
            break
        }
//    //その他の型(文字列、数値、真偽値)はそのまま返却
//    return obj;
        return obj
//}
    }
//
///**
// 操作履歴からDictionary作成
// @param operations オブジェクトの操作履歴を保持するNSMutableDictionaryオブジェクト
// */
//-(NSMutableDictionary *)convertToJSONDicFromOperation:(NSMutableDictionary*)operations{
    private func convertToJSONDicFromOperation(_ operations: NCMBOperationSet?) -> [String: Any] {
//
//    NSMutableDictionary *jsonDic = [[NSMutableDictionary alloc]init];
        var jsonDic: [String: Any] = [:]
//    for (id key in [operations keyEnumerator]) {
        for (key, operation) in operations ?? [:] {
//        //各操作をREST APIの形式に変換してセットする
//        [jsonDic setObject:[[operations valueForKey:key] encode] forKey:key];
            jsonDic[key] = operation.encode()
//    }
        }
//    return jsonDic;
        return jsonDic
//}
    }
//
///**
// JSONオブジェクトをNCMBObjectに変換する
// @param jsonData JSON形式のデータ
// */
//- (id)convertToNCMBObjectFromJSON:(id)jsonData convertKey:(NSString *)convertKey{
    private func convertToNCMBObjectFromJSON(_ jsonData: Any?, convertKey: String?) -> Any? {
//    if (jsonData == NULL){
        guard let jsonData = jsonData else {
//        //objがNULLだったら
//        return nil;
            return nil
        }
//    } else if ([jsonData isKindOfClass:[NSDictionary class]]){
        if let jsonDic = jsonData as? [String: Any] {
//        if ([jsonData objectForKey:@"__type"]){
            if let typeStr = jsonDic["__type"] as? String {
//            NSString *typeStr = [jsonData objectForKey:@"__type"];
                switch typeStr {
//            if ([typeStr isEqualToString:@"Date"]){
                case "Date":
//                //objが日付型だったら
//                NSString *iso = [jsonData objectForKey:@"iso"];
                    if let iso = jsonDic["iso"] as? String {
//                NSDateFormatter *dateFormatter = [self createNCMBDateFormatter];
                        let dateFormatter = self.createNCMBDateFormatter()
//                NSDate *date = [dateFormatter dateFromString:iso];
                        let date = dateFormatter.date(from: iso)
//                return date;
                        return date
                    }
//            } else if ([typeStr isEqualToString:@"GeoPoint"]){
                case "GeoPoint":
//                //objが位置情報だったら
//                NCMBGeoPoint *geoPoint = [[NCMBGeoPoint alloc] init];
                    let geoPoint = NCMBGeoPoint(
//                geoPoint.latitude = [[jsonData objectForKey:@"latitude"] doubleValue];
                    latitude: jsonDic["latitude"] as? Double ?? 0.0,
//                geoPoint.longitude = [[jsonData objectForKey:@"longitude"] doubleValue];
                        longitude: jsonDic["longitude"] as? Double ?? 0.0)
//                return geoPoint;
                    return geoPoint
//            } else if ([typeStr isEqualToString:@"Pointer"]){
                case "Pointer":
//                //objがポインタだったら
//                id obj = [NCMBObject convertClass:jsonData
                    let obj = NCMBObject.convertClass(jsonDic,
//                              ncmbClassName:[jsonData objectForKey:@"className"]];
                        ncmbClassName: jsonDic["className"] as! String)
//
//                /*
//                NCMBObject *obj = [NCMBObject objectWithClassName:[jsonData objectForKey:@"className"]
//                                                         objectId:[jsonData objectForKey:@"objectId"]];
//                 */
//                return obj;
                    return obj
//            } else if ([typeStr isEqualToString:@"Relation"]){
                case "Relation":
//                //objがリレーションだったら
                    break
//            } else if ([typeStr isEqualToString:@"Object"]){
                case "Object":
//                id obj = [NCMBObject convertClass:jsonData ncmbClassName:[jsonData objectForKey:@"className"]];
                    let obj = NCMBObject.convertClass(jsonDic, ncmbClassName: jsonDic["className"] as! String)
//                return obj;
                    return obj
//            }
                default:
                    break
                }
//        } else if ([jsonData objectForKey:@"acl"]){
            } else if let dicACL = jsonDic["acl"] as? [String: [String: Bool]] {
//            //objがACLだったら
//            NCMBACL *acl = [[NCMBACL alloc] init];
                let acl = NCMBACL()
//            acl.dicACL = [jsonData objectForKey:@"acl"];
                acl.dicACL = dicACL
//            return acl;
                return acl
//        } else {
            } else {
//            //objがNSDictionaryだったら再帰呼び出し
//            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
                var dic: [String: Any] = [:]
//            for (NSString *key in [jsonData keyEnumerator]){
                for (key, value) in jsonDic {
//                id convertedObj = [self convertToNCMBObjectFromJSON:[jsonData objectForKey:key] convertKey:key];
                    let convertedObj = self.convertToNCMBObjectFromJSON(value, convertKey: key)
//                [dic setObject:convertedObj forKey:key];
                    dic[key] = convertedObj
//            }
                }
//            return dic;
                return dic
//        }
            }
//    } else if ([jsonData isKindOfClass:[NSArray class]]){
        } else if let jsonArray = jsonData as? [Any] {
//        //NSMutableArray *jsonArray = [NSMutableArray arrayWithObject:jsonData];
//        NSMutableArray *array = [NSMutableArray array];
//        for (int i = 0; i < [jsonData count]; i++){
//            //objがNSArrayだったら再帰呼び出し
//            array[i] = [self convertToNCMBObjectFromJSON:jsonData[i] convertKey:nil];
//        }
//        return array;
            return jsonArray.map {self.convertToNCMBObjectFromJSON($0, convertKey: nil)!}
//    } else if ([jsonData isKindOfClass:[NSSet class]]){
        } else if let currentSet = jsonData as? Set<AnyHashable> {
//        NSMutableSet *currentSet = [NSMutableSet setWithObject:jsonData];
//        NSMutableSet *set = [NSMutableSet set];
            var set: Set<AnyHashable> = []
//        for (id value in [currentSet objectEnumerator]){
            for value in currentSet {
//            //objがNSSetだったら再帰呼び出し
//            [set addObject:[self convertToNCMBObjectFromJSON:value convertKey:nil]];
                set.insert(self.convertToNCMBObjectFromJSON(value, convertKey: nil) as! AnyHashable)
//        }
            }
//        return set;
            return set
//
//    }
        }
//    //その他の型(文字列、数値、真偽値)はそのまま返却
//    return jsonData;
        return jsonData
//}
    }
//
//- (NSDictionary*)getQueryDictionary{
    internal func getQueryDictionary() -> [String: Any] {
//    //return [self checkQueryDictionary:_query];
//    return _query;
        return query
//}
    }
//
//// コールバック実行
//- (void)executeUserCallback:(NCMBArrayResultBlock)userCallback array:(NSArray*)array error:(NSError*)error{
//    if(userCallback){
//        userCallback(array,error);
//    }
//}
//
//@end
}
