//
//  NCMBACL.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/01.
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
//@class NCMBUser;
//@class NCMBRole;
//
///**
// NCMBACLクラスは、オブジェクトに対する読込書込権限を管理するクラスです。
//
// NCMBObject毎にNCMBACLを持ち、ユーザのグループであるロールや特定の個別ユーザなどにも付与することができます。
//
// 例えば、全てのユーザに読込権限を与え、特定のユーザには読込権限に加え書込権限を与えるといったことができます。
// */
//@interface NCMBACL : NSObject
public class NCMBACL {
//
///**
// ACLの情報を辞書型で保持する
// */
//@property (nonatomic,strong) NSMutableDictionary *dicACL;
    public var dicACL: [String: [String: Bool]] = [:]
//@property (nonatomic, readonly)BOOL isDirty;
    private(set) public var isDirty: Bool = false
//
///**
// NCMBACLのインスタンスを生成。デフォルトでは全ての権限が許可されている。
// */
//+ (NCMBACL *)ACL;
//
///**
// 指定したユーザのみ読込書込権限が許可されたNCMBACLのインスタンスを生成。
// @param user 権限を設定するユーザ
// */
//+ (NCMBACL *)ACLWithUser:(NCMBUser *)user;
//
///**
// オブジェクト生成時にACLが指定されなかった場合のデフォルトACLをaclで指定したアクセス権限に設定する。
// currentUserAccessがYESの場合は、さらにオブジェクトを生成したユーザーに読込書込権限を設定する。
// NOの場合はaclで指定されたデフォルトACLが設定される。
// @param acl デフォルトACLとして設定するNCMBACLインスタンス
// @param currentUserAccess オブジェクトを生成したユーザーへのアクセス権限をデフォルトACLに追加する設定
// */
//+ (void)setDefaultACL:(NCMBACL *)acl withAccessForCurrentUser:(BOOL)currentUserAccess;
//
//
//
///** @name Public Access */
//
///**
// パブリックな読込権限を設定する
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// */
//- (void)setPublicReadAccess:(BOOL)allowed;
//
///**
// パブリックな読込権限の有無を取得する
// @return YES:読み込み権限あり NO:読み込み権限なし
// */
//- (BOOL)isPublicReadAccess;
//
///**
// パブリックな書込権限を設定
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// */
//- (void)setPublicWriteAccess:(BOOL)allowed;
//
///**
// パブリックな書込権限の有無を取得する
// @return YES:書き込み権限あり NO:書き込み権限なし
// */
//- (BOOL)isPublicWriteAccess;
//
//
//
///** @name Role Access */
//
///**
// 指定した名前を持つロールの読込権限の有無を取得する
// @param name 読込権限の有無を調べるロール名
// @return YES:読み込み権限あり NO:読み込み権限なし
// */
//- (BOOL)isReadAccessForRoleWithName:(NSString *)name;
//
///**
// 指定した名前を持つロールの読込権限を設定する
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// @param name 読込権限を設定するロール名
// */
//- (void)setReadAccess:(BOOL)allowed forRoleWithName:(NSString *)name;
//
///**
// 指定した名前を持つロールの書込権限の有無を取得する
// @param name 書込権限の有無を調べるロール名
// @return YES:書き込み権限あり NO:書き込み権限なし
// */
//- (BOOL)isWriteAccessForRoleWithName:(NSString *)name;
//
///**
// 指定した名前を持つロールの書込権限を設定する
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// @param name 書込権限を設定するロール名
// */
//- (void)setWriteAccess:(BOOL)allowed forRoleWithName:(NSString *)name;
//
///**
// 指定したロールの読込権限の有無を取得する
// @param  role 読込権限の有無を調べるロール
// @return YES:読み込み権限あり NO:読み込み権限なし
// */
//- (BOOL)isReadAccessForRole:(NCMBRole *)role;
//
///**
// 指定したロールの読込権限を設定する
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// @param role 読込権限を設定するロール
// */
//- (void)setReadAccess:(BOOL)allowed forRole:(NCMBRole *)role;
//
///**
// 指定したロールの書込権限の有無を取得する
// @param role 書込権限の有無を調べるロール
// @return YES:書き込み権限あり NO:書き込み権限なし
// */
//- (BOOL)isWriteAccessForRole:(NCMBRole *)role;
//
///**
// 指定したロールの書込権限を設定する
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// @param role 書込権限を設定するロール
// */
//- (void)setWriteAccess:(BOOL)allowed forRole:(NCMBRole *)role;
//
//
///** @name User Access */
//
///**
// 指定したIDに対応するユーザーの読込権限を設定する
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// @param userId 読込権限を設定するユーザID
// */
//- (void)setReadAccess:(BOOL)allowed forUserId:(NSString *)userId;
//
///**
// 指定したIDに対応するユーザーの読込権限の有無を取得する
// @param userId 読込権限の有無を調べるユーザID
// @return YES:読み込み権限あり NO:読み込み権限なし
// */
//- (BOOL)isReadAccessForUserId:(NSString *)userId;
//
///**
// 指定したIDに対応するユーザーの書込権限を設定する
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// @param userId 書込権限を設定するユーザID
// */
//- (void)setWriteAccess:(BOOL)allowed forUserId:(NSString *)userId;
//
///**
// 指定したIDに対応するユーザーの書込権限の有無を取得する
// @param userId 書込権限の有無を調べるユーザID
// @return YES:書き込み権限あり NO:書き込み権限なし
// */
//- (BOOL)isWriteAccessForUserId:(NSString *)userId;
//
///**
// 指定したユーザーの読込権限を設定する
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// @param user 読込権限を設定するユーザ
// */
//- (void)setReadAccess:(BOOL)allowed forUser:(NCMBUser *)user;
//
///**
// 指定したユーザーの読込権限の有無を取得する
// @param user 読込権限の有無を調べるユーザ
// @return YES:読み込み権限あり NO:読み込み権限なし
// */
//- (BOOL)isReadAccessForUser:(NCMBUser *)user;
//
///**
// 指定したユーザーの書込権限を設定
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// @param user 書込権限を設定するユーザ
// */
//- (void)setWriteAccess:(BOOL)allowed forUser:(NCMBUser *)user;
//
///**
// 指定したユーザーの書込権限の有無を取得
// @param user 書込権限の有無を調べるユーザ
// @return YES:書き込み権限あり NO:書き込み権限なし
// */
//- (BOOL)isWriteAccessForUser:(NCMBUser *)user;
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
//#import "NCMBACL.h"
//
//#import "NCMBUser.h"
//#import "NCMBRole.h"
//
//@implementation NCMBACL
//
//static NCMBACL *defaultACL;
    private static var defaultACL: NCMBACL?

