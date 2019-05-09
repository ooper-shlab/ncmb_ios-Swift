//
//  NCMBObject.swift
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
//#import "NCMBConstants.h"
//@class NCMBRelation;
//@class NCMBUser;
//@class NCMBRole;
//@class NCMBACL;
//

private func toOpaque<FuncType>(_ f: FuncType) -> OpaquePointer {
    return unsafeBitCast(f, to: OpaquePointer.self)
}

//MARK: - getter
//プロパティの型ごとに設定

private let dynamicGetter: @convention(c) (NCMBObject,Selector)-> AnyObject? =
{ this, _cmd in
    let name = NSStringFromSelector(_cmd)
    let result = this.value(forKey: "estimatedData") as AnyObject?
    return result?.value(forKey: name) as AnyObject?
}

//static NCMBRelation* dynamicGetterRelation(id self, SEL _cmd) {
private let dynamicGetterRelation: @convention(c) (NCMBObject,Selector) -> NCMBRelation?  =
{ this, _cmd in
//    NSString *name = NSStringFromSelector(_cmd);
    let name = NSStringFromSelector(_cmd)
//    NCMBRelation *relation = [self relationforKey:name];
    let relation = this.relation(forKey: name)
//    return relation;
    return relation
//}
}
//
//static int dynamicGetterInt(id self, SEL _cmd) {
private let dynamicGetterInt: @convention(c) (NCMBObject,Selector) -> Int32 =
{ this, _cmd in
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
    let name = NSStringFromSelector(_cmd)
//    result = [self valueForKey:@"estimatedData"];
    let result = this.value(forKey: "estimatedData") as AnyObject?
//    int i = [(NSNumber*)[result valueForKey:name] intValue];
    let i = (result?.value(forKey: name) as? NSNumber)?.int32Value ?? 0
//    return i;
    return i
//}
}
//
//static float dynamicGetterFloat(id self, SEL _cmd) {
private let dynamicGetterFloat: @convention(c) (NCMBObject,Selector) -> Float =
{ this, _cmd in
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
    let name = NSStringFromSelector(_cmd)
//    result = [self valueForKey:@"estimatedData"];
    let result = this.value(forKey: "estimatedData") as AnyObject?
//    float f = [(NSNumber*)[result valueForKey:name] floatValue];
    let f = (result?.value(forKey: name) as? NSNumber)?.floatValue ?? 0
//    return f;
    return f
//}
}
//
//static BOOL dynamicGetterBOOL(id self, SEL _cmd) {
private let dynamicGetterBOOL: @convention(c) (NCMBObject,Selector) -> Bool =
{ this, _cmd in
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
    let name = NSStringFromSelector(_cmd)
//    result = [self valueForKey:@"estimatedData"];
    let result = this.value(forKey: "estimatedData") as AnyObject?
//    BOOL flag = [(NSNumber*)[result valueForKey:name] boolValue];
    let b = result?.value(forKey: name) as? Bool ?? false
//    return flag;
    return b
//}
}
//
//static double dynamicGetterDouble(id self, SEL _cmd) {
private let dynamicGetterDouble: @convention(c) (NCMBObject,Selector) -> Double =
{ this, _cmd in
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
    let name = NSStringFromSelector(_cmd)
//    result = [self valueForKey:@"estimatedData"];
    let result = this.value(forKey: "estimatedData") as AnyObject?
//    double d = [(NSNumber*)[result valueForKey:name] doubleValue];
    let d = (result?.value(forKey: name) as? NSNumber)?.doubleValue ?? 0.0
//    return d;
    return d
//}
}
//
//static double dynamicGetterLong(id self, SEL _cmd) {
private let dynamicGetterLong: @convention(c) (NCMBObject,Selector) -> Double =
{ this, _cmd in
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
    let name = NSStringFromSelector(_cmd)
//    result = [self valueForKey:@"estimatedData"];
    let result = this.value(forKey: "estimatedData") as AnyObject?
//    long int l = [(NSNumber*)[result valueForKey:name] longValue];
    let l = (result?.value(forKey: name) as? NSNumber)?.intValue ?? 0
//    return l;
    return Double(l)
//}
}
//
//static short dynamicGetterShort(id self, SEL _cmd) {
private let dynamicGetterShort: @convention(c) (NCMBObject,Selector) -> Double =
{ this, _cmd in
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
    let name = NSStringFromSelector(_cmd)
//    result = [self valueForKey:@"estimatedData"];
    let result = this.value(forKey: "estimatedData") as AnyObject?
//    short s = [(NSNumber*)[result valueForKey:name] shortValue];
    let s = (result?.value(forKey: name) as? NSNumber)?.int16Value ?? 0
//    return s;
    return Double(s)
//}
}
//
//static double dynamicGetterLongLong(id self, SEL _cmd) {
private let dynamicGetterLongLong: @convention(c) (NCMBObject,Selector) -> Double =
{ this, _cmd in
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
    let name = NSStringFromSelector(_cmd)
//    result = [self valueForKey:@"estimatedData"];
    let result = this.value(forKey: "estimatedData") as AnyObject?
//    long long int ll = [(NSNumber*)[result valueForKey:name] longLongValue];
    let ll = (result?.value(forKey: name) as? NSNumber)?.int64Value ?? 0
//    return ll;
    return Double(ll)
//}
}
//MARK: - setter

///"setUxxx:" -> "lxxx"
private func propertyName(fromSetter setterName: String) -> String {
    return setterName.dropFirst(3).first!.lowercased() + setterName.dropFirst(4).dropLast()
}
//プロパティの型ごとに設定
//static void dynamicSetter(id self, SEL _cmd, id value) {
private let dynamicSetter: @convention(c) (NCMBObject,Selector,AnyObject?)->Void =
{ this, _cmd, value in
//    NSString *setter    = NSStringFromSelector(_cmd);
    let setter = NSStringFromSelector(_cmd)
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
    let name = propertyName(fromSetter: setter)
//    [self setObject:value forKey:name];
    this.setObject(value, forKey: name)
//}
}
//
//static void dynamicSetterInt(id self, SEL _cmd, int value) {
private let dynamicSetterInt: @convention(c) (NCMBObject,Selector,Int32)->Void =
{ this, _cmd, value in
//    NSString *setter    = NSStringFromSelector(_cmd);
    let setter = NSStringFromSelector(_cmd)
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
    let name = propertyName(fromSetter: setter)
//    NSNumber *num = [NSNumber numberWithInt:value];
    let num = NSNumber(value: value)
//    [self setObject:num forKey:name];
    this.setObject(num, forKey: name)
//}
}
//
//
//static void dynamicSetterFloat(id self, SEL _cmd, float value) {
private let dynamicSetterFloat: @convention(c) (NCMBObject,Selector,Float)->Void =
{ this, _cmd, value in
//    NSString *setter    = NSStringFromSelector(_cmd);
    let setter = NSStringFromSelector(_cmd)
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
    let name = propertyName(fromSetter: setter)
//    NSNumber *num = [NSNumber numberWithFloat:value];
    let num = NSNumber(value: value)
//    [self setObject:num forKey:name];
    this.setObject(num, forKey: name)
//}
}
//
//static void dynamicSetterBOOL(id self, SEL _cmd, BOOL value) {
private let dynamicSetterBOOL: @convention(c) (NCMBObject,Selector,Bool)->Void =
{ this, _cmd, value in
//    NSString *setter    = NSStringFromSelector(_cmd);
    let setter = NSStringFromSelector(_cmd)
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
    let name = propertyName(fromSetter: setter)
//    NSNumber *num = [NSNumber numberWithBool:value];
    let num = NSNumber(value: value)
//    [self setObject:num forKey:name];
    this.setObject(num, forKey: name)
//}
}
//
//static void dynamicSetterDouble(id self, SEL _cmd, double value) {
private let dynamicSetterDouble: @convention(c) (NCMBObject,Selector,Double)->Void =
{ this, _cmd, value in
//    NSString *setter    = NSStringFromSelector(_cmd);
    let setter = NSStringFromSelector(_cmd)
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
    let name = propertyName(fromSetter: setter)
//    NSNumber *num = [NSNumber numberWithDouble:value];
    let num = NSNumber(value: value)
//    [self setObject:num forKey:name];
    this.setObject(num, forKey: name)
//}
}
//
//static void dynamicSetterLong(id self, SEL _cmd, long int value) {
private let dynamicSetterLong: @convention(c) (NCMBObject,Selector,Int)->Void =
{ this, _cmd, value in
//    NSString *setter    = NSStringFromSelector(_cmd);
    let setter = NSStringFromSelector(_cmd)
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
    let name = propertyName(fromSetter: setter)
//    NSNumber *num = [NSNumber numberWithLong:value];
    let num = NSNumber(value: value)
//    [self setObject:num forKey:name];
    this.setObject(num, forKey: name)
//}
}
//static void dynamicSetterShort(id self, SEL _cmd, short value) {
private let dynamicSetterShort: @convention(c) (NCMBObject,Selector,Int16)->Void =
{ this, _cmd, value in
//    NSString *setter    = NSStringFromSelector(_cmd);
    let setter = NSStringFromSelector(_cmd)
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
    let name = propertyName(fromSetter: setter)
//    NSNumber *num = [NSNumber numberWithShort:value];
    let num = NSNumber(value: value)
//    [self setObject:num forKey:name];
    this.setObject(num, forKey: name)
//}
}
//static void dynamicSetterLongLong(id self, SEL _cmd, long long int value) {
private let dynamicSetterLongLong: @convention(c) (NCMBObject,Selector,Int64)->Void =
{ this, _cmd, value in
//    NSString *setter    = NSStringFromSelector(_cmd);
    let setter = NSStringFromSelector(_cmd)
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
    let name = propertyName(fromSetter: setter)
//    NSNumber *num = [NSNumber numberWithLongLong:value];
    let num = NSNumber(value: value)
//    [self setObject:num forKey:name];
    this.setObject(num, forKey: name)
//}
}



