//
//  NCMBRole.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/01
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
//#import "NCMBObject.h"
import Foundation
//
//@class NCMBQuery;
//@class NCMBUser;
//@class NCMBRelation;
//
///**
// NCMBRoleクラスは、会員をグルーピングするロールを作成・取得・削除を行い、
// 会員や子ロールの追加・削除ができるようにするものです。
// */
//@interface NCMBRole : NCMBObject
public class NCMBRole: NCMBObject {
//
//@property (nonatomic, readonly) NSString *roleName;
    private(set) public var roleName: String?
//
///**
// 指定されたロールの名前で、NCMBRoleインスタンスを作成する
// @param roleName 作成するロールの名前
// @return NCMBRoleのインスタンスを返却
// */
//+ (NCMBRole*)roleWithName:(NSString*)roleName;
//
///**
// 指定したユーザーをロールに追加する
// @param user 追加する会員
// */
//- (void)addUser:(NCMBUser*)user;
//
///**
// 指定したロールを子ロールとして追加する
// @param role 追加するロール
// */
//- (void)addRole:(NCMBRole*)role;
//
///**
// 子ロールへのリレーションを取得する
// @return 子ロールへのリレーション。設定されていない場合はnilを返却する
// */
//- (NCMBRelation*)relationForRole;
//
///**
// ロールに属した会員へのリレーションを取得する
// @return ロールに属した会員へのリレーション。設定されていない場合はnilを返却する
// */
//- (NCMBRelation*)relationForUser;
//
///**
// NCMBQueryインスタンスを新規作成する
// @return roleクラスがセットされたNCMBQueryインスタンスを返却する
// */
//+ (NCMBQuery*)query;
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
//#import "NCMBRole.h"
//
//#import "NCMBUser.h"
//#import "NCMBRelation.h"
//#import "NCMBQuery.h"
//
//#import "NCMBObject+Private.h"
//
//
//@interface NCMBRole()
//
//@property (nonatomic) NCMBRelation *users;
    private var users: Any! //### NSArray(?!) or NCMBRelation
//@property (nonatomic) NCMBRelation *roles;
    private var roles: Any! //### NSArray(?!) or NCMBRelation
//
//@end
//
//@interface NCMBRole()
//
//@end
//
//@implementation NCMBRole
//
//- (NSDictionary*)getLocalData{
    override func getLocalData() -> [String : Any] {
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[super getLocalData]];
        var dic = super.getLocalData()
//    if (_roleName){
        if let roleName = self.roleName {
//        [dic setObject:_roleName forKey:@"roleName"];
            dic["roleName"] = roleName
//    }
        }
//    return dic;
        return dic
//}
    }
//
//- (instancetype)init{
    internal required init() {
//    self = [self initWithClassName:@"role"];
        super.init(className: "role")
//    _roles = [self relationforKey:@"belongRole"];
        roles = self.relation(forKey: "belongRole")
//    _users = [self relationforKey:@"belongUser"];
        users = self.relation(forKey: "belongUser")
//    return self;
//}
    }
//
//- (NCMBRole*)initWithRoleName:(NSString*)roleName{
    public convenience init(roleName: String) {
//    self = [self init];
        self.init()
//    _roleName = roleName;
        self.roleName = roleName
//    [self setObject:_roleName forKey:@"roleName"];
        self.setObject(roleName, forKey: "roleName")
//    return self;
//}
    }
///**
// 指定されたロールの名前で、NCMBRoleインスタンスを作成する
// @param roleName 作成するロールの名前
// @return NCMBRoleのインスタンスを返却
// */
    //Use `init(roleName:)` instead
//+ (NCMBRole*)roleWithName:(NSString*)roleName {
//    return [[NCMBRole alloc] initWithRoleName:roleName];
//}
//
///**
// 指定したユーザーをロールに追加する
// @param user 追加する会員
// */
//- (void)addUser:(NCMBUser*)user{
    public func add(_ user: NCMBUser) {
//    //ロールに属するユーザー情報がNSArrayだった場合はリレーションを新規作成する
//    if ([_users isKindOfClass:[NSArray class]]) {
        if users is [Any] {
//        _users = [self relationforKey:@"belongUser"];
            users = self.relation(forKey: "belongUser")
//    }
        }
//    //プロパティの更新
//    [_users addObject:(NCMBObject*)user];
        (users as! NCMBRelation).add(user)
//
//}
    }
//
///**
// 指定したロールを子ロールとして追加する
// @param role 追加するロール
// */
//- (void)addRole:(NCMBRole*)role{
    public func add(_ role: NCMBRole) {
//    //ロールに属する子ロール情報がNSArrayだった場合はリレーションを新規作成する
//    if ([_roles isKindOfClass:[NSArray class]]) {
        if roles is [Any] {
//        _roles = [self relationforKey:@"belongRole"];
            roles = self.relation(forKey: "belongRole")
//    }
        }
//    //プロパティの更新
//    [_roles addObject:(NCMBObject*)role];
        (roles as! NCMBRelation).add(role)
//}
    }
//
///**
// 子ロールへのリレーションを取得する
// @return 子ロールへのリレーション。設定されていない場合はnilを返却する
// */
//- (NCMBRelation*)relationForRole{
    public func relationForRole() -> NCMBRelation? {
//    if ([_roles isKindOfClass:[NCMBRelation class]]){
//        return _roles;
//    } else {
//        return nil;
//    }
        return roles as? NCMBRelation
//}
    }
//
///**
// ロールに属した会員へのリレーションを取得する
// @return ロールに属した会員へのリレーション。設定されていない場合はnilを返却する
// */
//- (NCMBRelation*)relationForUser{
    public func relationForUser() -> NCMBRelation? {
//    if ([_users isKindOfClass:[NCMBRelation class]]){
//        return _users;
//    } else {
//        return nil;
//    }
        return users as? NCMBRelation
//}
    }
//
//#pragma mark override
//
//- (void)afterFetch:(NSMutableDictionary *)response isRefresh:(BOOL)isRefresh{
    override func afterFetch(_ response: [String : Any], isRefresh: Bool) {
//    [super afterFetch:response isRefresh:isRefresh];
        super.afterFetch(response, isRefresh: isRefresh)
//    if ([response objectForKey:@"belongRole"]){
        if let belongRole = response["belongRole"] {
//        _roles = [self convertToNCMBObjectFromJSON:[response objectForKey:@"belongRole"] convertKey:@"belongRole"];
            roles = self.convertToNCMBObjectFromJSON(belongRole, convertKey: "belongRole")
//    }
        }
//    if ([response objectForKey:@"belongUser"]){
        if let belongUser = response["belongUser"] {
//        _users = [self convertToNCMBObjectFromJSON:[response objectForKey:@"belongUser"] convertKey:@"belongUser"];
            users = self.convertToNCMBObjectFromJSON(belongUser, convertKey: "belongUser")
//    }
        }
//    if ([response objectForKey:@"roleName"]){
        if let roleName = response["roleName"] as? String {
//        _roleName = [response objectForKey:@"roleName"];
            self.roleName = roleName
//    }
        }
//}
    }
//
//- (void)afterDelete{
    override func afterDelete() {
//    [super afterDelete];
        super.afterDelete()
//    _roleName = nil;
        roleName = nil
//    _users = nil;
        users = nil
//    _roles = nil;
        roles = nil
//}
    }
//
//#pragma mark query
//
//+ (NCMBQuery*)query{
    public override static func query() -> NCMBQuery {
//    return [NCMBQuery queryWithClassName:@"role"];
        return NCMBQuery(className: "role")
//}
    }
//
//@end
}