    private let READ = "read"
    private let WRITE = "write"

    //MARK: init

    internal init() {
    }

///**
// NCMBACLのインスタンスを生成。デフォルトでは全ての権限が許可されている。
// */
//+ (NCMBACL *)ACL{
    public static var acl: NCMBACL {
//    if ([defaultACL isKindOfClass:[NCMBACL class]]){
//        return defaultACL;
//    }
//    NCMBACL *acl = [[NCMBACL alloc] init];
//    return acl;
        return defaultACL ?? NCMBACL()
//}
    }
//
///**
// 指定したユーザのみ読込書込権限が許可されたNCMBACLのインスタンスを生成。
// @param user 権限を設定するユーザ
// */
//+ (NCMBACL *)ACLWithUser:(NCMBUser *)user{
    public static func acl(with user: NCMBUser) -> NCMBACL {
//    NCMBACL *acl = [[NCMBACL alloc] init];
        let acl = NCMBACL()
//    [acl setReadAccess:YES forUser:user];
        acl.setReadAccess(true, for: user)
//    [acl setWriteAccess:YES forUser:user];
        acl.setWriteAccess(true, for: user)
//
//    return acl;
        return acl
//}
    }
//
///**
//
// オブジェクト生成時にACLが指定されなかった場合のデフォルトACLをaclで指定したアクセス権限に設定する。currentUserAccessがYESの場合は、さらにオブジェクトを生成したユーザーに読込書込権限を設定する。NOの場合はaclで指定されたアクセス権限のみが設定される。
// @param acl アクセス権限情報
// @param currentUserAccess YESの場合は、aclで指定されたアクセス権限に加えてオブジェクトを生成したユーザーに読込書込権限を設定、
// NOの場合は、aclで指定されたアクセス権限のみを設定する。
// */
//+ (void)setDefaultACL:(NCMBACL *)acl withAccessForCurrentUser:(BOOL)currentUserAccess{
    public static func setDefault(_ acl: NCMBACL, withAccessForCurrentUser currentUserAccess: Bool) {
//    if (currentUserAccess){
        if currentUserAccess {
//        [acl setReadAccess:YES forUser:[NCMBUser currentUser]];
            acl.setReadAccess(true, for: NCMBUser.currentUser!)
//    }
        }
//    defaultACL = acl;
        defaultACL = acl
//}
    }
//
//MARK: Public ACL
//
///** @name Public Access */
//
///**
// パブリックな読込権限を設定
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// */
//- (void)setPublicReadAccess:(BOOL)allowed{
    public func setPublicReadAccess(_ allowed: Bool) {
//    _isDirty = YES;
        isDirty = true
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    if ([self.dicACL objectForKey:@"*"]) {
//        [dic setDictionary:[self.dicACL objectForKey:@"*"]];
//    }
        var dic = self.dicACL["*"] ?? [:]
//    if (allowed) {
        if allowed {
//        [dic setObject:[NSNumber numberWithBool:allowed] forKey:READ];
            dic[READ] = allowed
//        [self.dicACL setObject:dic forKey:@"*"];
            self.dicACL["*"] = dic
//    }else{
        } else {
//        if ([dic objectForKey:WRITE]) {
            if dic[WRITE] != nil {
//            [dic removeObjectForKey:READ];
                dic.removeValue(forKey: READ)
//            [self.dicACL setObject:dic forKey:@"*"];
                self.dicACL["*"] = dic
//        }else{
            } else {
//            [self.dicACL removeObjectForKey:@"*"];
                self.dicACL.removeValue(forKey: "*")
//        }
            }
//    }
        }
//}
    }
//
///**
// パブリックな読込権限の有無を取得
// */
//- (BOOL)isPublicReadAccess{
    public func isPublicReadAccess() -> Bool {
//    if ([[_dicACL allKeys] containsObject:@"*"]){
        if let publicACL = dicACL["*"] {
//        NSDictionary *publicACL = [_dicACL objectForKey:@"*"];
//        if ([publicACL objectForKey:@"read"]){
//            return YES;
            return publicACL[READ] != nil
//        }
//    }
        }
//    return NO;
        return false
//}
    }
//
///**
// パブリックな書込権限を設定
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// */
//- (void)setPublicWriteAccess:(BOOL)allowed{
    public func setPublicWriteAccess(_ allowed: Bool) {
//    _isDirty = YES;
        isDirty = true
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    if ([self.dicACL objectForKey:@"*"]) {
//        [dic setDictionary:[self.dicACL objectForKey:@"*"]];
//    }
        var dic = self.dicACL["*"] ?? [:]
//    if (allowed) {
        if allowed {
//        [dic setObject:[NSNumber numberWithBool:allowed] forKey:WRITE];
            dic[WRITE] = allowed
//        [self.dicACL setObject:dic forKey:@"*"];
            self.dicACL["*"] = dic
//    }else{
        } else {
//        if ([dic objectForKey:READ]) {
            if dic[READ] != nil {
//            [dic removeObjectForKey:WRITE];
                dic.removeValue(forKey: WRITE)
//            [self.dicACL setObject:dic forKey:@"*"];
                self.dicACL["*"] = dic
//        }else{
            } else {
//            [self.dicACL removeObjectForKey:@"*"];
                self.dicACL.removeValue(forKey: "*")
//        }
            }
//    }
        }
//}
    }
//
///**
// パブリックな書込権限の有無を取得
// */
//- (BOOL)isPublicWriteAccess{
    public func isPublicWriteAccess() -> Bool {
//    NSDictionary *publicACL = [_dicACL objectForKey:@"*"];
        let publicACL = dicACL["*"]
//    if ([publicACL objectForKey:@"write"]){
        return publicACL?[WRITE] != nil
//        return YES;
//    } else {
//        return NO;
//    }
//}
    }
//
//
//MARK: ACL for Role
//
///** @name Role Access */
//
///**
// 指定した名前を持つロールの読込権限の有無を取得
// @param name 読込権限の有無を調べるロール名
// */
//- (BOOL)isReadAccessForRoleWithName:(NSString *)name{
    public func isReadAccess(forRoleWithName name: String) -> Bool {
//    NSString *roleName = [NSString stringWithFormat:@"role:%@",name];
        let roleName = "role:\(name)"
//    return [[[self.dicACL objectForKey:roleName] objectForKey:READ] boolValue];
        return self.dicACL[roleName]?[READ] ?? false
//}
    }
//
///**
// 指定した名前を持つロールの読込権限を設定
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// @param name 読込権限を設定するロール名
// */
//- (void)setReadAccess:(BOOL)allowed forRoleWithName:(NSString *)name{
    public func setReadAccess(_ allowed: Bool, forRoleWithName name: String) {
//    _isDirty = YES;
        isDirty = true
//    NSString *roleName = [NSString stringWithFormat:@"role:%@",name];
        let roleName = "role:\(name)"
//
//    NSMutableDictionary *dic  = [NSMutableDictionary dictionary];
//    if ([self.dicACL objectForKey:roleName]) {
//        [dic setDictionary:[self.dicACL objectForKey:roleName]];
//    }
        var dic = self.dicACL[roleName] ?? [:]
//    if (allowed) {
        if allowed {
//        [dic setObject:[NSNumber numberWithBool:allowed] forKey:READ];
            dic[READ] = allowed
//        [self.dicACL setObject:dic forKey:roleName];
            self.dicACL[roleName] = dic
//
//        if ([self.dicACL objectForKey:@"*"]) {
            if self.dicACL["*"] != nil {
//            [[self.dicACL objectForKey:@"*"] removeObjectForKey:READ];
                self.dicACL["*"]!.removeValue(forKey: READ)
//            if ([[[self.dicACL objectForKey:@"*"] allKeys] count]==0) {
                if self.dicACL["*"]!.isEmpty {
//                [self.dicACL removeObjectForKey:@"*"];
                    self.dicACL.removeValue(forKey: "*")
//            }
                }
//
//        }
            }
//    }else{
        } else {
//        if ([dic objectForKey:WRITE]) {
            if dic[WRITE] != nil {
//            [dic removeObjectForKey:READ];
                dic.removeValue(forKey: READ)
//            [self.dicACL setObject:dic forKey:roleName];
                self.dicACL[roleName] = dic
//        }else{
            } else {
//            [self.dicACL removeObjectForKey:roleName];
//        }
            }
//    }
        }
//}
    }
//
///**
// 指定した名前を持つロールの書込権限の有無を取得
// @param name 書込権限の有無を調べるロール名
// */
//- (BOOL)isWriteAccessForRoleWithName:(NSString *)name{
    public func isWriteAccess(forRoleWithName name: String) -> Bool {
//    NSString *roleName = [NSString stringWithFormat:@"role:%@",name];
        let roleName = "role:\(name)"
//    return [[[self.dicACL objectForKey:roleName] objectForKey:WRITE] boolValue];
        return self.dicACL[roleName]?[WRITE] != nil
//}
    }
//
///**
// 指定した名前を持つロールの書込権限を設定
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// @param name 書込権限を設定するロール名
// */
//- (void)setWriteAccess:(BOOL)allowed forRoleWithName:(NSString *)name{
    public func setWriteAccess(_ allowed: Bool, forRoleWithName name: String) {
//    _isDirty = YES;
        isDirty = true
//    NSString *roleName = [NSString stringWithFormat:@"role:%@",name];
        let roleName = "role:\(name)"
//    NSMutableDictionary *dic  = [NSMutableDictionary dictionary];
//    if ([self.dicACL objectForKey:roleName]) {
//        [dic setDictionary:[self.dicACL objectForKey:roleName]];
//    }
        var dic = self.dicACL[roleName] ?? [:]
//    if (allowed) {
        if allowed {
//        [dic setObject:[NSNumber numberWithBool:allowed] forKey:WRITE];
            dic[WRITE] = allowed
//        [self.dicACL setObject:dic forKey:roleName];
            self.dicACL[roleName] = dic
//        if ([self.dicACL objectForKey:@"*"]) {
            if self.dicACL["*"] != nil {
//            [[self.dicACL objectForKey:@"*"] removeObjectForKey:WRITE];
                self.dicACL["*"]!.removeValue(forKey: WRITE)
//            if ([[[self.dicACL objectForKey:@"*"] allKeys] count]==0) {
                if self.dicACL["*"]!.isEmpty {
//                [self.dicACL removeObjectForKey:@"*"];
                    self.dicACL.removeValue(forKey: "*")
//            }
                }
//
//        }
            }
//
//    }else{
        } else {
//        if ([dic objectForKey:READ]) {
            if dic[READ] != nil {
//            [dic removeObjectForKey:WRITE];
                dic.removeValue(forKey: WRITE)
//            [self.dicACL setObject:dic forKey:roleName];
                self.dicACL[roleName] = dic
//        }else{
            } else {
//            [self.dicACL removeObjectForKey:roleName];
                self.dicACL.removeValue(forKey: roleName)
//        }
            }
//    }
        }
//}
    }
//
///**
// 指定したロールの読込権限の有無を取得
// @param  role 読込権限の有無を調べるロール
// */
//- (BOOL)isReadAccessForRole:(NCMBRole *)role{
    public func isReadAccess(for role: NCMBRole) -> Bool {
//    return [self isReadAccessForRoleWithName:role.roleName];
        return self.isReadAccess(forRoleWithName: role.roleName!)
//}
    }
//
///**
// 指定したロールの読込権限を設定
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// @param role 読込権限を設定するロール
// */
//- (void)setReadAccess:(BOOL)allowed forRole:(NCMBRole *)role{
    public func setReadAccess(_ allowed: Bool, for role: NCMBRole) {
//    [self setReadAccess:allowed forRoleWithName:role.roleName];
        self.setReadAccess(allowed, forRoleWithName: role.roleName!)
//}
    }
//
///**
// 指定したロールの書込権限の有無を取得
// @param role 書込権限の有無を調べるロール
// */
//- (BOOL)isWriteAccessForRole:(NCMBRole *)role{
    public func isWriteAccess(for role: NCMBRole) -> Bool {
//    return [self isWriteAccessForRoleWithName:role.roleName];
        return self.isWriteAccess(forRoleWithName: role.roleName!)
//}
    }
//
///**
// 指定したロールの書込権限を設定
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// @param role 書込権限を設定するロール
// */
//- (void)setWriteAccess:(BOOL)allowed forRole:(NCMBRole *)role{
    public func setWriteAccess(_ allowed: Bool, for role: NCMBRole) {
//    [self setWriteAccess:allowed forRoleWithName:role.roleName];
        self.setWriteAccess(allowed, forRoleWithName: role.roleName!)
//}
    }
//
//MARK: ACL for User
//
///** @name User Access */
//
///**
// 指定したIDに対応するユーザーの読込権限を設定
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// @param userId 読込権限を設定するユーザID
// */
//- (void)setReadAccess:(BOOL)allowed forUserId:(NSString *)userId{
    public func setReadAccess(_ allowed: Bool, forUserId userId: String) {
//    _isDirty = YES;
        isDirty = true
//    //既存のACLを取り出す
//    NSMutableDictionary *dic  = [NSMutableDictionary dictionary];
//    if ([self.dicACL objectForKey:userId]) {
//        [dic setDictionary:[self.dicACL objectForKey:userId]];
//    }
        var dic = self.dicACL[userId] ?? [:]
//
//    if (allowed) {
        if allowed {
//        [dic setObject:[NSNumber numberWithBool:allowed] forKey:READ];
            dic[READ] = allowed
//        [self.dicACL setObject:dic forKey:userId];
            self.dicACL[userId] = dic
//        if ([self.dicACL objectForKey:@"*"]) {
            if self.dicACL["*"] != nil {
//            [[self.dicACL objectForKey:@"*"] removeObjectForKey:READ];
                self.dicACL["*"]!.removeValue(forKey: READ)
//            if ([[[self.dicACL objectForKey:@"*"] allKeys] count]==0) {
                if self.dicACL["*"]!.isEmpty {
//                [self.dicACL removeObjectForKey:@"*"];
                    self.dicACL.removeValue(forKey: "*")
//            }
                }
//
//        }
            }
//    }else{
        } else {
//        if ([dic objectForKey:WRITE]) {
            if dic[WRITE] != nil {
//            [dic removeObjectForKey:READ];
                dic.removeValue(forKey: READ)
//            [self.dicACL setObject:dic forKey:userId];
                self.dicACL[userId] = dic
//        }else{
            } else {
//            [self.dicACL removeObjectForKey:userId];
                self.dicACL.removeValue(forKey: userId)
//        }
            }
//    }
        }
//}
    }
//
///**
// 指定したIDに対応するユーザーの読込権限の有無を取得
// @param userId 読込権限の有無を調べるユーザID
// */
//- (BOOL)isReadAccessForUserId:(NSString *)userId{
    public func isReadAccess(forUserId userId: String) -> Bool {
//    return [[[self.dicACL objectForKey:userId] objectForKey:READ] boolValue];
        return self.dicACL[userId]?[READ] ?? false
//}
    }
//
///**
// 指定したIDに対応するユーザーの書込権限を設定
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// @param userId 書込権限を設定するユーザID
// */
//- (void)setWriteAccess:(BOOL)allowed forUserId:(NSString *)userId{
    public func setWriteAccess(_ allowed: Bool, forUserId userId: String) {
//    _isDirty = YES;
        isDirty = true
//    NSMutableDictionary *dic  = [NSMutableDictionary dictionary];
//    if ([self.dicACL objectForKey:userId]) {
//        [dic setDictionary:[self.dicACL objectForKey:userId]];
//    }
        var dic = self.dicACL[userId] ?? [:]
//
//    if (allowed) {
        if allowed {
//        [dic setObject:[NSNumber numberWithBool:allowed] forKey:WRITE];
            dic[WRITE] = allowed
//        [self.dicACL setObject:dic forKey:userId];
            self.dicACL[userId] = dic
//        if ([self.dicACL objectForKey:@"*"]) {
            if self.dicACL["*"] != nil {
//            [[self.dicACL objectForKey:@"*"] removeObjectForKey:WRITE];
                self.dicACL["*"]!.removeValue(forKey: WRITE)
//            if ([[[self.dicACL objectForKey:@"*"] allKeys] count]==0) {
                if self.dicACL["*"]!.isEmpty {
//                [self.dicACL removeObjectForKey:@"*"];
                    self.dicACL.removeValue(forKey: "*")
//            }
                }
//        }
            }
//
//    }else{
        } else {
//        if ([dic objectForKey:READ]) {
            if dic[READ] != nil {
//            [dic removeObjectForKey:WRITE];
                dic[WRITE] = nil
//            [self.dicACL setObject:dic forKey:userId];
                self.dicACL[userId] = dic
//        }else{
            } else {
//            [self.dicACL removeObjectForKey:userId];
                self.dicACL.removeValue(forKey: userId)
//        }
            }
//    }
        }
//}
    }
//
///**
// 指定したIDに対応するユーザーの書込権限の有無を取得
// @param userId 書込権限の有無を調べるユーザID
// */
//- (BOOL)isWriteAccessForUserId:(NSString *)userId{
    public func isWriteAccess(for userId: String) -> Bool {
//    return [[[self.dicACL objectForKey:userId] objectForKey:WRITE] boolValue];
        return self.dicACL[userId]?[WRITE] ?? false
//}
    }
//
///**
// 指定したユーザーの読込権限を設定
// @param allowed 読込権限の設定（YES:許可／NO:許可取り消し）
// @param user 読込権限を設定するユーザ
// */
//- (void)setReadAccess:(BOOL)allowed forUser:(NCMBUser *)user{
    public func setReadAccess(_ allowed: Bool, for user: NCMBUser) {
//    [self setReadAccess:allowed forUserId:[user objectId]];
        self.setReadAccess(allowed, forUserId: user.objectId!)
//}
    }
//
///**
// 指定したユーザーの読込権限の有無を取得
// @param user 読込権限の有無を調べるユーザ
// */
//- (BOOL)isReadAccessForUser:(NCMBUser *)user{
    public func isReadAccess(for user: NCMBUser) -> Bool {
//    return [self isReadAccessForUserId:[user objectId]];
        return self.isReadAccess(forUserId: user.objectId!)
//}
    }
//
///**
// 指定したユーザーの書込権限を設定
// @param allowed 書込権限の設定（YES:許可／NO:許可取り消し）
// @param user 書込権限を設定するユーザ
// */
//- (void)setWriteAccess:(BOOL)allowed forUser:(NCMBUser *)user{
    public func setWriteAccess(_ allowed: Bool, for user: NCMBUser) {
//    [self setWriteAccess:allowed forUserId:[user objectId]];
        self.setWriteAccess(allowed, forUserId: user.objectId!)
//}
    }
//
///**
// 指定したユーザーの書込権限の有無を取得
// @param user 書込権限の有無を調べるユーザ
// */
//- (BOOL)isWriteAccessForUser:(NCMBUser *)user{
    public func isWriteAccess(for user: NCMBUser) -> Bool {
//    return [self isWriteAccessForUserId:[user objectId]];
        return self.isWriteAccess(for: user.objectId!)
//}
    }
//
//
//@end
}