//
///**
// NCMBObjectクラスは、ニフクラ mobile backendとアプリ間のデータの送受信を管理するクラスです。
// アプリケーション内オブジェクトの取得・保存・削除などを管理するメインのクラスです。
// */
//@interface NCMBObject : NSObject{
open class NCMBObject: NSObject {
//    NSMutableArray *operationSetQueue;
    private var operationSetQueue: [NCMBOperationSet] = []
//    NSMutableDictionary *estimatedData;
    internal var estimatedData: [String: Any] = [:]
//    NSMutableDictionary *serverData;
//}
//
//
///** @name Create */
//
///**
// クラス名を指定してNCMBObjectのインスタンスを生成
// @param className 指定するクラス名
// */
//- (id)initWithClassName:(NSString *)className;
//
///**
// 指定されたクラス名でNCMBObjectのインスタンスを作成する
// @param className 指定するクラス名
// */
//+(NCMBObject*)objectWithClassName:(NSString *)className;
//
//
///** @name Object */
//
///// objectId オブジェクトのobjectID（ニフクラ mobile backend上で自動的に生成）
//@property (nonatomic) NSString *objectId;
    public var objectId: String?
//
///// updatedAt オブジェクトの更新日時
//@property (nonatomic, readonly) NSDate *updateDate;
    private(set) public var updateDate: Date?
//
///// createdAt オブジェクトの登録日時
//@property (nonatomic, readonly) NSDate *createDate;
    private(set) public var createDate: Date?
//
///// ACL オブジェクトのアクセス権限情報
//@property (nonatomic) NCMBACL *ACL;
    private var _acl: NCMBACL?
//
///// ncmbClassName オブジェクトのクラス名
//@property (nonatomic, readonly) NSString *ncmbClassName;
    private(set) public var ncmbClassName: String
//
//
//
///**
// オブジェクトのキーを取得する。
// @return オブジェクトのキーが格納された配列
// */
//- (NSArray *)allKeys;
//
///**
// キーで指定した値を取得する
// @param key 指定するキー
// @return 指定されたキーの値
// */
//- (id)objectForKey:(NSString *)key;
//
///**
// オブジェクトにACLを設定する
// @param acl 設定するACLオブジェクト
// */
////- (void)setACL:(NCMBACL *)acl;
//
///**
// 指定したキーに指定したオブジェクトを設定
// @param object 設定するオブジェクト
// @param key 指定するキー
// */
//- (void)setObject:(id)object forKey:(NSString *)key;
//
///**
// キーで指定された配列の末尾にオブジェクトを追加
// @param object 追加するオブジェクト
// @param key 追加する配列のキー
// */
//- (void)addObject:(id)object forKey:(NSString *)key;
//
///**
// キーで指定された配列の末尾に複数のオブジェクトを追加
// @param objects 追加する複数のオブジェクト
// @param key 追加する配列のキー
// */
//- (void)addObjectsFromArray:(NSArray *)objects forKey:(NSString *)key;
//
///**
// キーで指定した配列に指定したオブジェクトを追加する。オブジェクトの順序は保証されない。
//
// また、追加したオブジェクトが配列内に既に存在した場合は追加されません。
// @param object 追加するオブジェクト
// @param key 追加する配列のキー
// */
//- (void)addUniqueObject:(id)object forKey:(NSString *)key;
//
///**
// キーで指定した配列に指定した複数のオブジェクトを追加する。オブジェクトの順序は保証されない。
//
// また、追加したオブジェクトが配列内に既に存在した場合は追加されない。
// @param objects 追加する複数のオブジェクト
// @param key 追加する配列のキー
// */
//- (void)addUniqueObjectsFromArray:(NSArray *)objects forKey:(NSString *)key;
//
///**
// 指定したキーの値に１を足す。未登録のものは新規登録される。デフォルト値は１。
// @param key 指定するキー
// */
//- (void)incrementKey:(NSString *)key;
//
///**
// 指定したキーの値にamountで指定した増減値を加える。未登録のものは新規登録される。デフォルトは０に増減値を加えた値になる。
// @param key 指定するキー
// @param amount 増減値
// */
//- (void)incrementKey:(NSString *)key byAmount:(NSNumber *)amount;
//
///**
// 指定したキーに設定された値から、指定されたオブジェクトを削除
// @param object 削除するオブジェクト
// @param key 指定するキー
// */
//- (void)removeObject:(id)object forKey:(NSString *)key;
//
///**
// 指定したキーに設定された値から、指定された配列に含まれるオブジェクトと一致するものを削除
// @param objects 削除する複数のオブジェクト
// @param key 指定するキー
// */
//- (void)removeObjectsInArray:(NSArray *)objects forKey:(NSString *)key;
//
//
///**
// 指定したキーに設定された値を全て削除する
// @param key 指定するキー
// */
//-(void)removeObjectForKey:(NSString *)key;
//
///**
// 指定したキーのリレーションを取得する
// @param key 指定するキー
// @return NCMBRelationのインスタンス
// */
//- (NCMBRelation *)relationforKey:(NSString *)key;
//
//# pragma mark - save
///** @name Save */
//
///**
// mobile backendにオブジェクトを保存する。エラーをセットし、エラー内容を見る事もできる。
// @param error エラーを保持するポインタ
// */
//- (void)save:(NSError **)error;
//
///**
// mobile backendにオブジェクトを保存する。非同期通信を行う。
// @param userBlock 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)saveInBackgroundWithBlock:(NCMBErrorResultBlock)userBlock;
//
///**
// 非同期通信を利用してmobile backendにオブジェクトを保存する。通信後は指定されたセレクタを実行する。
// @param target APIリクエスト後に実行するターゲット
// @param selector APIリクエスト後に実行するセレクタ
// */
//- (void)saveInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
///**
// 電波状況を見てmobile backendにオブジェクトを保存する。
//
// 通信できない場合は、次回オンライン時に保存される。
//
// 保存処理が完了する前にアプリが終了した場合は、次回アプリ起動後オンライン時に保存される。
//
// この場合再度処理を実行しても指定したコールバックは実行されない。
//
// @param callback saveEventuallyを実行したあとに呼び出されるcallback。
//
// callbackは次の引数を持つ必要がある（NSError *error）
//
// saveEventually実行時にオフラインだった場合はerrorにnilが渡される
// */
//- (void)saveEventually:(NCMBErrorResultBlock)callback;
//
//MARK: refresh
//
///**
// 同期通信を利用してmobile backendからobjectIdをキーにしてデータを取得する。
//
// refreshを実行する前にセットされた値はリセットされる。
// @param error エラーを保持するポインタ
// */
//- (void)refresh:(NSError **)error;
//
///**
// 非同期通信を利用してmobile backendからobjectIdをキーにしてデータを取得し、指定されたコールバックを呼び出す。
//
// refreshを実行する前にセットされた値はリセットされる。
// @param block 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)refreshInBackgroundWithBlock:(NCMBErrorResultBlock)block;
//
///**
// 非同期通信を利用してmobile backendからobjectIdをキーにしてデータを取得し、指定されたセレクタを呼び出す。
//
// refreshを実行する前にセットされた値はリセットされる。
// @param target 呼び出すセレクタのターゲット
// @param selector 実行するセレクタ
// */
//- (void)refreshInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
//MARK: fetch
//
///**
// 同期通信を利用してmobile backendからobjectIdをキーにしてデータを取得する。
//
// fetchを実行する前にセットされた値と統合されるが、サーバー上にすでにキーがあった値は上書きされる。
// @param error エラーを保持するポインタ
// */
//- (void)fetch:(NSError **)error;
//
///**
// 非同期通信を利用してmobile backendからobjectIdをキーにしてデータを取得し、指定されたコールバックを呼び出す。
//
// fetchを実行する前にセットされた値と統合されるが、サーバー上にすでにキーがあった値は上書きされる。
// @param block 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)fetchInBackgroundWithBlock:(NCMBErrorResultBlock)block;
//
///**
// 非同期通信を利用してmobile backendからobjectIdをキーにしてデータを取得し、指定されたセレクタを呼び出す。
//
// fetchを実行する前にセットされた値と統合されるが、サーバー上にすでにキーがあった値は上書きされる。
// @param target 呼び出すセレクタのターゲット
// @param selector 実行するセレクタ
// */
//- (void)fetchInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
//
//MARK: delete
//
///**
// 同期通信を利用してオブジェクトをmobile backendとローカル上から削除する。
// @param error エラーを保持するポインタ
// */
//- (void)delete:(NSError**)error;
//
//
///**
// 非同期通信を利用してオブジェクトをmobile backendとローカル上から削除し、指定されたコールバックを呼び出す。
// @param userBlock 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)deleteInBackgroundWithBlock:(NCMBErrorResultBlock)userBlock;
//
//
///**
// 非同期通信を利用してオブジェクトをmobile backendとローカル上から削除し、指定されたセレクタを呼び出す。
// @param target 呼び出すセレクタのターゲット
// @param selector 実行するセレクタ
// */
//- (void)deleteInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
///**
// 通信状況を見てmobile backendからオブジェクトを削除する。
//
// 通信できない場合は、次回オンライン時に削除される。
//
// 削除処理が実行される前にアプリが終了した場合は、次回アプリ起動後オンライン時に削除される。
//
// この場合再度処理を実行しても指定したコールバックは実行されない。
//
// @param callback saveEventuallyを実行したあとに呼び出されるcallback。
//
// callbackは次の引数を持つ必要がある（NSError *error）
//
// deleteEventually実行時にオフラインだった場合はerrorにnilが渡される
// */
//- (void)deleteEventually:(NCMBErrorResultBlock)callback;
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
//#import "NCMBReachability.h"
//
//#import "NCMBSetOperation.h"
//#import "NCMBIncrementOperation.h"
//#import "NCMBAddOperation.h"
//#import "NCMBAddUniqueOperation.h"
//#import "NCMBRemoveOperation.h"
//#import "NCMBDeleteOperation.h"
//
//#import "SubClassHandler.h"
//#import <objc/runtime.h>
//#import "NCMBDateFormat.h"
//
//@interface NCMBObject(){
//    dispatch_semaphore_t semaphore;
    private var __semaphore: DispatchSemaphore?
//}
//@end
//
//MARK: - getter
////プロパティの型ごとに設定
//
//static id dynamicGetter(id self, SEL _cmd) {
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
//    result = [self valueForKey:@"estimatedData"];
//    return [result valueForKey:name];
//}
//
//static NCMBRelation* dynamicGetterRelation(id self, SEL _cmd) {
//    NSString *name = NSStringFromSelector(_cmd);
//    NCMBRelation *relation = [self relationforKey:name];
//    return relation;
//}
//
//static int dynamicGetterInt(id self, SEL _cmd) {
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
//    result = [self valueForKey:@"estimatedData"];
//    int i = [(NSNumber*)[result valueForKey:name] intValue];
//    return i;
//}
//
//static float dynamicGetterFloat(id self, SEL _cmd) {
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
//    result = [self valueForKey:@"estimatedData"];
//    float f = [(NSNumber*)[result valueForKey:name] floatValue];
//    return f;
//}
//
//static BOOL dynamicGetterBOOL(id self, SEL _cmd) {
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
//    result = [self valueForKey:@"estimatedData"];
//    BOOL flag = [(NSNumber*)[result valueForKey:name] boolValue];
//    return flag;
//}
//
//static double dynamicGetterDouble(id self, SEL _cmd) {
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
//    result = [self valueForKey:@"estimatedData"];
//    double d = [(NSNumber*)[result valueForKey:name] doubleValue];
//    return d;
//}
//
//static double dynamicGetterLong(id self, SEL _cmd) {
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
//    result = [self valueForKey:@"estimatedData"];
//    long int l = [(NSNumber*)[result valueForKey:name] longValue];
//    return l;
//}
//
//static short dynamicGetterShort(id self, SEL _cmd) {
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
//    result = [self valueForKey:@"estimatedData"];
//    short s = [(NSNumber*)[result valueForKey:name] shortValue];
//    return s;
//}
//
//static double dynamicGetterLongLong(id self, SEL _cmd) {
//    id result = nil;
//    NSString* name = NSStringFromSelector(_cmd);
//    result = [self valueForKey:@"estimatedData"];
//    long long int ll = [(NSNumber*)[result valueForKey:name] longLongValue];
//    return ll;
//}
//MARK: - setter
////プロパティの型ごとに設定
//static void dynamicSetter(id self, SEL _cmd, id value) {
//    NSString *setter    = NSStringFromSelector(_cmd);
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
//    [self setObject:value forKey:name];
//}
//
//static void dynamicSetterInt(id self, SEL _cmd, int value) {
//    NSString *setter    = NSStringFromSelector(_cmd);
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
//    NSNumber *num = [NSNumber numberWithInt:value];
//    [self setObject:num forKey:name];
//}
//
//
//static void dynamicSetterFloat(id self, SEL _cmd, float value) {
//    NSString *setter    = NSStringFromSelector(_cmd);
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
//    NSNumber *num = [NSNumber numberWithFloat:value];
//    [self setObject:num forKey:name];
//}
//
//static void dynamicSetterBOOL(id self, SEL _cmd, BOOL value) {
//    NSString *setter    = NSStringFromSelector(_cmd);
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
//    NSNumber *num = [NSNumber numberWithBool:value];
//    [self setObject:num forKey:name];
//}
//
//static void dynamicSetterDouble(id self, SEL _cmd, double value) {
//    NSString *setter    = NSStringFromSelector(_cmd);
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
//    NSNumber *num = [NSNumber numberWithDouble:value];
//    [self setObject:num forKey:name];
//}
//
//static void dynamicSetterLong(id self, SEL _cmd, long int value) {
//    NSString *setter    = NSStringFromSelector(_cmd);
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
//    NSNumber *num = [NSNumber numberWithLong:value];
//    [self setObject:num forKey:name];
//}
//static void dynamicSetterShort(id self, SEL _cmd, short value) {
//    NSString *setter    = NSStringFromSelector(_cmd);
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
//    NSNumber *num = [NSNumber numberWithShort:value];
//    [self setObject:num forKey:name];
//}
//static void dynamicSetterLongLong(id self, SEL _cmd, long long int value) {
//    NSString *setter    = NSStringFromSelector(_cmd);
//    NSString *name  = [[[setter substringWithRange:NSMakeRange(3, 1)] lowercaseString]
//                       stringByAppendingString:[setter substringWithRange:NSMakeRange(4, setter.length - 5)]];
//    NSNumber *num = [NSNumber numberWithLongLong:value];
//    [self setObject:num forKey:name];
//}
//
//
//@implementation NCMBObject
//
//
//MARK: - Subclass
//+ (id)object{
    open class func object() -> NCMBObject {
        guard let subclassingType = self as? (NCMBObject&NCMBSubclassing).Type else {
            fatalError("This type is not NCMBSubclassing conformant")
        }
//    id object = [[[self class] alloc] initWithClassName:[[self class] ncmbClassName]];
        let object = subclassingType.init() //### `NCMBSubclassing` should override `init()`
//    return object;
        return object
//}
    }
//+ (id)objectWithoutDataWithObjectId:(NSString *)objectId{
    open class func objectWithoutData(objectId: String) -> NCMBObject {
//    id object = [[[self class] alloc] init];
        let object = self.init()
//    [object setObjectId:objectId];
        object.objectId = objectId
//
//    return object;
        return object
//}
    }
//
//+ (NCMBQuery *)query{
    open class func query() -> NCMBQuery {
        guard let subclassingType = self as? NCMBSubclassing.Type else {
            fatalError("This type is not NCMBSubclassing conformant")
        }
//    NCMBQuery *query = [NCMBQuery queryWithClassName:[[self class] ncmbClassName]];
        let query = NCMBQuery(className: subclassingType.ncmbClassName)
        
//    return query;
        return query
//}
    }
//
//+ (void)registerSubclass{
    open class func registerSubclass() {
        guard let subclassingType = self as? NCMBSubclassing.Type else {
            fatalError("This type is not NCMBSubclassing conformant")
        }
//
//    [Subclass_Handler setSubClassName:NSStringFromClass([self class]) ncmbClassName:[[self class] ncmbClassName]];
        Subclass_Handler.setSubClassName(NSStringFromClass(self), ncmbClassName: subclassingType.ncmbClassName)
//    unsigned int i, count;
        var count: UInt32 = 0
//    objc_property_t *properties = class_copyPropertyList([self class], &count);
        let properties = class_copyPropertyList(self, &count)
//    for (i = 0; i < count; i++) {
        for i in 0..<Int(count) {
//        objc_property_t property = properties[i];
            let property = properties![i]
//        const char* attrs = property_getAttributes(property);
            let attrs = property_getAttributes(property)
//        NSArray *k = [[NSString stringWithUTF8String:attrs] componentsSeparatedByString:@","];
            let k = String(cString: attrs!).components(separatedBy: ",")
//        //@dynamic修飾子のチェック
//        if ([k containsObject:@"D"]){
            if k.contains("D") {
//
//            const char *propName = property_getName(property);
                let propName = property_getName(property)
//            if(propName) {
//                NSString *propertyName = [NSString stringWithUTF8String:propName];
                let propertyName = String(cString: propName)
//pasteboardPropertyList(forType:)
//                NSString *getterName = propertyName;
                let getterName = propertyName
//                NSString *setterName = [NSString stringWithFormat:@"set%@%@:",
                let setterName = "set"
                    + propertyName.first!.uppercased()
                    + propertyName.dropFirst() + ":"
//                                        [[propertyName substringToIndex:1] uppercaseString],
//                                        [propertyName substringFromIndex:1]];
//
//                SEL getterSEL = NSSelectorFromString(getterName);
                let getterSEL = NSSelectorFromString(getterName)
//                SEL setterSEL = NSSelectorFromString(setterName);
                let setterSEL = NSSelectorFromString(setterName)
//
//                NSString* code = [k objectAtIndex:0];
                let code = k[0]
//                NSRange range = [code rangeOfString:@"NCMBRelation"];
                switch code {
//                if ([code isEqualToString:@"Ti"]) {
                case "Ti":
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetterInt, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetterInt), "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetterInt, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetterInt), "v@:@")
//                }else if ([code isEqualToString:@"Tf"]) {
                case "Tf":
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetterFloat, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetterFloat), "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetterFloat, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetterFloat), "v@:@")
                case "TB", "Tc":
//                }else if ([code isEqualToString:@"TB"] || [code isEqualToString:@"Tc"]){
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetterBOOL, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetterBOOL), "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetterBOOL, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetterBOOL), "v@:@")
//                }else if ([code isEqualToString:@"Td"]) {
                case "Td":
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetterDouble, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetterDouble), "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetterDouble, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetterDouble), "v@:@")
//                }else if ([code isEqualToString:@"Tl"]) {
                case "Tl":
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetterLong, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetterLong), "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetterLong, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetterLong), "v@:@")
//                }else if ([code isEqualToString:@"Ts"]) {
                case "Ts":
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetterShort, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetterShort), "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetterShort, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetterShort), "v@:@")
//                }else if ([code isEqualToString:@"Tq"]) {
                case "Tq":
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetterLongLong, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetterLongLong), "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetterLongLong, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetterLongLong), "v@:@")
//                } else if (range.location != NSNotFound) {
                case let code where code.contains("NCMBRelation"):
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetterRelation, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetterRelation), "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetter, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetter), "v@:@")
//                }else{
                default:
//                    class_addMethod(self, getterSEL, (IMP) dynamicGetter, "@@:");
                    class_addMethod(self, getterSEL, toOpaque(dynamicGetter) , "@@:")
//                    class_addMethod(self, setterSEL, (IMP) dynamicSetter, "v@:@");
                    class_addMethod(self, setterSEL, toOpaque(dynamicSetter) , "v@:@")
//                }
                }
//            }
//        }
            }
//    }
        }
//    free(properties);
        free(properties)
//}
    }
//
    //MARK: - 初期化
    
    //初期化
    public convenience required override init() {
        self.init(className: "")
    }


    //クラスネームを指定して初期化
    public init(className: String) { //### Do not want to make this required...
        self.ncmbClassName = className
        //データ操作履歴を管理
        operationSetQueue.append(NCMBOperationSet())
        
        //ローカルデータを管理
        
        //デフォルトACLの設定
        _acl = NCMBACL()
        //[self setACL:[NCMBACL ACL]];
        super.init()
    }

///**
// 指定されたクラス名でNCMBObjectのインスタンスを作成する
// @param className 指定するクラス名
// */
    //NOT implemented. Use `init(className:)` instead.
//+(instancetype)objectWithClassName:(NSString *)className{
//    return [[NCMBObject alloc] initWithClassName:className];
//}
//
///**
// Dictionaryを受け取ってNCMBObjectを返す
// */
//- (id)initWithData:(NSMutableDictionary*)attrs{
    private convenience init(data attrs: [String: Any]) {
//    self = [self init];
        self.init()
//    for(NSString *key in [attrs keyEnumerator]){
        for (key, value) in attrs {
            switch key {
//        if ([key isEqualToString:@"objectId"]){
            case "objectId":
//            self.objectId = [attrs objectForKey:key];
                self.objectId = value as? String
//        } else if ([key isEqualToString:@"className"]){
            case "className":
//            _ncmbClassName = [attrs objectForKey:key];
                ncmbClassName = value as? String ?? ""
//        } else if ([key isEqualToString:@"createDate"]){
            case "createDate":
//            NSDateFormatter *df = [self createNCMBDateFormatter];
                let df = self.createNCMBDateFormatter()
//            _createDate = [df dateFromString:[attrs objectForKey:key]];
                createDate = df.date(from: value as? String ?? "")
//        } else if ([key isEqualToString:@"updateDate"]){
            case "updateDate":
//            NSDateFormatter *df = [self createNCMBDateFormatter];
                let df = self.createNCMBDateFormatter()
//            _updateDate = [df dateFromString:[attrs objectForKey:key]];
                updateDate = df.date(from: value as? String ?? "")
//        } else if ([key isEqualToString:@"acl"]){
            case "acl":
//            _ACL.dicACL = [attrs objectForKey:key];
                acl?.dicACL = value as? [String: [String: Bool]] ?? [:]
//        } else {
            default:
//            [estimatedData setObject:[self convertToNCMBObjectFromJSON:[attrs objectForKey:key] convertKey:key]
//                              forKey:key];
                estimatedData[key] = self.convertToNCMBObjectFromJSON(value, convertKey: key)
//        }
            }
//    }
        }
//    return self;
//}
    }
//
//+ (NCMBObject *)objectWithClassName:(NSString*)className data:(NSDictionary *)attrs{
    internal convenience init(className: String?, data attrs: [String: Any]) {
//    NSMutableDictionary *objDic = [NSMutableDictionary dictionaryWithDictionary:attrs];
        var objDic = attrs
//    if (className != nil){
        if let className = className {
//        [objDic setObject:className forKey:@"className"];
            objDic["className"] = className
//    }
        }
//    return [[NCMBObject alloc] initWithData:objDic];
        self.init(data: objDic)
//}
    }
//
///**
// 指定されたクラス名とobjectIdでNCMBObjectのインスタンスを作成する
// @param className 指定するクラス名
// @param objectId 指定するオブジェクトID
// */
//+ (NCMBObject*)objectWithClassName:(NSString*)className objectId:(NSString*)objectId{
    internal convenience init(className: String, objectId: String) {
//    NCMBObject *obj = [[NCMBObject alloc] initWithClassName:className];
        self.init(className: className)
//    obj.objectId = objectId;
        self.objectId = objectId
//    return obj;
//}
    }
//
//-(NSString*)description{
    open override var description: String {
//    NSDictionary *jsonDic = [self getLocalData];
        let jsonDic = self.getLocalData()
//    NSError *error = nil;
        do {
//    NSData *json = [NSJSONSerialization dataWithJSONObject:jsonDic
            let json = try JSONSerialization.data(withJSONObject: jsonDic,
                                                  options: .prettyPrinted)
//                                                   options:NSJSONWritingPrettyPrinted
//                                                     error:&error];
//    return [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
            return String(data: json, encoding: .utf8)!
        } catch {
            return super.description
        }
//}
    }
//
//- (NSDictionary*)getLocalData{
    internal func getLocalData() -> [String: Any] {
//    NSMutableDictionary *returnDic = [NSMutableDictionary dictionaryWithDictionary:[self convertToJSONFromNCMBObject:estimatedData]];
        var returnDic = self.convertToJSONFromNCMBObject(estimatedData) as! [String: Any]
//    if (_objectId){
        if let objectId = self.objectId {
//        [returnDic setObject:_objectId forKey:@"objectId"];
            returnDic["objectId"] = objectId
//    }
        }
//    if (_createDate){
        if let createDate = self.createDate {
//        [returnDic setObject:[self convertToJSONFromNCMBObject:_createDate] forKey:@"createDate"];
            returnDic["createDate"] = self.convertToJSONFromNCMBObject(createDate)
//    }
        }
//    if (_updateDate){
        if let updateDate = self.updateDate {
//        [returnDic setObject:[self convertToJSONFromNCMBObject:_updateDate] forKey:@"updateDate"];
            returnDic["updateDate"] = self.convertToJSONFromNCMBObject(updateDate)
//    }
        }
//    if (_ACL){
        if let acl = self.acl {
//        [returnDic setObject:_ACL.dicACL forKey:@"acl"];
            returnDic["acl"] = acl.dicACL
//    }
        }
//    return returnDic;
        return returnDic
//}
    }
//
//MARK: - 型チェック
////入力値の型チェック
//-(BOOL)isValidType:(id)object{
    private func isValidType(_ object: Any?) -> Bool {
//    if (object == nil){
//        return YES;
//    }
        if object == nil {
            return true
        }
//    return [object isKindOfClass:[NSString class]]  || [object isKindOfClass:[NSNumber class]]
        return object is String || object is NSNumber
//    || [object isKindOfClass:[NSArray class]]       || [object isKindOfClass:[NSDictionary class]]
        || object is NSArray || object is NSDictionary
//    || [object isKindOfClass:[NSDate class]]        || [object isKindOfClass:[NCMBObject class]]
        || object is NSDate || object is NCMBObject
//    || [object isKindOfClass:[NCMBGeoPoint class]]  || [object isKindOfClass:[NCMBACL class]]
        || object is NCMBGeoPoint || object is NCMBACL
//    || [object isKindOfClass:[NCMBRelation class]]  || [object isKindOfClass:[NSNull class]]
        || object is NCMBRelation || object is NSNull
//    || [object isKindOfClass:[NSData class]];
        || object is NSData
//}
    }
//
////リストの入力値チェック
//-(BOOL)listIsValidType:(NSArray*)array{
    @discardableResult
    private func listIsValidType(_ array: [Any]) -> Bool {
//    for(int i=0; i<[array count]; i++){
        for obj in array {
//        if (![self isValidType:[array objectAtIndex:i]]) {
            if !self.isValidType(obj) {
//            [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Invalid type for value." userInfo:nil] raise];
                fatalError("Invalid type for value.")
//        }
            }
//    }
        }
//    return true;
        return true
//}
    }
//
//MARK: - データ操作
//
///**
// オブジェクトにACLを設定する
// @param acl 設定するACLオブジェクト
// */
//- (void)setACL:(NCMBACL*)acl{
    public var acl: NCMBACL? {
        get {
            return _acl
        }
        set {
//    _ACL = acl;
            self._acl = newValue
//    [self setObject:_ACL.dicACL forKey:@"acl"];
            self.setObject(_acl?.dicACL, forKey: "acl")
        }
//}
    }
//
//
////指定したキーに値を設定する
//- (void)setObject:(id)object forKey:(NSString *)key{
    public func setObject(_ object: Any?, forKey key: String) {
//    //入力値チェック
//    if(![self isValidType:object]){
        if !self.isValidType(object) {
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Invalid type for value." userInfo:nil] raise];
            fatalError("Invalid type for value.")
//    };
        }
//    [self performOperation:key byOperation:[[NCMBSetOperation alloc]initWithClassName:object]];
        self.performOperation(key, byOperation: NCMBSetOperation(newValue: object))
//}
    }
//
//
////指定したキーから値を取得する
//- (id)objectForKey:(NSString *)key{
    public func object(forKey key: String) -> Any? {
//    id object = nil;
        var object: Any? = nil
//    if ([estimatedData objectForKey:key]) {
        if let value = estimatedData[key] {
//        object = [estimatedData objectForKey:key];
            object = value
//    }
        }
//    return object;
        return object
//}
    }
////指定したキーの値をインクリメント(+1)する
//- (void)incrementKey:(NSString *)key{
    public func increment(key: String) {
//    NSNumber *amount =@1;
//    [self incrementKey:key byAmount:amount];
        self.increment(key: key, by: 1 as NSNumber)
//}
    }
//
////指定したキーの値を指定分インクリメントする
//- (void)incrementKey:(NSString *)key byAmount:(NSNumber *)amount{
    public func increment(key: String, by amount: NSNumber) {
//    //オブジェクトIDが有れば、NCMBIncrementOperation　なければ　NCMBSetOperation
//    if (self.objectId == nil || [self.objectId isEqualToString:@""]) {
        if self.objectId == nil || self.objectId == "" {
//        if ([estimatedData objectForKey:key]) {
            if let value = estimatedData[key] {
//            NSNumber *oldValue = nil;
//
//            //前回データの取り出し、型チェック
//            id value = [estimatedData objectForKey:key];
//            if ([value isKindOfClass:[NSNumber class]]) {
//                oldValue = (NSNumber*)value;
//            }else{
                guard let oldValue = value as? NSNumber else {
//                [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Old value is not an number." userInfo:nil] raise];
                    fatalError("Old value is not an number.")
//            }
                }
//
//            //前回の数値と今回の数値を足す
//            NSNumber *newValue = [NSNumber numberWithFloat:[oldValue floatValue] + [amount floatValue]];
                let newValue = (oldValue.floatValue + amount.floatValue) as NSNumber //###
//            NCMBSetOperation *operation = [[NCMBSetOperation alloc]initWithClassName:newValue];
                let operation = NCMBSetOperation(newValue: newValue)
//            [self performOperation:key byOperation:operation];
                self.performOperation(key, byOperation: operation)
//        }
//        else{
            } else {
//            NCMBSetOperation *operation = [[NCMBSetOperation alloc]initWithClassName:amount];
                let operation = NCMBSetOperation(newValue: amount)
//            [self performOperation:key byOperation:operation];
                self.performOperation(key, byOperation: operation)
//        }
            }
//    }
//    else{
        } else {
//        //objectIDがある場合　NCMBIncrementOperation(サーバーサイド処理)実行
//        NCMBIncrementOperation *operation = [[NCMBIncrementOperation alloc]initWithClassName:amount];
            let operation = NCMBIncrementOperation(byAmount: amount)
//        [self performOperation:key byOperation:operation];
            self.performOperation(key, byOperation: operation)
//    }
        }
//}
    }
//
///**
// 指定したキーの配列に渡された値を追加する
// @param object 追加する値
// @param key 追加するキー
// */
//- (void)addObject:(id)object forKey:(NSString *)key{
    public func addObject(_ object: Any, forKey key:String) {
//    [self addObjectsFromArray:[NSArray arrayWithObjects:object, nil] forKey:key];
        self.addObjects(from: [object], forKey: key)
//}
    }
//
////指定したキーの配列に渡された配列の値を追加する
//- (void)addObjectsFromArray:(NSArray *)objects forKey:(NSString *)key{
    public func addObjects(from objects: [Any], forKey key: String) {
//    //リスト内の型チェック
//    [self listIsValidType:objects];
        self.listIsValidType(objects)
//
//    //オブジェクトIDが有れば、NCMBAddOperation　なければ　NCMBSetOperation
//    if (self.objectId == nil || [self.objectId isEqualToString:@""]) {
        if self.objectId == nil || self.objectId == "" {
//        NSMutableArray *newValue = [NSMutableArray array];
            var newValue: [Any] = []
//        if ([estimatedData objectForKey:key]) {
            if let oldValue = estimatedData[key] {
//            //前回データの取り出し
//            id oldValue = [estimatedData objectForKey:key];
//            if ([oldValue isKindOfClass:[NSArray class]]) {
                if let array = oldValue as? [Any] {
//                for(int i=0; i<[oldValue count]; i++){
//                    [newValue insertObject:[oldValue objectAtIndex:i] atIndex:i];
//                }
                    newValue = array
//            }else{
                } else {
//                [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Old value is not an array." userInfo:nil] raise];
                    fatalError("Old value is not an array.")
//            }
                }
//
//            //objects(今回追加する値)の要素をすべてnewValueの末尾に追加
//            for(int i=0; i<[objects count]; i++){
//                [newValue addObject:[objects objectAtIndex:i]];
//            }
                newValue.append(contentsOf: objects)
//            NCMBSetOperation *operation = [[NCMBSetOperation alloc]initWithClassName:newValue];
                let operation = NCMBSetOperation(newValue: newValue)
//            [self performOperation:key byOperation:operation];
                self.performOperation(key, byOperation: operation)
//        }
//        else{
            } else {
//            NCMBSetOperation *operation = [[NCMBSetOperation alloc]initWithClassName:objects];
                let operation = NCMBAddOperation(newValue: objects)
//            [self performOperation:key byOperation:operation];
                self.performOperation(key, byOperation: operation)
//        }
            }
//    }
//    else{
        } else {
//        //objectIDがある場合　NCMBAddOperation(サーバーサイド処理)実行
//        NCMBAddOperation *operation = [[NCMBAddOperation alloc]initWithClassName:objects];
            let operation = NCMBAddOperation(newValue: objects)
//        [self performOperation:key byOperation:operation];
            self.performOperation(key, byOperation: operation)
//    }
        }
//}
    }
//
////指定したキーの配列に渡された、重複していない値を追加する
//- (void)addUniqueObject:(id)object forKey:(NSString *)key{
    public func addUniqueObject(_ object: Any, forKey key: String) {
//    [self addUniqueObjectsFromArray:[NSArray arrayWithObjects:object, nil] forKey:key];
        self.addObjects(from: [object], forKey: key)
//}
    }
//
////指定したキーの配列に渡された、重複していない配列の値を追加する
//- (void)addUniqueObjectsFromArray:(NSArray *)objects forKey:(NSString *)key{
    public func addUniqueObjects(from objects: [Any], forKey key: String) {
//    //リスト内の型チェック
//    [self listIsValidType:objects];
        self.listIsValidType(objects)
//
//    if (self.objectId == nil || [self.objectId isEqualToString:@""]) {
        if self.objectId == nil || self.objectId == "" {
//        NSMutableArray *newValue = [NSMutableArray array];
            var newValue: [AnyHashable] = []
//        if ([estimatedData objectForKey:key]) {
            if let oldValue = estimatedData[key] {
//            //addUnique対象のローカルデータ取り出し
//            id oldValue = [estimatedData objectForKey:key];
//            //valにobjectの配列である全要素を追加
//            if ([oldValue isKindOfClass:[NSArray class]]) {
                if let array = oldValue as? [AnyHashable] {
//                for(int i=0; i<[oldValue count]; i++){
//                    [newValue insertObject:[oldValue objectAtIndex:i] atIndex:i];
//                }
                    newValue = array
//            }else{
                } else {
//                [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Old value is not an array." userInfo:nil] raise];
                    fatalError("Old value is not an array.")
//            }
                }
//
//            /** 以下NCMBObjectの重複処理　ObjectIdが同じものは上書き　違うものは末尾に追加*/
//            //前回のオブジェクトのobjectIDを保管する。key:各objectID　value:NSNumber
//            NSMutableDictionary *existingObjectIds = [NSMutableDictionary dictionary];
                var existingObjectIds: [AnyHashable: Int] = [:]
//            for(int i=0; i<[newValue count]; i++){
                for i in newValue.indices {
//                //前回のオブジェクトからNCMBObject要素検索
//                if ([[newValue objectAtIndex:i] isKindOfClass:[NCMBObject class]]) {
                    if let ncmbObj = newValue[i] as? NCMBObject {
//                    //NCMBObjectがあればkeyにobjectID、valueにNSNumber追加
//                    if([((NCMBObject *)[newValue objectAtIndex:i]) objectId]){
                        if let objectId = ncmbObj.objectId {
//                        [existingObjectIds setObject:[NSNumber numberWithInt:i] forKey:[((NCMBObject *)[newValue objectAtIndex:i]) objectId]];
                            existingObjectIds[objectId] = i
//                    }else{
                        } else {
//                        [existingObjectIds setObject:[NSNumber numberWithInt:i] forKey:[NSNull null]];
                            existingObjectIds[NSNull()] = i
//                    }
                        }
//                }
                    }
//            }
                }
//
//            NSEnumerator* localEnumerator = [objects objectEnumerator];
//            id NCMBObj;
//            while (NCMBObj = [localEnumerator nextObject]) {
                for object in objects {
//                if ([NCMBObj isKindOfClass:[NCMBObject class]]){
                    if let ncmbObj = object as? NCMBObject {
//                    //objectsのobjectIdと先ほど生成したexistingObjectIdsのobjectIdが一致した場合、existingObjectIdsのvalue:NSNumberを返す。なければnilを返す。
//                    NSNumber *index = [existingObjectIds objectForKey:[NCMBObj objectId]];
//                    if (index != nil) {
                        if
                            let objectId = ncmbObj.objectId,
                            let index = existingObjectIds[objectId] {
//                        [newValue operation:NCMBObj atIndex:[index intValue]];//一致した場所にオブジェクト追加
                            newValue.insert(ncmbObj, at: index)
//                    }
//                    else{
                        } else {
//                        [newValue addObject:NCMBObj];//一致しなかった場合は末に追加
                            newValue.append(ncmbObj)
//                    }
                        }
//                }
//                else if (![newValue containsObject:NCMBObj]){
                    } else if !newValue.contains(object as! AnyHashable) {
//                    [newValue addObject:NCMBObj];//NCMBObjectではなかった場合は末に追加
                        newValue.append(object as! AnyHashable)
//                }
                    }
//            }
                }
//            NCMBSetOperation *operation = [[NCMBSetOperation alloc]initWithClassName:newValue];
                let operation = NCMBSetOperation(newValue: newValue.map{$0.base})
//            [self performOperation:key byOperation:operation];
                self.performOperation(key, byOperation: operation)
//        }
//        else{
            } else {
//            NCMBSetOperation *operation = [[NCMBSetOperation alloc]initWithClassName:objects];
                let operation = NCMBSetOperation(newValue: objects)
//            [self performOperation:key byOperation:operation];
                self.performOperation(key, byOperation: operation)
//        }
            }
//    }
//    else{
        } else {
//        //objectIDがある場合　AddUniqueOperation(サーバーサイド処理)実行
//        NCMBAddUniqueOperation *operation = [[NCMBAddUniqueOperation alloc]initWithClassName:objects];
            let operation = NCMBAddUniqueOperation(newValue: objects)
//        [self performOperation:key byOperation:operation];
            self.performOperation(key, byOperation: operation)
//    }
        }
//}
    }
//
//- (void)removeObject:(id)object forKey:(NSString *)key{
    public func removeObject(_ object: Any, forKey key: String) {
//    [self removeObjectsInArray:[NSArray arrayWithObjects:object, nil] forKey:key];
        self.removeObjects(in: [object], forKey: key)
//}
    }
//
//- (void)removeObjectsInArray:(NSArray *)objects forKey:(NSString *)key{
    public func removeObjects(in objects: [Any], forKey key: String) {
//    if (self.objectId == nil || [self.objectId isEqualToString:@""]) {
        if self.objectId == nil || self.objectId == "" {
//        NSMutableArray *val = [NSMutableArray array];
//        if ([estimatedData objectForKey:key]) {
            guard let objects = objects as? [AnyHashable] else {
                fatalError("objects contains invalid data")
            }
            if let object = estimatedData[key] {
//            //remove対象のローカルデータ取り出し
//            id object = [estimatedData objectForKey:key];
//
//            //valにobjectの配列である全要素を追加
//            if ([object isKindOfClass:[NSArray class]]) {
                guard let val = object as? [AnyHashable]  else {
//                for(int i=0; i<[object count]; i++){
//                    [val insertObject:[object objectAtIndex:i] atIndex:i];
//                }
//            }else{
//                [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Old value is not an array." userInfo:nil] raise];
//            }
                    fatalError("Old value is not an array.")
                }
//            //resultにvalの全要素を追加
//            NSMutableArray *newValue = [NSMutableArray array];
//            [newValue setArray:val];
                var newValue = val
//
//            //ローカルデータから今回引数で指定したobjectsの値削除
//            [newValue removeObjectsInArray:objects];
                newValue.removeAll{objects.contains($0)}
//
//            /** 以下NCMBObjectの重複処理　ObjectIdが同じものを配列から削除*/
//            NSMutableArray *objectsToBeRemoved = [NSMutableArray array];//remove対象のobject格納
                var objectsToBeRemoved: [AnyHashable] = objects
//            NSMutableSet *objectIds = [NSMutableSet set];//remove対象(NCMBObject)のobjectId格納
                var objectIds: Set<String> = []
//
//            //今回指引数で指定したobjectsからnewValueの値削除
//            [objectsToBeRemoved setArray:objects];
//            [objectsToBeRemoved removeObjectsInArray:newValue];
                objectsToBeRemoved.removeAll{newValue.contains($0)}
//
//            //削除対象(NCMBOBject)のobjectIdを取得
//            NSEnumerator* localEnumerator = [objectsToBeRemoved objectEnumerator];
//            id removeNCMBObject;
//            while (removeNCMBObject = [localEnumerator nextObject]) {
                for case let removeNCMBObject as NCMBObject in objectsToBeRemoved {
//                if ([removeNCMBObject isKindOfClass:[NCMBObject class]]){
                    if let objectId = removeNCMBObject.objectId {
//                    [objectIds addObject:[removeNCMBObject objectId]];
                        objectIds.insert(objectId)
//                }
                    }
//            }
                }
//
//            //取得したobjectIdと同じNCMBObjectを削除
//            id NCMBObj;
//            for(int i=0; i<[newValue count]; i++){
//                NCMBObj = [newValue objectAtIndex:i];
//                if ([NCMBObj isKindOfClass:[NCMBObject class]] && [objectIds containsObject:[NCMBObj objectId]]){
//                    [newValue removeObjectAtIndex:i];
//                }
//            }
                newValue.removeAll {
                    if let ncmbObj = $0 as? NCMBObject, let objectId = ncmbObj.objectId {
                        return objectIds.contains(objectId)
                    } else {
                        return false
                    }
                }
//
//            NCMBSetOperation *operation = [[NCMBSetOperation alloc]initWithClassName:newValue];
                let operation = NCMBSetOperation(newValue: newValue.map{$0.base})
//            [self performOperation:key byOperation:operation];
                self.performOperation(key, byOperation: operation)
//        }
//        else{
            } else {
//            //データ操作初回時は削除対象が無いため、exceptionを吐く
//            [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Does not have a value." userInfo:nil] raise];
                fatalError("Does not have a value.")
//        }
            }
//    }
//    else{
        } else {
//        //objectIDがある場合　RemoveOperation(サーバーサイド処理)実行
//        NCMBRemoveOperation *operation = [[NCMBRemoveOperation alloc]initWithClassName:objects];
            let operation = NCMBRemoveOperation(className: objects)
//        [self performOperation:key byOperation:operation];
            self.performOperation(key, byOperation: operation)
//    }
        }
//}
    }
//
////指定したキーの値を削除する
//-(void)removeObjectForKey:(NSString *)key{
    public func removeObject(forKey key: String) {
//    if ([estimatedData objectForKey:key]) {
        if estimatedData[key] != nil {
//        [estimatedData removeObjectForKey:key];
            estimatedData.removeValue(forKey: key)
//        [[self currentOperations] setObject:[[NCMBDeleteOperation alloc]init] forKey:key];
            self.currentOperations()?[key] = NCMBDeleteOperation()
//    }
        }
//    if ([key isEqualToString:@"acl"]){
        if key == "acl" {
//        _ACL = nil;
            _acl = nil
//    }
        }
//}
    }
//
////指定キーのNCMBRelationを作成する
//- (NCMBRelation *)relationforKey:(NSString *)key{
    @objc public func relation(forKey key: String) -> NCMBRelation {
//    NCMBRelation *relation=[[NCMBRelation alloc]initWithClassName:self key:key];
        let relation = NCMBRelation(parent: self, key: key)
//    id value = [estimatedData objectForKey:key];
        if let value = estimatedData[key] as? NCMBRelation {
//    if(value != nil && [value isKindOfClass:[NCMBRelation class]]){
//        relation.targetClass = ((NCMBRelation *)value).targetClass;
            relation.targetClass = value.targetClass
//    }
        }
//    return relation;
        return relation
//}
    }
//
//
//MARK: - 履歴操作
//
////各オペレーション操作実行。履歴データとローカルデータを作成。
//-(void)performOperation:(NSString *)key byOperation:(id)operation{
    internal func performOperation(_ key: String, byOperation operation: NCMBOperation) {
//
//    /** estimetedData構築 */
//    //前回実行時のローカルデータ作成
//    id oldValue = [estimatedData objectForKey:key];
        let oldValue = estimatedData[key]
//    //新規ローカルデータ作成
//    id newValue = [operation apply:oldValue NCMBObject:self forkey:key];
        let newValue = operation.apply(oldValue, ncmbObject: self, for: key)
//    //新規ローカルデータ保存
//    if (newValue != nil) {
        if let value = newValue {
//        [estimatedData setObject:newValue forKey:key];
            estimatedData[key] = value
//    }else{
        } else {
//        [estimatedData removeObjectForKey:(key)];
            estimatedData[key] = nil
//    }
        }
//
//    /** operationSetQueue構築 */
//    //前回実行時の履歴データ作成
//    id oldOperation = [[self currentOperations] objectForKey:key];
        let oldOperation = self.currentOperations()?[key]
//    //新規履歴データ作成
//    id newOperation = [operation mergeWithPrevious:oldOperation];
        let newOperation = operation.merge(previous: oldOperation)
//    //新規履歴データ保存
//    NSUInteger index = [operationSetQueue indexOfObject:[self currentOperations]];
        if operationSetQueue.contains(where: {$0 === currentOperations()}) {
//    if (index != NSNotFound) {
//        [[self currentOperations] setObject:newOperation forKey:key];
            self.currentOperations()![key] = newOperation
//    }
        }
//}
    }
//
///**
// キューから最後(前回)の履歴データの取り出し
// @return 一番最後の操作履歴
// */
//-(NSMutableDictionary *)currentOperations{
    internal func currentOperations() -> NCMBOperationSet? {
//    return [operationSetQueue lastObject];
        return operationSetQueue.last
//}
    }
//
//
///**
// 通信前に履歴の取り出しと、次のOperationを保存するDictionaryをキューにセットする
// @return currentOperations オブジェクトの操作履歴
// */
//-(NSMutableDictionary *)beforeConnection{
    internal func beforeConnection() -> NCMBOperationSet? {
//    //通信前に履歴の取り出し
//    NSMutableDictionary *currentOperations = [self currentOperations];
        let currentOperations = self.currentOperations()
//    [operationSetQueue addObject:[[NSMutableDictionary alloc]init]];
        operationSetQueue.append(NCMBOperationSet())
//    return currentOperations;
        return currentOperations
//}
    }
//
///**
// オブジェクト更新後に操作履歴とestimatedDataを同期する
// @param response REST APIのレスポンスデータ
// @param operations 同期する操作履歴
// */
//-(void)afterSave:(NSDictionary*)response operations:(NSMutableDictionary*)operations{
    internal func afterSave( _ response: [String: Any], operations: NCMBOperationSet?) {
//    //リクエスト実行時の該当履歴削除
//    NSUInteger index = [operationSetQueue indexOfObject:operations];
        if let index = operationSetQueue.firstIndex(where: {$0 === operations}) {
//    if (index != NSNotFound) {
//        [operationSetQueue removeObjectAtIndex:index];
            operationSetQueue.remove(at: index)
//    }
        }
//    //レスポンスからプロパティを更新する
//    [self propertiesFromResponse:response];
        self.propertiesFromResponse(response)
//}
    }
//
///**
// saveAll実行後の処理を行う
// @param object リクエストされたNCMBObjectの配列
// @param operation 各オブジェクトに対する操作履歴
// @param responseDic 各オブジェクトに対するレスポンス
// **/
    ///NOT used, NO hader...
//+ (void)afterSaveAll:(id)object
//           operation:(NSMutableDictionary*)operation
//            response:(NSMutableDictionary*)responseDic
//{
//    if ([[responseDic allKeys] containsObject:@"error"]){
//        //各オブジェクトがエラーだった場合の処理
//        NCMBObject *obj = object;
//        [obj mergePreviousOperation:operation];
//    } else {
//        NSDictionary *response = [responseDic objectForKey:@"success"];
//        if([object isKindOfClass:[NCMBObject class]]){
//            NCMBObject *obj = object;
//            [obj afterSave:response operations:operation];
//        } else if ([object isKindOfClass:[NCMBUser class]]){
//            NCMBUser *user = object;
//            [user afterSave:response operations:operation];
//        } else if ([object isKindOfClass:[NCMBRole class]]){
//            NCMBRole *role = object;
//            [role afterSave:response operations:operation];
//        } else if ([object isKindOfClass:[NCMBPush class]]){
//            NCMBPush *push = object;
//            [push afterSave:response operations:operation];
//        } else if ([object isKindOfClass:[NCMBInstallation class]]){
//            NCMBInstallation *installation = object;
//            [installation afterSave:response operations:operation];
//        }
//    }
//}
//
///**
// mobile backendからエラーが返ってきたときに最新の操作履歴と通信中の操作履歴をマージする
// @param operations 最新の操作履歴
// */
//- (void)mergePreviousOperation:(NSMutableDictionary*)operations{
    internal func mergePreviousOperation(_ operations: NCMBOperationSet?) {
//    for (id key in [operations keyEnumerator]){
        for (key, operation) in operations ?? [:] {
//        if ([[[self currentOperations] allKeys] containsObject:key]){
            if
                let currentOperations = self.currentOperations(),
                currentOperations[key] == nil
            {
//        } else {
//            [[self currentOperations] setObject:[operations objectForKey:key] forKey:key];
                currentOperations[key] = operation
//        }
            }
//    }
        }
//}
    }
//
//- (NSArray *)allKeys{
    public var allKeys: [String] {
//    return [estimatedData allKeys];
        return Array(estimatedData.keys)
//}
    }
//
//MARK: - Refresh
//
///**
// mobile backendからobjectIdをキーにしてデータを取得する。履歴はリセットされる。
// @param error エラーを保持するポインタ
// */
    ///Do NOT use this method.
//- (void)refresh:(NSError **)error{
    public func __refresh() throws {
        fatalError("\(#function): Sync methods not supported")
//    if (_objectId){
//        NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
//        [self fetch:url error:error isRefresh:YES];
//    } else {
//        if (error){
//            NSError *localError = [NSError errorWithDomain:ERRORDOMAIN
//                                                      code:400003
//                                                  userInfo:@{NSLocalizedDescriptionKey:@"objectId is empty."}
//                                   ];
//            *error = localError;
//        }
//    }
//
//}
    }
//
///**
// mobile backendからobjectIdをキーにしてデータを取得する。非同期通信を行う。履歴はリセットされる。
// @param block 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)refreshInBackgroundWithBlock:(NCMBErrorResultBlock)block{
    public func refreshAsync(block: NCMBErrorResultBlock?) {
//    if (_objectId){
        if let objectId = objectId {
//        NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
            let url = self.returnBaseUrl(ncmbClassName, objectId: objectId)
//        [self fetchInBackgroundWithBlock:url block:block isRefresh:YES];
            self.fetchAsync(url, block: block, isRefresh: true)
//    } else {
        } else {
//        if (block){
            if let block = block {
//            NSError *localError = [NSError errorWithDomain:ERRORDOMAIN
                let localError = NSError(domain: ERRORDOMAIN,
                                         code: 400003,
                                         userInfo: [NSLocalizedDescriptionKey: "objectId is empty."])
//                                                      code:400003
//                                                  userInfo:@{NSLocalizedDescriptionKey:@"objectId is empty."}
//                                   ];
//            block(localError);
                block(localError)
//        }
            }
//    }
        }
//}
    }
//
///**
// mobile backendからobjectIdをキーにしてデータを取得する。非同期通信を行い、通信後は指定されたセレクタを実行する。履歴はリセットされる。
// @param target 呼び出すセレクタのターゲット
// @param selector 実行するセレクタ
// */
//- (void)refreshInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func refreshAsync(target: AnyObject, selector: Selector) {
//    NSMethodSignature* signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//
//    [self refreshInBackgroundWithBlock:^(NSError *error) {
        self.refreshAsync {error in
//        [invocation retainArguments];
//        [invocation setArgument:&error atIndex: 2 ];
//        [invocation invoke];
            _ = target.perform(selector, with: error as NSError?)
//    }];
        }
//}
    }
//
//MARK: - Fetch
//
///**
// リクエストURLを受け取ってfetchを実行する。
// @param url リクエストURL
// @param error エラーを保持するポインタ
// */
    ///Do NOT use this method.
//- (BOOL)fetch:(NSString*)url error:(NSError **)error isRefresh:(BOOL)isRefresh{
    internal func __fetch(_ url: String, isRefresh: Bool) throws -> Bool {
        fatalError("\(#function): Sync methods not supported")
//    semaphore = dispatch_semaphore_create(0);
        __semaphore = DispatchSemaphore(value: 0)
//
//    //リクエストを作成
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:url
        let request = NCMBRequest(urlString: url,
                                  method: "GET",
                                  header: nil,
                                  body: nil)
//                                                           method:@"GET"
//                                                           header:nil
//                                                             body:nil];
//    // 通信
//    BOOL __block result = NO;
        var result = false
//    NSError __block *sessionError = nil;
        var sessionError: Error? = nil
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
        let session = NCMBURLSession(request: request)
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
        session.dataAsyncConnection {response in
            switch response {
//        if (requestError){
            case .failure(let requestError):
//            //通信エラー or mbエラー
//            sessionError = requestError;
                sessionError = requestError
//        } else {
            case .success(let responseData):
//            [self afterFetch:[NSMutableDictionary dictionaryWithDictionary:responseData] isRefresh:isRefresh];
                self.afterFetch(responseData as! [String: Any], isRefresh: isRefresh)
//            result = YES;
                result = true
                
//        }
            }
//        dispatch_semaphore_signal(semaphore);
            self.__semaphore?.signal()
//    }];
        }
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        __semaphore?.wait()
//
//    if(error){
//        *error = sessionError;
        if let sessionError = sessionError {
            throw sessionError
        }
//    }
//    return result;
        return result
//}
    }
//
///**
// mobile backendからobjectIdをキーにしてデータを取得する
// @param error エラーを保持するポインタ
// */
    ///Do NOT use this method.
//- (void)fetch:(NSError **)error{
    public func __fetch() throws {
        fatalError("\(#function): Sync methods not supported")
//    if (_objectId){
//        NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
//        [self fetch:url error:error isRefresh:NO];
//    } else {
//        if (error){
//            NSError *localError = [NSError errorWithDomain:ERRORDOMAIN
//                                                      code:400003
//                                                  userInfo:@{NSLocalizedDescriptionKey:@"objectId is empty."}
//                                   ];
//            *error = localError;
//        }
//    }
//}
    }
//
///**
// リクエストURLを受け取ってfetchを実行する。非同期通信を行う。
// @param url リクエストURL
// @param userBlock 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)fetchInBackgroundWithBlock:(NSString *)url
    internal func fetchAsync(_ url: String,
//                             block:(NCMBErrorResultBlock)userBlock
        block userBlock: NCMBErrorResultBlock?,
//                         isRefresh:(BOOL)isRefresh
        isRefresh: Bool) {
//{
//
//    //リクエストを作成
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:url
        let request = NCMBRequest(urlString: url,
                                  method: "GET",
                                  header: nil,
                                  body: nil)
//                                                           method:@"GET"
//                                                           header:nil
//                                                             body:nil];
//
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestAsync:request];
        let session = NCMBURLSession(requestAsync: request)
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
        session.dataAsyncConnection{result in
//        if (!requestError){
            switch result {
            case .success(let responseData):
                guard let response = responseData as? [String: Any] else {
                    fatalError("responseData is not a Dictionary")
                }
//            [self afterFetch:[NSMutableDictionary dictionaryWithDictionary:responseData] isRefresh:isRefresh];
                self.afterFetch(response, isRefresh: isRefresh)
                userBlock?(nil)
            case .failure(let requestError):
                userBlock?(requestError)
//        }
//        [self executeUserCallback:userBlock error:requestError];
            }
//    }];
        }
//}
    }
//
///**
// mobile backendからobjectIdをキーにしてデータを取得する。非同期通信を行う。
// オブジェクトが保存前だった場合には、blockが実行されない。
// @param block 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)fetchInBackgroundWithBlock:(NCMBErrorResultBlock)block{
    public func fetchAsync(block: NCMBErrorResultBlock?) {
//    if (_objectId){
        if let objectId = objectId {
//        NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
            let urlString = self.returnBaseUrl(ncmbClassName, objectId: objectId)
//        [self fetchInBackgroundWithBlock:url block:block isRefresh:NO];
            self.fetchAsync(urlString, block: block, isRefresh: false)
//    } else {
        } else {
//        if (block){
            if let block = block {
//            NSError *localError = [NSError errorWithDomain:ERRORDOMAIN
                let localError = NSError(domain: ERRORDOMAIN,
                                         code: 400003,
                                         userInfo: [NSLocalizedDescriptionKey: "objectId is empty."])
//                                                      code:400003
//                                                  userInfo:@{NSLocalizedDescriptionKey:@"objectId is empty."}
//                                   ];
//            block(localError);
                block(localError)
//        }
            }
//    }
        }
//
//}
    }
//
///**
// mobile backendからobjectIdをキーにしてデータを取得する。非同期通信を行い、通信後は指定されたセレクタを実行する。
// オブジェクトが保存前だった場合には、セレクタが実行されない。
// @param target 呼び出すセレクタのターゲット
// @param selector 実行するセレクタ
// */
//- (void)fetchInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func fetchAsync(target: AnyObject, selector: Selector) {
//    if (_objectId){
        if objectId != nil {
//        NSMethodSignature* signature = [target methodSignatureForSelector:selector];
//        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//        [invocation setTarget:target];
//        [invocation setSelector:selector];
//
//        [self fetchInBackgroundWithBlock:^(NSError *error) {
            self.fetchAsync {error in
//            [invocation retainArguments];
//            [invocation setArgument:&error atIndex: 2];
//            [invocation invoke];
                _ = target.perform(selector, with: error as NSError?)
//        }];
            }
//    }
        }
//}
    }
//
///**
// APIのレスポンスをプロパティに反映する
// @param response APIリクエストの結果が入ったNSDictionary型オブジェクト
// */
//- (void)propertiesFromResponse:(NSDictionary*)response{
    private func propertiesFromResponse(_ response: [String: Any]) {
//    //プロパティを更新
//    if ([response objectForKey:@"objectId"]){
        if let objectId = response["objectId"] as? String {
//        _objectId = [response objectForKey:@"objectId"];
            self.objectId = objectId
//        //[response removeObjectForKey:@"objectId"];
//    }
        }
//    if ([response objectForKey:@"createDate"]){
        if let createDate = response["createDate"] {
//        NSDateFormatter *df = [self createNCMBDateFormatter];
            let df = self.createNCMBDateFormatter()
//        if ([[response objectForKey:@"createDate"] isKindOfClass:[NSString class]]){
            if let createDateStr = createDate as? String {
//            _createDate = [df dateFromString:[response objectForKey:@"createDate"]];
                self.createDate = df.date(from: createDateStr)
//        } else if ([[response objectForKey:@"createDate"] isKindOfClass:[NSDictionary class]]) {
            } else if let createDateDict = createDate as? [String: Any],
                let createDateStr = createDateDict["iso"] as? String
            {
//            //2.0.3以前はファイルに書き出されるInstallationのcreateDate/updateDateがNCMBの日付型だった
//            _createDate = [df dateFromString:[[response objectForKey:@"createDate"] objectForKey:@"iso"]];
                self.createDate = df.date(from: createDateStr)
//        }
            }
//    }
        }
//    if ([response objectForKey:@"updateDate"]){
        if let updateDate = response["updateDate"] {
//        NSDateFormatter *df = [self createNCMBDateFormatter];
            let df = self.createNCMBDateFormatter()
//        if ([[response objectForKey:@"updateDate"] isKindOfClass:[NSString class]]){
            if let updateDateStr = updateDate as? String {
//            _updateDate = [df dateFromString:[response objectForKey:@"updateDate"]];
                self.updateDate = df.date(from: updateDateStr)
//        } else if ([[response objectForKey:@"updateDate"] isKindOfClass:[NSDictionary class]]) {
            } else if let updateDateDict = updateDate as? [String: Any],
                let updateDateStr = updateDateDict["iso"] as? String
            {
//            _updateDate = [df dateFromString:[[response objectForKey:@"updateDate"] objectForKey:@"iso"]];
                self.updateDate = df.date(from: updateDateStr)
//        }
            }
//    }
        }
//    if ([response objectForKey:@"acl"]){
        if let acl = response["acl"] {
//        if ([response objectForKey:@"acl"] != [NSNull null]){
            if let dicACL = acl as? [String: [String: Bool]] {
//            _ACL = [NCMBACL ACL];
                _acl = NCMBACL()
//            _ACL.dicACL = [NSMutableDictionary dictionaryWithDictionary:[response objectForKey:@"acl"]];
                _acl!.dicACL = dicACL
//        } else {
            } else {
//            _ACL = nil;
                _acl = nil
//        }
            }
//    }
        }
//    //オブジェクト登録時はcreateDateだけ返却されるのでupdateDateにもcreateDateを代入する
//    if (self.createDate != nil && self.updateDate == nil){
        if self.createDate != nil && self.updateDate == nil {
//        _updateDate = _createDate;
            updateDate = createDate
//    }
        }
//}
    }
//
///**
// fetchを実行したあとにプロパティとestimatedDataの更新を行う
// @param response レスポンスのDicitonary
// @param isRefresh リフレッシュ実行フラグ
// */
//- (void)afterFetch:(NSMutableDictionary*)response isRefresh:(BOOL)isRefresh{
    internal func afterFetch(_ response: [String: Any], isRefresh: Bool) {
//    //レスポンスからプロパティを更新する
//    [self propertiesFromResponse:response];
        self.propertiesFromResponse(response)
//
//    if (isRefresh == YES){
        if isRefresh {
//        //refreshが実行された場合は履歴をすべて消去する。saveEventually対策。
//        //[operationSetQueue setArray:[NSMutableArray array]];
//        NSUInteger index = [operationSetQueue indexOfObject:[self currentOperations]];
            if let index = operationSetQueue.firstIndex(where: {$0 === self.currentOperations()}) {
//        [operationSetQueue setObject:[NSMutableDictionary dictionary] atIndexedSubscript:index];
                operationSetQueue[index] = NCMBOperationSet()
            }
//        estimatedData = [NSMutableDictionary dictionary];
            estimatedData = [:]
//    }
        }
//    for (NSString *key in [response keyEnumerator]){
        for (key, value) in response {
//        [estimatedData setObject:[self convertToNCMBObjectFromJSON:[response objectForKey:key] convertKey:key]
//                          forKey:key];
            estimatedData[key] = self.convertToNCMBObjectFromJSON(value, convertKey: key)
//    }
        }
//}
    }
//
//
//MARK: - Save
//
///**
// オペレーションの中にSetOperationがないかチェックし、SetOperationのvalueが保存前のNCMBObjectの場合は保存を実行する
// @param operation チェックするオペレーション
// @param error エラーを保持するポインタ
// */
//- (void)savePointerObjectBeforehand:(NSMutableDictionary*)operation error:(NSError**)error{
    /// Do NOT use this method.
    private func __savePointerObjectBeforehand(_ operation: NCMBOperationSet?) throws {
//    for (NSString *key in operation){
        guard let operation = operation else {return}
        for case let setOperation as NCMBSetOperation in operation.values {
//        if ([[operation objectForKey:key] isKindOfClass:[NCMBSetOperation class]]){
//            NCMBSetOperation *setOperation = [operation objectForKey:key];
//            if ([setOperation.value isKindOfClass:[NCMBObject class]]){
            if let valueObj = setOperation.value as? NCMBObject {
//                NCMBObject *valueObj = setOperation.value;
//                if (valueObj.objectId == nil){
                if valueObj.objectId == nil {
//                    [valueObj save:error];
                    try valueObj.__save()
//                }
                }
//            }
            }
//        }
//    }
        }
//}
    }
    private func savePointerObjectBeforehand(_ operation: NCMBOperationSet?, completion: NCMBErrorResultBlock?) {
        guard let operation = operation else {return}
        AsyncSeqeuntialTask(operation.values) {value, task in
            if
                let setOperation = value as? NCMBSetOperation,
                let valueObj = setOperation.value as? NCMBObject
            {
                valueObj.saveAsync {error in
                    if let error = error {
                        task.terminate(error: error)
                    } else {
                        task.next()
                    }
                }
            } else {
                print("Skipping \(value)")
                task.next()
            }
        }.onCompletion{task in
            completion?(task.error)
        }.start()
    }
//
//
///**
// リクエストURLを受け取ってsave処理を実行する
// @param url リクエストURL
// @param error エラーを保持するポインタ
// */
//- (void)save:(NSString*)url error:(NSError **)error{
    /// Do NOT use this method!
    internal func __save(_ url: String) throws {
//    semaphore = dispatch_semaphore_create(0);
        __semaphore = DispatchSemaphore(value: 0)
//    //ポインタ先オブジェクトは事前に保存する
//    NSError *pointerObjectSaveError = nil;
//    NSMutableDictionary *operation = [self beforeConnection];
        let operation = self.beforeConnection()
//    [self savePointerObjectBeforehand:operation
//                                error:&pointerObjectSaveError];
        try self.__savePointerObjectBeforehand(operation)
//    if (pointerObjectSaveError){
//        if(error){
//            *error = pointerObjectSaveError;
//        }
//        return;
//    }
//
//    NSError *connectionError = nil;
//    NCMBRequest *request = [self createRequestForSave:url
        let request = try self.createRequestForSave(url,
//                                            operation:operation
            operation: operation)
//                                                error:&connectionError];
//    if (connectionError){
//        if(error){
//            *error = connectionError;
//        }
//        return;
//    }
//
//    // 通信
//    NSError __block *sessionError = nil;
        var sessionError: Error? = nil
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
        let session = NCMBURLSession(request: request)
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
        session.dataAsyncConnection {result in
//        if (requestError){
            switch result {
            case .failure(let requestError):
//            //通信エラー or mbエラー
//            [self mergePreviousOperation:operation];
                self.mergePreviousOperation(operation)
//            sessionError = requestError;
                sessionError = requestError
//        } else {
            case .success(let responseData):
//            [self afterSave:responseData operations:operation];
                self.afterSave(responseData as! [String: Any], operations: operation)
//        }
            }
//        dispatch_semaphore_signal(semaphore);
            self.__semaphore?.signal()
//    }];
        }
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        __semaphore?.wait()
//
//    if(error){
        if let error = sessionError {
            throw error
        }
//        *error = sessionError;
//    }
//}
    }
//
///**
// mobile backendにオブジェクトを保存する
// @param error エラーを保持するポインタ
// */
//- (void)save:(NSError **)error{
    /// Do NOT use this method
    public func __save() throws {
        fatalError("\(#function): Sync methods not supported")
//    NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
        let url = self.returnBaseUrl(ncmbClassName, objectId: objectId)
//    [self save:url error:error];
        try self.__save(url)
//}
    }
//
///**
// リクエストURLを受け取ってmobile backendにオブジェクトを保存する。非同期通信を行う。
// @param url リクエストURL
// @param userBlock 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
    ///Need to REWRITE this method. Using sync methods internally
//- (void)saveInBackgroundWithBlock:(NSString *)url block:(NCMBErrorResultBlock)userBlock{
    internal func __saveAsync(_ url: String, block userBlock: NCMBErrorResultBlock?) {
        print(url)
//    // ポインタ先オブジェクトは事前に保存する
//    NSError *e = nil;
//    NSMutableDictionary *operation = [self beforeConnection];
        let operation = self.beforeConnection()
        do {
//    [self savePointerObjectBeforehand:operation error:&e];
            try self.__savePointerObjectBeforehand(operation)
//    if (e){
        } catch {
//        [self executeUserCallback:userBlock error:e];
            userBlock?(error)
//        return;
            return
//    }
        }
//
//    // リクエスト作成
//    NSError *connectionError = nil;
        let request: NCMBRequest
        do {
//    NCMBRequest *request = [self createRequestForSave:url
            request = try self.createRequestForSave(url,
//                                            operation:operation
                operation: operation)
//                                                error:&connectionError];
//    // リクエストが作成できなかった場合のエラーを返却
//    if (connectionError != nil){
        } catch let connectionError {
//        [self executeUserCallback:userBlock error:connectionError];
            userBlock?(connectionError)
//        return;
            return
//    }
        }
//    // 通信
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestAsync:request];
        let session = NCMBURLSession(requestAsync: request)
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
        session.dataAsyncConnection {result in
//        if (requestError){
            switch result {
            case .failure(let requestError):
//            //通信エラー or mbエラー
//            [self mergePreviousOperation:operation];
                self.mergePreviousOperation(operation)
                userBlock?(requestError)
//        } else {
            case .success(let responseData):
//            [self afterSave:responseData operations:operation];
                guard let responseDict = responseData as? [String: Any] else {
                    fatalError("Invalid responseData")
                }
                self.afterSave(responseDict, operations: operation)
                userBlock?(nil)
//        }
//
//        [self executeUserCallback:userBlock error:requestError];
            }
//    }];
        }
//}
    }
    internal func saveAsync(_ url: String, block userBlock: NCMBErrorResultBlock?) {
        print(url)
        // ポインタ先オブジェクトは事前に保存する
        let operation = self.beforeConnection()
        self.savePointerObjectBeforehand(operation) {error in
            if let error = error {
                userBlock?(error)
                return
            }
            
            // リクエスト作成
            let request: NCMBRequest
            do {
                request = try self.createRequestForSave(url,
                                                        operation: operation)
                // リクエストが作成できなかった場合のエラーを返却
            } catch let connectionError {
                userBlock?(connectionError)
                return
            }
            // 通信
            let session = NCMBURLSession(requestAsync: request)
            session.dataAsyncConnection {result in
                switch result {
                case .failure(let requestError):
                    //通信エラー or mbエラー
                    self.mergePreviousOperation(operation)
                    userBlock?(requestError)
                case .success(let responseData):
                    guard let responseDict = responseData as? [String: Any] else {
                        fatalError("Invalid responseData")
                    }
                    self.afterSave(responseDict, operations: operation)
                    userBlock?(nil)
                }
            }
        }
    }
//
///**
// mobile backendにオブジェクトを保存する。非同期通信を行う。
// @param userBlock 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)saveInBackgroundWithBlock:(NCMBErrorResultBlock)userBlock{
    public func saveAsync(block userBlock: NCMBErrorResultBlock?) {
//    NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
        let url = self.returnBaseUrl(ncmbClassName, objectId: objectId)
//    [self saveInBackgroundWithBlock:url block:userBlock];
        self.saveAsync(url, block: userBlock)
//}
    }
//
///**
// mobile backendにオブジェクトを保存する。非同期通信を行い、通信後は指定されたセレクタを実行する。
// @param target 呼び出すセレクタのターゲット
// @param selector 実行するセレクタ
// */
//- (void)saveInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func saveAsync(target: AnyObject, selector: Selector) {
//    if (!target || !selector){
//        [NSException raise:@"NCMBInvalidValueException" format:@"target and selector must not be nil."];
//    }
//    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//    [self saveInBackgroundWithBlock:^(NSError *error) {
        self.saveAsync {error in
//        [invocation retainArguments];
//        [invocation setArgument:&error atIndex:2];
//        [invocation invoke];
            _ = target.perform(selector, with: error as NSError?)
//    }];
        }
//}
    }
//
///**
// save用のNCMBConnectionを作成する
// @param url APIリクエストするURL
// @param operation オブジェクトの操作履歴
// @return save用のNCMBConnection
// */
//- (NCMBRequest*)createRequestForSave:(NSString*)url operation:(NSMutableDictionary*)operation error:(NSError**)error {
    private func createRequestForSave(_ url: String, operation: NCMBOperationSet?) throws -> NCMBRequest {
//    NSMutableDictionary *jsonDic = [NSMutableDictionary dictionary];
        var jsonDic: [String: Any] = [:]
//    if ([operation count] != 0){
        if !(operation?.isEmpty ?? true) {
//        NSMutableDictionary *ncmbDic = [self convertToJSONDicFromOperation:operation];
            var ncmbDic = self.convertToJSONDicFromOperation(operation)
//        //プロパティのACLを更新された場合がOperationQueueで管理されないのでここで追加
//        if (_ACL != nil && _ACL.isDirty){
            if let acl = acl, acl.isDirty {
//            [ncmbDic setObject:_ACL.dicACL forKey:@"acl"];
                ncmbDic["acl"] = acl.dicACL
//        }
            }
//        jsonDic = [self convertToJSONFromNCMBObject:ncmbDic];
            jsonDic = self.convertToJSONFromNCMBObject(ncmbDic) as! [String: Any]
//    }
        }
//
//    NSString *method = nil;
        let method: String
//    if (!self.objectId){
        if self.objectId == nil {
//        method = @"POST";
            method = "POST"
//    } else {
        } else {
//        method = @"PUT";
            method = "PUT"
//    }
        }
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:url
        print(#function, "url=", url, "method=", method)
        let request = NCMBRequest(urlString: url,
                                  method: method,
                                  header: nil,
                                  body: jsonDic)
//                                                     method:method
//                                                     header:nil
//                                                       body:jsonDic];
//    return request;
        return request
//}
    }
//
///**
// saveAll用のリクエスト配列を作成する
// @param obj リクエストに追加するNCMBObject
// @param operation リクエストに追加するオブジェクトの操作履歴
// @return ncmbDic リクエスト用のNSDictionary
// */
    ///NOT used... NO header...
//- (NSDictionary*)returnRequestDictionaryForSaveAll:(NCMBObject*)obj operation:(NSMutableDictionary*)operation {
//    NSMutableDictionary *operationDic = [obj convertToJSONDicFromOperation:operation];
//    NSMutableDictionary *ncmbDic = [NSMutableDictionary dictionaryWithObject:[obj convertToJSONFromNCMBObject:operationDic] forKey:@"body"];
//    if (obj.objectId == nil){
//        [ncmbDic setObject:@"POST" forKey:@"method"];
//    } else {
//        [ncmbDic setObject:@"PUT" forKey:@"method"];
//    }
//    [ncmbDic setObject:[self returnRequestUrlForBatchAPI:obj.ncmbClassName objectId:obj.objectId]
//                forKey:@"path"];
//    return ncmbDic;
//}
//
///**
// クラス名とobjectIdを受け取ってバッチ用APIリクエストURLを作成する
// @param ncmbClassName クラス名
// @param objectId オブジェクトID
// @return バッチ用APIリクエストURL
// */
//- (NSString*)returnRequestUrlForBatchAPI:(NSString*)ncmbClassName objectId:(NSString*)objectId{
    private func returnRequestUrlForBatchAPI(_ ncmbClassName: String, objectId: String?) -> String {
//    //ベースのURLを作成
//    NSString *baseUrl = [self returnBaseUrl:ncmbClassName objectId:objectId];
        let baseUrl = self.returnBaseUrl(ncmbClassName, objectId: objectId)
//    return [NSString stringWithFormat:@"%@/%@", API_VERSION_V1, baseUrl];
        return "\(API_VERSION_V1)/\(baseUrl)"
//}
    }
//
///**
// 電波状況を見てmobile backendにオブジェクトを保存する。
// 通信できない場合は、次回オンライン時に保存される。
// 保存処理が完了する前にアプリが終了した場合は、次回アプリ起動後オンライン時に保存される。
// 保存処理が保留にされた場合、再度保存処理を実行した場合には指定したコールバックは実行されません。
// @param callback saveEventuallyを実行したあとに呼び出されるcallback。
// callbackは次の引数を持つ必要がある（NSError *error）
// saveEventually実行時にオフラインだった場合はerrorにnilが渡される
// */
//- (void)saveEventually:(NCMBErrorResultBlock)callback{
    public func saveEventually(_ callback: NCMBErrorResultBlock?) {
//    //通信状況を取得するNCMBReachabilityのインスタンスを作成
//    NCMBReachability *reachability = [NCMBReachability sharedInstance];
        let reachability = NCMBReachability.shared
//
//    //通信できる場合はsaveInBackgroundWithBlockを呼び出して終了
//    [reachability getCurrentReachabilityStatus];
        reachability.getCurrentReachabilityStatus()
//    if ([reachability isReachableToTarget]){
        if reachability.isReachableToTarget() {
//        [self saveInBackgroundWithBlock:^(NSError *error) {
            self.saveAsync {error in
//            if (error){
//                callback(error);
//            } else {
//                callback(nil);
//            }
                callback?(error)
//        }];
            }
//    } else {
        } else {
//        dispatch_queue_t sub_queue = dispatch_queue_create("saveEventuallyWithTargetSelector", NULL);
            let sub_queue = DispatchQueue(label: "saveEventuallyWithTargetSelector")
//        dispatch_async(sub_queue, ^{
            sub_queue.async {
//            //ローカルに保存する処理をsaveDataとしてまとめる
//            NSMutableDictionary *operation = [self beforeConnection];
                let operation = self.beforeConnection()
//            NSMutableDictionary *operationDic = [self convertToJSONDicFromOperation:operation];
                let operationDic = self.convertToJSONDicFromOperation(operation)
//            NSMutableDictionary *ncmbDic = [self convertToJSONFromNCMBObject:operationDic];
                let ncmbDic = self.convertToJSONFromNCMBObject(operationDic)
//            NSMutableDictionary *saveData;
//            NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
                let url = self.returnBaseUrl(self.ncmbClassName, objectId: self.objectId)
//            saveData = [NSMutableDictionary dictionaryWithDictionary:@{@"path":url,
                var saveData: [String: Any] = [
                    "path": url,
//                                                                       @"saveData":ncmbDic
                    "saveData": ncmbDic
//                                                                       }
//                        ];
                ]
//            if (self.objectId){
                if self.objectId != nil {
//                [saveData setObject:@"PUT" forKey:@"method"];
                    saveData["method"] = "PUT"
//            } else {
                } else {
//                [saveData setObject:@"POST" forKey:@"method"];
                    saveData["method"] = "POST"
//            }
                }
//
//            //ファイルに保存処理を書き出す
//            NSError *error = nil;
                do {
//            [self saveCommandToFile:saveData error:&error];
                    try self.saveCommandToFile(saveData)
                    callback?(nil)
//
//            if (error){
                } catch {
//                //ファイルへの書き出しでエラーがあった場合
//                callback(error);
                    callback?(error)
//            } else {
//                //通信状態の監視をスタート
//                //[reachability startNotifier];
//                callback(nil);
//            }
                }
//        });
            }
//    }
        }
//}
    }
//
///**
// eventually用の処理をファイルに書き出す
// */
//- (void)saveCommandToFile:(NSDictionary*)localDic error:(NSError**)error{
    public func saveCommandToFile(_ localDic: [String: Any]) throws {
//    //ファイルに保存処理を書き出す
//    NSData *localData = [NSKeyedArchiver archivedDataWithRootObject:localDic];
        let localData = NSKeyedArchiver.archivedData(withRootObject: localDic)
//
//    //ファイル名はタイムスタンプ_オペレーションのアドレス
//    NSString *path = [NSString stringWithFormat:@"%@%@_%p", COMMAND_CACHE_FOLDER_PATH, [[NCMBDateFormat getFileNameDateFormat] stringFromDate:[NSDate date]], localDic];
        let path = String(format: "\(COMMAND_CACHE_FOLDER_PATH)%@_%016x",
            NCMBDateFormat.getFileNameDateFormat().string(from: Date()),
            Int(bitPattern: ObjectIdentifier(localDic as AnyObject)))
//    [localData writeToFile:path options:NSDataWritingAtomic error:error];
        let url = URL(fileURLWithPath: path)
        try localData.write(to: url, options: .atomicWrite)
//}
    }
//
///**
// ncmbClassNameを見て、APIリクエスト用のパスの一部を決定する
// */
//- (NSString*)returnBaseUrl:(NSString*)ncmbClassName objectId:(NSString*)objectId{
    private func returnBaseUrl(_ ncmbClassName: String, objectId: String?) -> String {
//    //既定クラスでURLがクラス名と一致しないものを用意
//    NSDictionary *endpoint = @{@"user":@"users",
//                               @"role":@"roles",
//                               @"push":@"push",
//                               @"installation":@"installations",
//                               @"file":@"files"};
//    NSString *classUrl = nil;
//    if ([[endpoint allKeys] containsObject:ncmbClassName]){
//        classUrl = [NSString stringWithFormat:@"%@", [endpoint objectForKey:ncmbClassName]];
//    } else {
//        classUrl = [NSString stringWithFormat:@"classes/%@", ncmbClassName];
//    }
        let classUrl = NCMB.baseUrl(ncmbClassName: ncmbClassName)
//
//    //APIリクエスト用のURLを作成
//    if (objectId){
        if let objectId = objectId {
//        return [NSString stringWithFormat:@"%@/%@", classUrl, self.objectId];
            return "\(classUrl)/\(objectId)"    //### `self.objectId` -> objectId (param)
//    } else {
        } else {
//        return classUrl;
            return classUrl
//    }
        }
//}
    }
//
//MARK: - delete
//
///**
// リクエストURLを受け取ってdeleteを実行する
// @param url リクエストURL
// @param error エラーを保持するポインタ
// */
    ///Do NOT use thid method
//- (void)delete:(NSString *)url error:(NSError **)error{
    internal func __delete(_ url: String) throws {
        fatalError("\(#function): Sync methods not supported")
//    // 非同期を同期にする
//    semaphore = dispatch_semaphore_create(0);
//
//    // リクエスト作成
//    NCMBRequest *request = [[NCMBRequest alloc]initWithURLString:url method:@"DELETE" header:nil body:nil];
//    NCMBURLSession *session = [[NCMBURLSession alloc]initWithRequestSync:request];
//    NSError __block *sessionError = nil;
//    // 通信
//    [session dataAsyncConnectionWithBlock:^(id response, NSError *e) {
//        if (e){
//            sessionError = e;
//        }else{
//            [self afterDelete];
//        }
//        dispatch_semaphore_signal(semaphore);
//    }];
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//    if(error){
//        *error = sessionError;
//    }
//}
    }
//
///**
// オブジェクトをmobile backendとローカル上から削除する
// @param error エラーを保持するポインタを保持するポインタ
// */
    ///Do NOT use thid method
//- (void)delete:(NSError**)error{
    public func __delete() throws {
        fatalError("\(#function): Sync methods not supported")
//    if (_objectId){
//        NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
//        return [self delete:url error:error];
//    } else {
//        if (error){
//            NSError *localError = [NSError errorWithDomain:ERRORDOMAIN
//                                                      code:400003
//                                                  userInfo:@{NSLocalizedDescriptionKey:@"objectId is empty."}
//                                   ];
//            *error = localError;
//        }
//    }
//}
    }
//
///**
// リクエストURLを受け取ってdeleteを実行する。非同期通信を行う。
// @param url リクエストURL
// @param userBlock 削除後に実行されるblock
// */
//- (void)deleteInBackgroundWithBlock:(NSString *)url block:(NCMBErrorResultBlock)userBlock{
    internal func deleteAsync(_ url: String, block userBlock: NCMBErrorResultBlock?) {
//    //リクエストを作成
//    NCMBRequest *request = [[NCMBRequest alloc]initWithURLString:url method:@"DELETE" header:nil body:nil];
        let request = NCMBRequest(urlString: url,
                                  method: "DELETE",
                                  header: nil,
                                  body: nil)
//    NCMBURLSession *session = [[NCMBURLSession alloc]initWithRequestAsync:request];
        let session = NCMBURLSession(requestAsync: request)
//
//    //非同期通信を実行
//    [session dataAsyncConnectionWithBlock:^(id responseData, NSError *error) {
        session.dataAsyncConnection {result in
//        if (!error){
            switch result {
            case .success:
//            [self afterDelete];
                self.afterDelete()
                userBlock?(nil)
//        }
//        // コールバック実行
            case .failure(let error):
//        [self executeUserCallback:userBlock error:error];
                userBlock?(error)
            }
//    }];
        }
//}
    }
//
///**
// オブジェクトをmobile backendとローカル上から削除する。非同期通信を行う。
// @param userBlock 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)deleteInBackgroundWithBlock:(NCMBErrorResultBlock)userBlock{
    public func deleteAsync(block userBlock: NCMBErrorResultBlock?) {
//    if (_objectId){
        if let objectId = objectId {
//        NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
            let url = self.returnBaseUrl(ncmbClassName, objectId: objectId)
//        [self deleteInBackgroundWithBlock:url block:userBlock];
            self.deleteAsync(url, block: userBlock)
//    } else {
        } else {
//        if (userBlock){
            if let userBlock = userBlock {
//            NSError *localError = [NSError errorWithDomain:ERRORDOMAIN
                let localError = NSError(domain: ERRORDOMAIN,
                                         code: 400003,
                                         userInfo: [
                                            NSLocalizedDescriptionKey: "objectId is empty."
                    ])
//                                                      code:400003
//                                                  userInfo:@{NSLocalizedDescriptionKey:@"objectId is empty."}
//                                   ];
//            userBlock(localError);
                userBlock(localError)
//        }
            }
//    }
        }
//}
    }
//
///**
// オブジェクトをmobile backendとローカル上から削除する。非同期通信を行い、通信後は指定されたセレクタを実行する。
// @param target 呼び出すセレクタのターゲット
// @param selector 実行するセレクタ
// */
//- (void)deleteInBackgroundWithTarget:(id)target
    public func deleteAsync(_ target: NSObject, selector: Selector) {
//                            selector:(SEL)selector{
//
//    NSMethodSignature* signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//
//    [self deleteInBackgroundWithBlock:^(NSError *error) {
        self.deleteAsync {error in
//        [invocation retainArguments];
//        [invocation setArgument:&error atIndex:2];
//        [invocation invoke];
            target.perform(selector, with: error as NSError?)
//    }];
        }
//}
    }
//
///**
// 通信状況を見てmobile backendからオブジェクトを削除する。
// 通信できない場合は、次回オンライン時に削除される。
// 削除処理が実行される前にアプリが終了した場合は、次回アプリ起動後オンライン時に削除される。
// この場合再度処理を実行しても指定したコールバックは実行されない。
// @param callback saveEventuallyを実行したあとに呼び出されるcallback。
// callbackは次の引数を持つ必要がある（NSError *error）
// deleteEventually実行時にオフラインだった場合はerrorにnilが渡される。
// */
//- (void)deleteEventually:(NCMBErrorResultBlock)callback{
    public func deleteEventually(_ callback: NCMBErrorResultBlock?) {
//    if (_objectId){
        if let objectId = objectId {
//        //通信状況を取得するNCMBReachabilityのインスタンスを作成
//        NCMBReachability *reachability = [NCMBReachability sharedInstance];
            let reachability = NCMBReachability.shared
//
//        //通信できる場合はsaveInBackgroundWithBlockを呼び出して終了
//        [reachability getCurrentReachabilityStatus];
            reachability.getCurrentReachabilityStatus()
//        if ([reachability isReachableToTarget]){
            if reachability.isReachableToTarget() {
//            [self deleteInBackgroundWithBlock:^(NSError *error) {
                self.deleteAsync {error in
//                if (error){
//                    callback(error);
//                } else {
//                    callback(nil);
//                }
                    callback?(error)
//            }];
                }
//        } else {
            } else {
//            dispatch_queue_t sub_queue = dispatch_queue_create("deleteEventually", NULL);
                let sub_queue = DispatchQueue(label: "deleteEventually")
//            dispatch_async(sub_queue, ^{
                sub_queue.async {
//                NSMutableDictionary *deleteData;
//                NSString *url = [self returnBaseUrl:_ncmbClassName objectId:_objectId];
                    let url = self.returnBaseUrl(self.ncmbClassName, objectId: objectId)
//                deleteData = [NSMutableDictionary dictionaryWithDictionary:@{@"path":url,
                    let deleteData = [
                        "path": url,
//                                                                             @"method":@"DELETE"
                        "method": "DELETE"
//                                                                             }
//                              ];
                    ]
//
//                //ファイルに保存処理を書き出す
//                NSError *error = nil;
                    do {
//                [self saveCommandToFile:deleteData error:&error];
                        try self.saveCommandToFile(deleteData)
                        callback?(nil)
//
//                if (error){
                    } catch let error {
//                    //ファイルへの書き出しでエラーがあった場合
//                    callback(error);
                        callback?(error)
                    }
//                } else {
//                    //通信状態の監視をスタート
//                    //[reachability startNotifier];
//                    callback(nil);
//                }
//            });
                }
//        }
            }
//    } else {
        } else {
//        if (callback){
            if let callback = callback {
//            NSError *localError = [NSError errorWithDomain:ERRORDOMAIN
                let localError = NSError(domain: ERRORDOMAIN,
                                         code: 400003,
                                         userInfo: [NSLocalizedDescriptionKey: "objectId is empty."])
//                                                      code:400003
//                                                  userInfo:@{NSLocalizedDescriptionKey:@"objectId is empty."}
//                                   ];
//            callback(localError);
                callback(localError)
//        }
            }
//    }
        }
//}
    }
//
///**
// ローカルオブジェクトをリセットする
// */
//- (void)afterDelete{
    internal func afterDelete() {
//    _objectId = nil;
        objectId = nil
//    _createDate = nil;
        createDate = nil
//    _updateDate = nil;
        updateDate = nil
//    _ncmbClassName = nil;
        ncmbClassName = ""
//    estimatedData = nil;
        estimatedData = [:]
//    operationSetQueue = nil;
        operationSetQueue = []
//}
    }
//
//MARK: - convert
//
///**
// 操作履歴からDictionary作成
// @param operations オブジェクトの操作履歴を保持するNSMutableDictionaryオブジェクト
// */
//-(NSMutableDictionary *)convertToJSONDicFromOperation:(NSMutableDictionary*)operations{
    internal func convertToJSONDicFromOperation(_ operations: NCMBOperationSet?) -> [String: Any] {
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
// @param convertKey 変換するキー
// @return JSONオブジェクトから変換されたオブジェクト
// */
//- (id)convertToNCMBObjectFromJSON:(id)jsonData convertKey:(NSString*)convertKey{
    internal func convertToNCMBObjectFromJSON(_ jsonData: Any?, convertKey: String?) -> Any? {
//    if(![self isValidType:jsonData]){
        if !self.isValidType(jsonData) {
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Invalid type for object value." userInfo:nil] raise];
            fatalError("Invalid type for object value.")
//    };
        }
//
//    if (jsonData == NULL){
        guard let jsonData = jsonData else {
//        //objがNULLだったら
//        return nil;
            return nil
        }
//    } else if ([jsonData isKindOfClass:[NSDictionary class]]){
        switch jsonData {
        case let jsonDic as [String: Any]:
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
                    } else {
                        fatalError("iso not found in date")
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
//                id obj = [NCMBObject convertClass:jsonData ncmbClassName:[jsonData objectForKey:@"className"]];
                    let obj = NCMBObject.convertClass(jsonDic, ncmbClassName: jsonDic["className"] as? String ?? "*missing className*")
//                return obj;
                    return obj
//
//            } else if ([typeStr isEqualToString:@"Relation"]){
                case "Relation":
//                //objがリレーションだったら
//                NCMBRelation *relation = [[NCMBRelation alloc] initWithClassName:self key:convertKey];
                    let relation = NCMBRelation(parent: self, key: convertKey)
//                relation.targetClass = [jsonData objectForKey:@"className"];
                    relation.targetClass = jsonDic["className"] as? String
//                return relation;
                    return relation
//            } else if ([typeStr isEqualToString:@"Object"]){
                case "Object":
//                id obj = [NCMBObject convertClass:jsonData ncmbClassName:[jsonData objectForKey:@"className"]];
                    let obj = NCMBObject.convertClass(jsonDic, ncmbClassName: jsonDic["className"] as? String ?? "*missing className*")
//                return obj;
                    return obj
//
//            }
                default:
                    fatalError("Unknown type")
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
                    let convertedObj = self.convertToNCMBObjectFromJSON(value, convertKey: convertKey)
//                [dic setObject:convertedObj forKey:key];
                    dic[key] = convertedObj
//            }
                }
//            return dic;
                return dic
//        }
            }
//    } else if ([jsonData isKindOfClass:[NSArray class]]){
        case let jsonArr as [Any]:
//        //NSMutableArray *jsonArray = [NSMutableArray arrayWithObject:jsonData];
//        NSMutableArray *array = [NSMutableArray array];
//        for (int i = 0; i < [jsonData count]; i++){
//            //objがNSArrayだったら再帰呼び出し
//            array[i] = [self convertToNCMBObjectFromJSON:jsonData[i] convertKey:nil];
//        }
//        return array;
            return jsonArr.map {self.convertToNCMBObjectFromJSON($0, convertKey: nil)}
//    }
        default:
//    //その他の型(文字列、数値、真偽値)はそのまま返却
//    return jsonData;
            return jsonData
        }
//}
    }
//
///**
// NCMB形式の日付型NSDateFormatterオブジェクトを返す
// */
//-(NSDateFormatter*)createNCMBDateFormatter{
    internal func createNCMBDateFormatter() -> DateFormatter {
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
    internal func convertToJSONFromNCMBObject(_ obj: Any?) -> Any {
//    if(![self isValidType:obj]){
        if !self.isValidType(obj) {
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Invalid type for object value." userInfo:nil] raise];
            fatalError("Invalid type for object value.")
//    };
        }
//
//    if (obj == NULL || obj == nil){
        guard let obj = obj else {
//        //objがNULLだったら
//        return [NSNull null];
            return NSNull()
        }
//    } else if ([obj isKindOfClass:[NSDate class]]){
        switch obj {
        case let date as Date:
//        //objが日付型だったら
//        NSMutableDictionary *jsonObj = [NSMutableDictionary dictionary];
            var jsonObj: [String: Any] = [:]
//        [jsonObj setObject:@"Date" forKey:@"__type"];
            jsonObj["__type"] = "Date"
//        NSDateFormatter *dateFormatter = [self createNCMBDateFormatter];
            let dateFormatter = self.createNCMBDateFormatter()
//        NSString *dateStr = [dateFormatter stringFromDate:obj];
            let dateStr = dateFormatter.string(from: date)
//        [jsonObj setObject:dateStr forKey:@"iso"];
            jsonObj["iso"] = dateStr
//        return jsonObj;
            return jsonObj
//    } else if ([obj isKindOfClass:[NCMBGeoPoint class]]){
        case let geoPoint as NCMBGeoPoint:
//        //objが位置情報だったら
//        NCMBGeoPoint *geoPoint = obj;
//        NSMutableDictionary *jsonObj = [NSMutableDictionary dictionary];
            var jsonObj: [String: Any] = [:]
//        [jsonObj setObject:@"GeoPoint" forKey:@"__type"];
            jsonObj["__type"] = "GeoPoint"
//        [jsonObj setObject:[NSNumber numberWithDouble:geoPoint.latitude] forKey:@"latitude"];
            jsonObj["latitude"] = geoPoint.latitude
//        [jsonObj setObject:[NSNumber numberWithDouble:geoPoint.longitude] forKey:@"longitude"];
            jsonObj["longitude"] = geoPoint.longitude
//        return jsonObj;
            return jsonObj
//
//    } else if ([obj isKindOfClass:[NCMBObject class]]){
        case let ncmbObj as NCMBObject:
//        //objがポインタだったら
//        NCMBObject *ncmbObj = obj;
//        NSMutableDictionary *jsonObj = [NSMutableDictionary dictionary];
            var jsonObj: [String: Any] = [:]
//        [jsonObj setObject:@"Pointer" forKey:@"__type"];
            jsonObj["__type"] = "Pointer"
//        [jsonObj setObject:[ncmbObj ncmbClassName] forKey:@"className"];
            jsonObj["className"] = ncmbObj.ncmbClassName
//        [jsonObj setObject:[ncmbObj objectId] forKey:@"objectId"];
            jsonObj["objectId"] = ncmbObj.objectId
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
        case let dict as [String: Any]:
//        NSMutableDictionary *jsonObj = [NSMutableDictionary dictionary];
            var jsonObj: [String: Any] = [:]
//        //objがNSDictionaryだったら再帰呼び出し
//        for (id Key in [obj keyEnumerator]){
            for (key, value) in dict {
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
            return arr.map{self.convertToJSONFromNCMBObject($0)}
//    }
        default:
//    //その他の型(文字列、数値、真偽値)はそのまま返却
//    return obj;
            return obj
        }
//}
    }
//
///**
// 引数の配列とクラス名からサブクラスor既定クラスorその他のインスタンスを作成する
// @param result オブジェクトのデータ
// @param ncmbClassName mobile backend上のクラス名
// */
//+ (id)convertClass:(NSMutableDictionary*)result
    internal static func convertClass(_ result: [String: Any], ncmbClassName: String) -> NCMBObject {
//     ncmbClassName:(NSString*)ncmbClassName{
//    NSString *subClassName = @"";
//    subClassName = [[SubClassHandler sharedInstance] className:ncmbClassName];
        if let subClassName = SubClassHandler.shared.className(ncmbClassName) {
//    if (subClassName != nil){
//        Class vcClass = NSClassFromString(ncmbClassName);
            let vcClass = NSClassFromString(subClassName) as! NCMBSubclassing.Type
//        NCMBObject *obj = [vcClass object];
            let obj = vcClass.object()
//        obj.objectId = [result objectForKey:@"objectId"];
            obj.objectId = (result["objectId"] as! String)
//        //[vcClass objectWithoutDataWithObjectId:[result objectForKey:@"objectId"]];
//        //obj.ncmbCl = ncmbClassName;
//        [obj afterFetch:result isRefresh:YES];
            obj.afterFetch(result, isRefresh: true)
//        return obj;
            return obj
        }
//    } else if ([ncmbClassName isEqualToString:@"user"]){
        switch ncmbClassName {
        case "user":
//        NCMBUser *user = [[NCMBUser alloc] initWithClassName:@"user"];
            let user = NCMBUser()
//        [user afterFetch:result isRefresh:YES];
            user.afterFetch(result, isRefresh: true)
//        return user;
            return user
//    } else if ([ncmbClassName isEqualToString:@"push"]){
        case "push":
//        NCMBPush *push = [NCMBPush push];
            let push = NCMBPush()
//        [push afterFetch:result isRefresh:YES];
            push.afterFetch(result, isRefresh: true)
//        return push;
            return push
//    } else if ([ncmbClassName isEqualToString:@"installation"]){
        case "installation":
//        NCMBInstallation *installation = [NCMBInstallation currentInstallation];
            let installation = NCMBInstallation.current()
//        [installation afterFetch:result isRefresh:YES];
            installation.afterFetch(result, isRefresh: true)
//        return installation;
            return installation
//    } else if ([ncmbClassName isEqualToString:@"role"]){
        case "role":
//        NCMBRole *role = [[NCMBRole alloc] initWithClassName:@"role"];
            let role = NCMBRole()
//        [role afterFetch:result isRefresh:YES];
            role.afterFetch(result, isRefresh: true)
//        return role;
            return role
//    } else if ([ncmbClassName isEqualToString:@"file"]){
        case "file":
//        NCMBFile *file = [NCMBFile fileWithName:[result objectForKey:@"fileName"] data:nil];
            let file = NCMBFile.file(name: result["fileName"] as! String, data: nil)
//        [file afterFetch:result isRefresh:YES];
            file.afterFetch(result, isRefresh: true)
//        return file;
            return file
//    } else {
        default:
//        NCMBObject *obj = [NCMBObject objectWithClassName:ncmbClassName];
            let obj = NCMBObject(className: ncmbClassName)
//        [obj afterFetch:result isRefresh:YES];
            obj.afterFetch(result, isRefresh: true)
//        return obj;
            return obj
//    }
        }
//}
    }
//
//// コールバック実行
//- (void)executeUserCallback:(NCMBErrorResultBlock)userCallback error:(NSError*)error{
//    if(userCallback){
//        userCallback(error);
//    }
//}
//
//@end
}

extension NCMBObject {
    public subscript(key: String) -> Any? {
        get {
            return self.object(forKey: key)
        }
        
        set {
            self.setObject(newValue, forKey: key)
        }
    }
}
