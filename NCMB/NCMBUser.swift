//
//  NCMBUser.swift
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
//#import <Foundation/Foundation.h>
import Foundation
//
//#import "NCMBObject.h"
//
//@class NCMBAnonymousUtils;
//@class NCMBQuery;
//
///**
// NCMBUserクラスは、ニフクラ mobile backend上に保存されたユーザデータを管理するクラスです。
// ユーザの新規登録やログイン/ログアウト、会員情報の更新・取得・削除を行います。
// また、パスワードリセットやメールアドレス認証のリクエスト送信も行います。
// */
//@interface NCMBUser : NCMBObject
public class NCMBUser: NCMBObject {
//
///** @name User */
//
///// ユーザ名
//@property (nonatomic, copy) NSString *userName;
////@property (nonatomic, strong, getter = getUserName, setter=setUserName:) NSString *userName;
//
///// パスワード
//@property (nonatomic, copy) NSString *password;
    private var _password: String?
////@property (nonatomic, strong, getter = getPassword, setter=setPassword:) NSString *password;
//
///// メールアドレス
//@property (nonatomic, copy) NSString *mailAddress;
////@property (nonatomic, strong, getter = getMailAddress, setter=setMailAddress:) NSString *mailAddress;
//
///// NCMBUserオブジェクトの登録の有無
//@property (readonly, assign) BOOL isNew;
    private(set) public var isNew: Bool = false
//
///// セッショントークン
//@property (nonatomic, copy) NSString *sessionToken;
    public var sessionToken: String?
//
///**
// NCMBUserのインスタンスを新規生成
// @return 新規生成したNCMBUserのインスタンス
// */
//+ (NCMBUser *)user;
//
//
///**
// NCMBQueryのインスタンスを新規作成する
// @return userクラスがセットされたNCMBQueryインスタンスを返却する
// */
//+ (NCMBQuery*)query;
//
///**
// 現在ログインしているユーザ情報を取得する
// もしログインしているユーザーがいない場合にはnilが返ってくる
// @return 現在ログインしているユーザオブジェクト
// */
//+ (NCMBUser *)currentUser;
//
///**
// enableAutomaticUserを設定した場合に、anonymous認証による自動会員登録を実行する。
//
// enableAutomaticUserが設定されていない場合や、すでにログイン済みの会員が存在している場合はcurrentUserと同じ処理を行う。
//
// @param block anonymous認証による会員登録がリクエストされたあとに実行されるブロック
// */
//+ (void)automaticCurrentUserWithBlock:(NCMBUserResultBlock)block;
//
///**
// enableAutomaticUserを設定した場合に、anonymous認証による自動会員登録を実行する。
//
// enableAutomaticUserが設定されていない場合や、すでにログイン済みの会員が存在している場合はcurrentUserと同じ処理を行う。
//
// @param target anonymous認証による会員登録がリクエストされたあとに実行されるセレクタのターゲット
// @param selector anonymous認証による会員登録がリクエストされたあとに実行されるセレクタ
// */
//+ (void)automaticCurrentUserWithTarget:(id)target selector:(SEL)selector;
//
///**
// ユーザが認証済みかを判定
// 　@return BOOL型YES=認証済、NO=未認証
// */
//- (BOOL)isAuthenticated;
//
///**
// 匿名ユーザの自動生成を有効化
// */
//+ (void)enableAutomaticUser;
//
///** @name Signup */
//
///**
// ユーザの新規登録。必要があればエラーをセットし、取得することもできる。
// @param error 処理中に起きたエラーのポインタ
// */
//- (void)signUp:(NSError **)error;
//
///**
// ユーザを非同期で新規登録。新規登録し終わったら与えられたblockを呼び出す。
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NSError *error)
// errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)signUpInBackgroundWithBlock:(NCMBErrorResultBlock)block;
//
///**
// ユーザを非同期で新規登録。新規登録し終わったら指定されたコールバックを呼び出す。
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。 (void)callbackWithResult:(NSError **)error
// errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)signUpInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
///**
// googleのauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param googleInfo google認証に必要なauthData
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithGoogleToken:(NSDictionary *)googleInfo withBlock:(NCMBErrorResultBlock)block;
//
///**
// twitterのauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param twitterInfo twitter認証に必要なauthData
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithTwitterToken:(NSDictionary *)twitterInfo withBlock:(NCMBErrorResultBlock)block;
//
///**
// facebookのauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param facebookInfo facebook認証に必要なauthData
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithFacebookToken:(NSDictionary *)facebookInfo withBlock:(NCMBErrorResultBlock)block;
//
///**
// appleのauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param appleInfo apple認証に必要なauthData
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithAppleToken:(NSDictionary *)appleInfo withBlock:(NCMBErrorResultBlock)block;
//
//MARK: requestAuthenticationMail
///** @name requestAuthenticationMail */
//
///**
// 指定したメールアドレスに対して、会員登録を行うためのメールを送信するよう要求する。必要があればエラーをセットし、取得することもできる。
// @param email 指定するメールアドレス
// @param error 処理中に起きたエラーのポインタ
// */
//+ (void)requestAuthenticationMail:(NSString *)email
//                            error:(NSError **)error;
//
///**
// 指定したメールアドレスに対して、会員登録を行うためのメールを送信するよう要求する。終わったら指定されたコールバックを呼び出す。
// @param email 指定するメールアドレス
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。 (void)callbackWithResult:(NSError **)error
// errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//+ (void)requestAuthenticationMailInBackground:(NSString *)email
//                                       target:(id)target
//                                     selector:(SEL)selector;
//
///**
// 指定したメールアドレスに対して、会員登録を行うためのメールを送信するよう要求する。終わったら与えられたblockを呼び出す。
// @param email 指定するメールアドレス
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある （NSError *error）
// errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//+ (void)requestAuthenticationMailInBackground:(NSString *)email
//                                        block:(NCMBErrorResultBlock)block;
//
//
///** @name LogIn */
//
///**
// ユーザ名とパスワードを指定してログイン。必要があればエラーをセットし、取得することもできる。
// @param username ログイン時に指定するユーザ名
// @param password ログイン時に指定するパスワード
// @param error 処理中に起きたエラーのポインタ
// @return ログインしたユーザの情報
// */
//+ (NCMBUser *)logInWithUsername:(NSString *)username
//                       password:(NSString *)password
//                          error:(NSError **)error;
//
//
///**
// ユーザ名とパスワードを指定して非同期でログイン。ログインし終わったら指定されたコールバックを呼び出す。
// @param username ログイン時に指定するユーザ名
// @param password ログイン時に指定するパスワード
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NCMBUser *)user error:(NSError **)error
// userにはログインしたユーザの情報が渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//+ (void)logInWithUsernameInBackground:(NSString *)username
//                             password:(NSString *)password
//                               target:(id)target
//                             selector:(SEL)selector;
//
///**
// ユーザ名とパスワードを指定して非同期でログイン。ログインし終わったら与えられたblockを呼び出す。
// @param username ログイン時に指定するユーザ名
// @param password ログイン時に指定するパスワード
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NCMBUser *user, NSError *error） userにはログインしたユーザの情報が渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//+ (void)logInWithUsernameInBackground:(NSString *)username
//                             password:(NSString *)password
//                                block:(NCMBUserResultBlock)block;
//
///**
// メールアドレスとパスワードを指定してログイン。必要があればエラーをセットし、取得することもできる。
// @param email ログイン時に指定するメールアドレス
// @param password ログイン時に指定するパスワード
// @param error 処理中に起きたエラーのポインタ
// @return ログインしたユーザの情報
// */
//+ (NCMBUser *)logInWithMailAddress:(NSString *)email
//                          password:(NSString *)password
//                             error:(NSError **)error;
//
///**
// メールアドレスとパスワードを指定して非同期でログイン。ログインし終わったら与えられたコールバックを呼び出す。
// @param email ログイン時に指定するメールアドレス
// @param password ログイン時に指定するパスワード
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NCMBUser *)user error:(NSError **)error
// userにはログインしたユーザの情報が渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//+ (void)logInWithMailAddressInBackground:(NSString *)email
//                                password:(NSString *)password
//                                  target:(id)target
//                                selector:(SEL)selector;
//
///**
// メールアドレスとパスワードを指定して非同期でログイン。ログインし終わったら与えられたblockを呼び出す。
// @param email ログイン時に指定するメールアドレス
// @param password ログイン時に指定するパスワード
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NCMBUser *user, NSError *error） userにはログインしたユーザの情報が渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//+ (void)logInWithMailAddressInBackground:(NSString *)email
//                                password:(NSString *)password
//                                   block:(NCMBUserResultBlock)block;
//
//MARK: Logout
///** @name Logout */
//
///**
// ログアウト
// */
//+ (void)logOut;
//
///**
// 非同期でログアウトを行う
// @param block ログアウトのリクエストをした後に実行されるblock
// */
//+ (void)logOutInBackgroundWithBlock:(NCMBErrorResultBlock)block;
//
///** @name requestPasswordReset */
//
///**
// 指定したメールアドレスを持つユーザのパスワードリセットを要求。ユーザが存在した場合、パスワードをリセットし、再設定のメールを送信する。必要があればエラーをセットし、取得することもできる。
// @param email 指定するメールアドレス
// @param error 処理中に起きたエラーのポインタ
// */
//+ (void)requestPasswordResetForEmail:(NSString *)email
//                               error:(NSError **)error;
//
///**
// 指定したメールアドレスを持つユーザのパスワードリセットを非同期で要求。ユーザが存在した場合、パスワードをリセットし、再設定のメールを送信する。リセットし終わったら指定されたコールバックを呼び出す。
// @param email 指定するメールアドレス
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。 (void)callbackWithResult:(NSNumber *)result error:(NSError **)error
// resultにはリセットの有無をNSNumber型で渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//+ (void)requestPasswordResetForEmailInBackground:(NSString *)email
//                                          target:(id)target
//                                        selector:(SEL)selector;
//
///**
// 指定したメールアドレスを持つユーザのパスワードリセットを非同期で要求。ユーザが存在した場合、パスワードをリセットし、再設定のメールを送信する。リセットし終わったら与えられたblockを呼び出す。
// @param email 指定するメールアドレス
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある （NSError *error）errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//+ (void)requestPasswordResetForEmailInBackground:(NSString *)email
//                                           block:(NCMBErrorResultBlock)block;
//
///**
// 匿名会員を正規会員として同期で登録する。2回のAPIリクエストが発生する。objectiId,createDate,updateDate,authdata以外の情報を引き継ぐ。必要があればエラーをセットし、取得することもできる。
// @param userName 正規会員のユーザー名
// @param password 正規会員のパスワード
// @param error 処理中に起きたエラーのポインタ
// */
//- (void)signUpFromAnonymous:(NSString *)userName password:(NSString *)password error:(NSError **)error;
//
///**
// 匿名会員を正規会員として非同期で登録する。2回のAPIリクエストが発生する。objectiId,createDate,updateDate,authdata以外の情報を引き継ぐ。必要があればエラーをセットし、取得することもできる。
// @param userName 正規会員のユーザー名
// @param password 正規会員のパスワード
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NSError *error）
// errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)signUpFromAnonymousInBackgroundWithBlock:(NSString *)userName
//                                        password:(NSString *)password
//                                           block:(NCMBErrorResultBlock)block;
///**
// 匿名会員を正規会員として非同期で登録する。2回のAPIリクエストが発生する。objectiId,createDate,updateDate,authdata以外の情報を引き継ぐ。必要があればエラーをセットし、取得することもできる。
// @param userName 正規会員のユーザー名
// @param password 正規会員のパスワード
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。 (void)callbackWithResult:(NSError **)error
// errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)signUpFromAnonymousInBackgroundWithTarget:(NSString *)userName
//                                         password:(NSString *)password
//                                           target:(id)target
//                                         selector:(SEL)selector;
//
//MARK: - link
///** @name link */
//
///**
// ログイン中のユーザー情報に、googleの認証情報を紐付ける
// @param googleInfo googleの認証情報（idとaccess_token）
// @param block 既存のauthDataのgoogle情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithGoogleToken:(NSDictionary *)googleInfo
//                  withBlock:(NCMBErrorResultBlock)block;
//
///**
// ログイン中のユーザー情報に、twitterの認証情報を紐付ける
// @param twitterInfo twitterの認証情報
// @param block 既存のauthDataのtwitter情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithTwitterToken:(NSDictionary *)twitterInfo
//                   withBlock:(NCMBErrorResultBlock)block;
//
///**
// ログイン中のユーザー情報に、facebookの認証情報を紐付ける
// @param facebookInfo facebookの認証情報
// @param block 既存のauthDataのfacebook情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithFacebookToken:(NSDictionary *)facebookInfo
//                    withBlock:(NCMBErrorResultBlock)block;
//
///**
// ログイン中のユーザー情報に、appleの認証情報を紐付ける
// @param appleInfo appleの認証情報
// @param block 既存のauthDataのapple情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithAppleToken:(NSDictionary *)appleInfo
//                    withBlock:(NCMBErrorResultBlock)block;
//
///**
// 会員情報に、引数で指定したtypeの認証情報が含まれているか確認する
// @param type 認証情報のtype（googleもしくはtwitter、facebook、apple、anonymous）
// @return 引数で指定したtypeの会員情報が含まれている場合はYESを返す
// */
//- (BOOL)isLinkedWith:(NSString *)type;
//
///**
// 会員情報から、引数で指定したtypeの認証情報を削除する
// @param type 認証情報のtype（googleもしくはtwitter、facebook、apple、anonymous）
// @param block エラー情報を返却するblock エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)unlink:(NSString *)type
//     withBlock:(NCMBErrorResultBlock)block;
//
//MARK: - mailAddressConfirm
///** @name mailAddressConfirm */
//
///**
// メールアドレスが確認済みのものかを把握する
// @return メールアドレスが確認済みの場合はYESを返す
// */
//- (BOOL)isMailAddressConfirm;
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
//#import "NCMBUser.h"
//
//#import "NCMBAnonymousUtils.h"
//#import "NCMBQuery.h"
//#import "NCMBACL.h"
//
//#import "NCMBURLSession.h"
//
//#import "NCMBObject+Private.h"
//#import "NCMBObject+Subclass.h"
//#import "NCMBRelation+Private.h"
//
//@implementation NCMBUser
//#define DATA_MAIN_PATH [NSHomeDirectory() stringByAppendingPathComponent:@"Library/"]
//#define DATA_CURRENTUSER_PATH [NSString stringWithFormat:@"%@/Private Documents/NCMB/currentUser", DATA_MAIN_PATH]
    private static var DATA_CURRENTUSER_PATH = "\(DATA_MAIN_PATH)/Private Documents/NCMB/currentUser"
//
//MARK: - URL
//#define URL_LOGIN @"login"
//#define URL_LOGOUT @"logout"
    private static let URL_LOGOUT = "logout"
//#define URL_USERS @"users"
//#define URL_AUTHENTICATION_MAIL @"requestMailAddressUserEntry"
    private static let URL_AUTHENTICATION_MAIL = "requestMailAddressUserEntry"
//#define URL_PASSWOR_RESET  @"requestPasswordReset"
    private static let URL_PASSWORD_RESET = "requestPasswordReset"
//
//#define AUTH_TYPE_GOOGLE                @"google"
    private let AUTH_TYPE_GOOGLE                = "google"
//#define AUTH_TYPE_TWITTER               @"twitter"
    private let AUTH_TYPE_TWITTER               = "twitter"
//#define AUTH_TYPE_FACEBOOK              @"facebook"
    private let AUTH_TYPE_FACEBOOK              = "facebook"
//#define AUTH_TYPE_ANONYMOUS             @"Anonymous"
    private let AUTH_TYPE_ANONYMOUS             = "Anonymous"
//#define AUTH_TYPE_APPLE                 @"apple"
    private let AUTH_TYPE_APPLE                 = "apple"
//
//static NCMBUser *currentUser = nil;
    private static var _currentUser: NCMBUser? = nil
//static BOOL isEnableAutomaticUser = NO;
    private static var isEnableAutomaticUser: Bool = false
//
//MARK: - init
//
////description用のメソッド
//- (NSDictionary*)getLocalData{
    override func getLocalData() -> [String : Any] {
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[super getLocalData]];
        var dic = super.getLocalData()
//    if (self.userName){
        if let userName = self.userName {
//        [dic setObject:self.userName forKey:@"userName"];
            dic["userName"] = userName
//    }
        }
//    if (self.mailAddress){
        if let mailAddress = self.mailAddress {
//        [dic setObject:self.mailAddress forKey:@"mailAddress"];
            dic["mailAddress"] = mailAddress
//    }
        }
//    if (self.sessionToken){
        if let sessionToken = self.sessionToken {
//        [dic setObject:self.sessionToken forKey:@"sessionToken"];
            dic["sessionToken"] = sessionToken
//    }
        }
//    return dic;
        return dic
//}
    }
//
////NCMBUserはクラス名を指定しての初期化は出来ない
//+ (NCMBObject*)objectWithClassName:(NSString *)className{
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Cannot initialize a NCMBUser with a custom class name." userInfo:nil] raise];
//    return nil;
//}
//
//- (instancetype)init{
    public required init() {
//    self = [self initWithClassName:@"user"];
        super.init(className: "user")
//    return self;
//}
    }
    //
    //NOT implemented. Use `init()` instead.
//+ (NCMBUser *)user{
//    NCMBUser *user = [[NCMBUser alloc] init];
//    return user;
//}
//
//+ (NCMBQuery*)query{
    public override static func query() -> NCMBQuery {
//    return [NCMBQuery queryWithClassName:@"user"];
        return NCMBQuery(className: "user")
//}
    }
//
//MARK: - get/set
//
///**
// ユーザー名の設定
// @param userName ユーザー名
// */
    public var userName: String? {
//- (void)setUserName:(NSString *)userName{
        set {
//    [self setObject:userName forKey:@"userName"];
            self.setObject(newValue, forKey: "userName")
//}
        }
//
///**
// ユーザー名の取得
// @return NSString型ユーザー名
// */
//- (NSString *)userName{
        get {
//    return [self objectForKey:@"userName"];
            return self.object(forKey: "userName") as? String
//}
        }
    }
//
///**
// パスワードの設定
// @param password パスワード
// */
    public var password: String? {
        get {
            return _password
        }
//- (void)setPassword:(NSString *)password{
        set {
//    [self setObject:password forKey:@"password"];
            self.setObject(newValue, forKey: "password")
//}
        }
    }
//
///**
// Eメールの設定
// @param mailAddress Eメール
// */
    public var mailAddress: String? {
//- (void)setMailAddress:(NSString *)mailAddress{
        set {
//    [self setObject:mailAddress forKey:@"mailAddress"];
            self.setObject(newValue, forKey: "mailAddress")
//}
        }
//
///**
// Eメールの取得
// @return NSString型メールアドレス
// */
//- (NSString *)mailAddress{
        get {
//    return [self objectForKey:@"mailAddress"];
            return self.object(forKey: "mailAddress") as? String
        }
//}
    }
//
///**
// セッショントークンの設定
// @param newSessionToken ユーザーのセッショントークンを設定する
// */
//- (void)setSessionToken:(NSString *)newSessionToken{
//    _sessionToken = newSessionToken;
//}
//
//
///**
// 現在ログイン中のユーザーのセッショントークンを返す
// @return NSString型セッショントークン
// */
//+ (NSString *)getCurrentSessionToken{
    internal static func getCurrentSessionToken() -> String? {
//    if (currentUser != nil) {
        if let user = _currentUser {
//        return currentUser.sessionToken;
            return user.sessionToken
//    }
        }
//    return nil;
        return nil
//}
    }
//
///**
// 匿名ユーザの自動生成を有効化
// */
//+ (void)enableAutomaticUser{
    public static func enableAutomaticUser() {
//    isEnableAutomaticUser = TRUE;
        isEnableAutomaticUser = false
//}
    }

    /**
     現在ログインしているユーザ情報を取得
     @return NCMBUser型ログイン中のユーザー
     */
    public static var currentUser: NCMBUser? {
        if _currentUser != nil {
            return _currentUser
        }
        _currentUser = nil
        
        //アプリ再起動などでcurrentUserがnilになった時は端末に保存したユーザ情報を取得、設定する。
        if FileManager.default.fileExists(atPath: DATA_CURRENTUSER_PATH) {
            _currentUser = NCMBUser.getFromFileCurrentUser()
        }
        return _currentUser
    }

//+ (void)automaticCurrentUserWithBlock:(NCMBUserResultBlock)block{
    public static func automaticCurrentUser(block: NCMBUserResultBlock?) {
//    if ([self currentUser]) {
        if let user = self.currentUser {
//        if(block){
//            block([self currentUser], nil);
            block?(.success(user))
//        }
//    }
//    //匿名ユーザーの自動生成がYESの時は匿名ユーザーでログインする
//    else if (isEnableAutomaticUser) {
        } else if isEnableAutomaticUser {
//        isEnableAutomaticUser = NO;
            isEnableAutomaticUser = false
//        [NCMBAnonymousUtils logInWithBlock:^(NCMBUser *user, NSError *error) {
            NCMBAnonymousUtils.logIn {result in
                switch result {
                case .success(let user):
//            if (!error) {
//                currentUser = user;
                    _currentUser = user
                    isEnableAutomaticUser = true
                    block?(.success(user))
//            }
//            isEnableAutomaticUser = YES;
//            if (block){
//                block(user, error);
                case .failure(let error):
                    isEnableAutomaticUser = true
                    block?(.failure(error))
//            }
                }
//        }];
                
            }
//    }
        }
//}
    }
//
//+ (void)automaticCurrentUserWithTarget:(id)target selector:(SEL)selector{
    public static func automaticCurrentUser(target: AnyObject, selector: Selector) {
//    if (!target || !selector){
//        [NSException raise:@"NCMBInvalidValueException" format:@"target and selector must not be nil."];
//    }
//    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//    [self automaticCurrentUserWithBlock:^(NCMBUser *user, NSError *error) {
        self.automaticCurrentUser {result in
            switch result {
            case .success(let user):
                _ = target.perform(selector, with: user, with: nil)
            case .failure(let error):
//        [invocation retainArguments];
//        [invocation setArgument:&user atIndex:2];
//        [invocation setArgument:&error atIndex:3];
//        [invocation invoke];
                _ = target.perform(selector, with: nil, with: error)
            }
//    }];
        }
//}
    }
//
///**
// 認証済みか判定
// @return BOOL型YES=認証済、NO=未認証
// */
//- (BOOL)isAuthenticated{
    var isAuthenticated: Bool {
//    BOOL isAuthenticateFlag = FALSE;
        var isAuthenticateFlag = false
//    if (self.sessionToken) {
        if self.sessionToken != nil {
//        isAuthenticateFlag =TRUE;
            isAuthenticateFlag = true
//    }
        }
//    return isAuthenticateFlag;
        return isAuthenticateFlag
//}
    }
//
//MARK: - signUp
//
///**
// ユーザの新規登録。必要があればエラーをセットし、取得することもできる。
// @param error 処理中に起きたエラーのポインタ
// */
//- (void)signUp:(NSError **)error{
    public func __signUp() throws {
        fatalError("\(#function): Sync methods not supported")
//    [self save:error];
//}
    }
//
///**
// ユーザ の新規登録(非同期)
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpInBackgroundWithBlock:(NCMBErrorResultBlock)block{
    public func signUpAsync(block: @escaping NCMBErrorResultBlock) {
//    [self saveInBackgroundWithBlock:block];
        self.saveAsync(block: block)
//}
    }
//
///**
// target用ユーザの新規登録処理
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ
// */
//- (void)signUpInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func signUpAsync(target: AnyObject, selector: Selector) {
//    [self saveInBackgroundWithTarget:target selector:selector];
        self.saveAsync(target: target, selector: selector)
//}
    }
//
///**
// typeで指定したsns情報のauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param snsInfo snsの認証に必要なauthData
// @param type 認証情報のtype
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithToken:(NSDictionary *)snsInfo withType:(NSString *)type withBlock:(NCMBErrorResultBlock)block{
    public func signUp(token snsInfo: [String: Any], type: String, block: NCMBErrorResultBlock?) {
//    //既存のauthDataのtype情報のみ更新する
//    NSMutableDictionary *userAuthData = [NSMutableDictionary dictionary];
        var userAuthData: [String: Any] = [:]
//    if([[self objectForKey:@"authData"] isKindOfClass:[NSDictionary class]]){
        if let authData = self.object(forKey: "authData") as? [String: Any] {
//        userAuthData = [NSMutableDictionary dictionaryWithDictionary:[self objectForKey:@"authData"]];
            userAuthData = authData
//    }
        }
//    [userAuthData setObject:snsInfo forKey:type];
        userAuthData[type] = snsInfo
//    [self setObject:userAuthData forKey:@"authData"];
        self.setObject(userAuthData, forKey: "authData")
//    [self signUpInBackgroundWithBlock:^(NSError *error) {
        self.signUpAsync {error in
//        if (error) {
            if error != nil {
//            [userAuthData removeObjectForKey:type];
                userAuthData.removeValue(forKey: type)
//            [self setObject:userAuthData forKey:@"authData"];
                self.setObject(userAuthData, forKey: "authData")
//        }
            }
//        [self executeUserCallback:block error:error];
            block?(error)
//    }];
        }
//}
    }
//
///**
// googleのauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param googleInfo google認証に必要なauthData
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithGoogleToken:(NSDictionary *)googleInfo withBlock:(NCMBErrorResultBlock)block{
    public func signUp(googleToken googleInfo: [String: Any], block: NCMBErrorResultBlock?) {
//    [self signUpWithToken:googleInfo withType:AUTH_TYPE_GOOGLE withBlock:block];
        self.signUp(token: googleInfo, type: AUTH_TYPE_GOOGLE, block: block)
//}
    }
//
///**
// twitterのauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param twitterInfo twitter認証に必要なauthData
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithTwitterToken:(NSDictionary *)twitterInfo withBlock:(NCMBErrorResultBlock)block{
    public func signUp(twitterToken twitterInfo: [String: Any], block: NCMBErrorResultBlock?) {
//    [self signUpWithToken:twitterInfo withType:AUTH_TYPE_TWITTER withBlock:block];
        self.signUp(token: twitterInfo, type: AUTH_TYPE_TWITTER, block: block)
//}
    }
//
///**
// facebookのauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param facebookInfo facebook認証に必要なauthData
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithFacebookToken:(NSDictionary *)facebookInfo withBlock:(NCMBErrorResultBlock)block{
    public func signUp(facebookToken facebookInfo: [String: Any], block: NCMBErrorResultBlock?) {
//    [self signUpWithToken:facebookInfo withType:AUTH_TYPE_FACEBOOK withBlock:block];
        self.signUp(token: facebookInfo, type: AUTH_TYPE_FACEBOOK, block: block)
//}
    }
//
///**
// appleのauthDataをもとにニフクラ mobile backendへの会員登録(ログイン)を行う
// @param appleInfo apple認証に必要なauthData
// @param block サインアップ後に実行されるblock
// */
//- (void)signUpWithAppleToken:(NSDictionary *)appleInfo withBlock:(NCMBErrorResultBlock)block{
    public func signUp(appleToken appleInfo: [String: Any], block: NCMBErrorResultBlock?) {
//    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
        let bundleIdentifier = Bundle.main.bundleIdentifier ?? ""
//    NSDictionary *appleInfoParam = [appleInfo mutableCopy];
        var appleInfoParam = appleInfo
//    [appleInfoParam setValue:bundleIdentifier forKey:@"client_id"];
        appleInfoParam["client_id"] = bundleIdentifier
//    [self signUpWithToken:appleInfoParam withType:AUTH_TYPE_APPLE withBlock:block];
        self.signUp(token: appleInfoParam, type: AUTH_TYPE_APPLE, block: block)
//}
    }
//
//MARK: - signUpAnonymous
//
//- (void)signUpFromAnonymous:(NSString *)userName password:(NSString *)password error:(NSError **)error{
    public func signUpFromAnonymous(userName: String, password: String) throws {
        fatalError("\(#function): Sync methods not supported")
//    //匿名ユーザーか判定し、正規用ユーザー作成
//    NCMBUser *signUpUser = [self checkAnonymousUser];
//    //正規ユーザーにデータをセットし、削除用ユーザー作成
//    NCMBUser *deleteUser = [self setTheDataForUser:signUpUser userName:userName password:password];
//    //新規ユーザー登録
//    NSError *errorLocal = nil;
//    [signUpUser signUp:&errorLocal];
//    if(errorLocal){
//        if (error){
//            *error = errorLocal;
//        }
//    } else {
//        //匿名ユーザー削除
//        currentUser = deleteUser;
//        [deleteUser delete:&errorLocal];
//        if(errorLocal){
//            if (error){
//                *error = errorLocal;
//            }
//        } else {
//            currentUser = signUpUser;
//        }
//    }
//}
    }
//
//
//- (void)signUpFromAnonymousInBackgroundWithBlock:(NSString *)userName
    public func signUpFromAnonymousAsync(userName: String,
                                                password: String,
//                                        password:(NSString *)password
//                                           block:(NCMBErrorResultBlock)block{
        block: NCMBErrorResultBlock?) {
//    dispatch_queue_t queue = dispatch_queue_create("saveInBackgroundWithBlock", NULL);
//    dispatch_async(queue, ^{
//        //匿名ユーザーか判定し、正規用ユーザー作成
//        NCMBUser *signUpUser = [self checkAnonymousUser];
        guard let signUpUser = self.checkAnonymousUser() else {
            block?(NCMBError.noLoginUser)
            return
        }
//        //正規ユーザーにデータをセットし、削除用ユーザー作成
//        NCMBUser *deleteUser = [self setTheDataForUser:signUpUser userName:userName password:password];
        let deleteUser = self.setTheData(for: signUpUser, userName: userName, password: password)
//        //新規ユーザー登録
//        [signUpUser signUpInBackgroundWithBlock:^(NSError *error) {
        signUpUser.signUpAsync {error in
//            if(error){
            if let error = error {
//                [self executeUserCallback:block error:error];
                block?(error)
//            }else{
            } else {
//                //匿名ユーザー削除
//                currentUser = deleteUser;
                NCMBUser._currentUser = deleteUser
//                [deleteUser deleteInBackgroundWithBlock:^(NSError *error) {
                deleteUser.deleteAsync {error in
//                    currentUser = signUpUser;
                    NCMBUser._currentUser = signUpUser
//                    [self executeUserCallback:block error:error];
                    block?(error)
//                }];
                }
//            }
            }
//        }];
        }
//    });
//}
    }
//
///**
// target用ユーザの新規登録処理
// @param userName ユーザーネーム
// @param password パスワード
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ
// */
//- (void)signUpFromAnonymousInBackgroundWithTarget:(NSString *)userName password:(NSString *)password target:(id)target selector:(SEL)selector{
    public func signUpFromAnonymousAsync(userName: String, password: String, target: AnyObject, selector: Selector) {
//    NSMethodSignature* signature = [target methodSignatureForSelector: selector ];
//    NSInvocation* invocation = [ NSInvocation invocationWithMethodSignature: signature ];
//    [ invocation setTarget:target];
//    [ invocation setSelector: selector ];
//
//    [self signUpFromAnonymousInBackgroundWithBlock:userName password:password block:^(NSError *error) {
        self.signUpFromAnonymousAsync(userName: userName, password: password) {error in
//        [invocation setArgument:&error atIndex: 2 ];
//        [invocation invoke ];
            _ = target.perform(selector, with: error)
//    }];
        }
//}
    }
//
//- (NCMBUser *)checkAnonymousUser{
    private func checkAnonymousUser() -> NCMBUser? {
//    NCMBUser * anonymousUser = [NCMBUser currentUser];
        let anonymousUser = NCMBUser.currentUser
//    if(![NCMBAnonymousUtils isLinkedWithUser:anonymousUser]){
        if let anonymousUser = anonymousUser,
            !NCMBAnonymousUtils.isLinked(user: anonymousUser) {
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"This user is not a anonymous user." userInfo:nil] raise];
            fatalError("This user is not a anonymous user.")
//    }
        }
//    return anonymousUser;
        return anonymousUser
//}
    }
//
//- (NCMBUser *)setTheDataForUser:(NCMBUser *)signUpUser userName:(NSString *)userName password:(NSString *)password{
    private func setTheData(for signUpUser: NCMBUser, userName: String, password: String) -> NCMBUser {
//    //削除用ユーザー作成
//    NCMBUser *deleteUser = [NCMBUser user];
        let deleteUser = NCMBUser()
//    deleteUser.objectId = signUpUser.objectId;
        deleteUser.objectId = signUpUser.objectId
//    deleteUser.sessionToken = signUpUser.sessionToken;
        deleteUser.sessionToken = signUpUser.sessionToken
//
//    //saiguUp用ユーザー作成。authData以外を引き継ぐ
//    [signUpUser removeObjectForKey:@"authData"];
        signUpUser.removeObject(forKey: "authData")
//    for(id key in [signUpUser allKeys]){
        for key in signUpUser.allKeys {
//        [signUpUser setObject:[self convertToJSONFromNCMBObject:[signUpUser objectForKey:key]] forKey:key];
            signUpUser.setObject(self.convertToJSONFromNCMBObject(signUpUser.object(forKey: key)), forKey: key)
//    }
        }
//    signUpUser.userName = userName;
        signUpUser.userName = userName
//    signUpUser.password = password;
        signUpUser.password = password
//    signUpUser.objectId = nil;
        signUpUser.objectId = nil
//
//    return deleteUser;
        return deleteUser
//}
    }
//
//MARK: - requestAuthenticationMail
//
///**
// 同期で会員登録メールの要求を行う
// @param email メールアドレス
// @param error エラー
// */
//+ (void)requestAuthenticationMail:(NSString *)email
    public static func __requestAuthenticationMail(_ email: String) throws {
//                            error:(NSError **)error{
        fatalError("\(#function): Sync methods not supported")
//    [NCMBUser requestMailFromNCMB:URL_AUTHENTICATION_MAIL mail:email error:error];
//}
    }
//
///**
// 非同期で会員登録メールの要求を行う
// @param email メールアドレス
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ
// */
//+ (void)requestAuthenticationMailInBackground:(NSString *)email
    public static func requestAuthenticationMailAsync(_ email: String,
//                                       target:(id)target
        target: AnyObject,
//                                     selector:(SEL)selector{
        selector: Selector) {
//    [NCMBUser requestMailFromNCMB:URL_AUTHENTICATION_MAIL mail:email target:target selector:selector];
        NCMBUser.requestMailFromNCMB(URL_AUTHENTICATION_MAIL, mail: email, target: target, selector: selector)
//}
    }
//
///**
// 非同期で会員登録メールの要求を行う
// @param email メールアドレス
// @param block 登録メールの要求後に実行されるblock
// */
//+ (void)requestAuthenticationMailInBackground:(NSString *)email
    public static func requestAuthenticationMailAsync(_ email: String,
//                                        block:(NCMBErrorResultBlock)block{
        block: NCMBErrorResultBlock?) {
//    [NCMBUser requestMailFromNCMB:URL_AUTHENTICATION_MAIL mail:email block:block];
        NCMBUser.requestMailFromNCMB(URL_AUTHENTICATION_MAIL, mail: email, block: block)
//}
    }
//
//
//MARK: requestMailFromNCMB
//
///**
// target用ログイン処理
// @param path パス
// @param email メールアドレス
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ
// */
//+ (void)requestMailFromNCMB:(NSString *)path
    private static func requestMailFromNCMB(_ path: String,
                                            mail email: String,
//                       mail:(NSString *)email
//                     target:(id)target
        target: AnyObject,
//                   selector:(SEL)selector{
        selector: Selector) {
//    NSMethodSignature* signature = [target methodSignatureForSelector: selector ];
//    NSInvocation* invocation = [ NSInvocation invocationWithMethodSignature: signature ];
//    [ invocation setTarget:target];
//    [ invocation setSelector: selector ];
//
//    NCMBErrorResultBlock block = ^(NSError *error) {
        let block: NCMBErrorResultBlock = {error in
//        [ invocation setArgument:&error atIndex: 2 ];
//        [ invocation invoke ];
            _ = target.perform(selector, with: error)
//    };
        }
//
//    if ([path isEqualToString:URL_PASSWOR_RESET]){
        if path == URL_PASSWORD_RESET {
//        [NCMBUser requestPasswordResetForEmailInBackground:email block:block];
            NCMBUser.requestPasswordResetAsync(forEmail: email, block: block)
//    } else if ([path isEqualToString:URL_AUTHENTICATION_MAIL]){
        } else if path == URL_AUTHENTICATION_MAIL {
//        [NCMBUser requestAuthenticationMailInBackground:email block:block];
            NCMBUser.requestAuthenticationMailAsync(email, block: block)
//    }
        }
//}
    }
//
///**
// 同期メアド要求処理
// @param path パス
// @param email メールアドレス
// @param error エラー
// */
//+ (BOOL)requestMailFromNCMB:(NSString *)path mail:(NSString *)email
    private static func __requestMailFromNCMB(_ path: String, mail email: String) throws {
        fatalError("\(#function): Sync methods not supported")
//                      error:(NSError **)error{
//    NCMBUser *user = [NCMBUser user];
//    user.mailAddress = email;
//
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    NSMutableDictionary *operations = [user beforeConnection];
//    NSMutableDictionary *ncmbDic = [user convertToJSONDicFromOperation:operations];
//    NSMutableDictionary *jsonDic = [user convertToJSONFromNCMBObject:ncmbDic];
//
//    //通信開始
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:path
//                                                           method:@"POST"
//                                                           header:nil
//                                                             body:jsonDic];
//
//    // 通信
//    NSError __block *sessionError = nil;
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
//        if (requestError){
//            sessionError = requestError;
//        }
//        dispatch_semaphore_signal(semaphore);
//    }];
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//    bool isSuccess = YES;
//    if (sessionError) {
//        if(error){
//            *error = sessionError;
//        }
//        isSuccess = NO;
//    }    return isSuccess;
//}
    }
//
///**
// 非同期メアド要求処理
// @param path パス
// @param email メールアドレス
// @param block メアド要求後に実行されるblock
// */
//+ (void)requestMailFromNCMB:(NSString *)path
    private static func requestMailFromNCMB(_ path: String,
//                       mail:(NSString *)email
        mail email: String,
//                      block:(NCMBErrorResultBlock)block{
        block: NCMBErrorResultBlock?) {
//    NCMBUser *user = [NCMBUser user];
        let user = NCMBUser()
//    user.mailAddress = email;
        user.mailAddress = email
//
//    NSMutableDictionary *operations = [user beforeConnection];
        let operations = user.beforeConnection()
//    NSMutableDictionary *ncmbDic = [user convertToJSONDicFromOperation:operations];
        let ncmbDic = user.convertToJSONDicFromOperation(operations)
//    NSMutableDictionary *jsonDic = [user convertToJSONFromNCMBObject:ncmbDic];
        let jsonDic = user.convertToJSONFromNCMBObject(ncmbDic) as! [String: Any]
//
//    // リクエスト作成
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:path
        let request = NCMBRequest(urlString: path,
                                  method: "POST",
                                  header: nil,
                                  body: jsonDic)
//                                                           method:@"POST"
//                                                           header:nil
//                                                             body:jsonDic];
//
//    // 通信
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestAsync:request];
        let session = NCMBURLSession(requestAsync: request)
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
        session.dataAsyncConnection {result in
            switch result {
            case .success(_):
                block?(nil)
//        if(block){
            case .failure(let requestError):
//            block(requestError);
                block?(requestError)
//        }
            }
//    }];
        }
//}
    }
//
//MARK: - logIn
//
//
///**
// 同期でログイン(ユーザ名とパスワード)を行う
// @param username ユーザー名
// @param password パスワード
// @param error エラー
// */
//+ (NCMBUser *)logInWithUsername:(NSString *)username
    public static func __logIn(username: String,
//                       password:(NSString *)password
        password: String) throws -> NCMBUser {
//                          error:(NSError **)error{
        fatalError("\(#function): Sync methods not supported")
//    return [NCMBUser ncmbLogIn:username mailAddress:nil password:password error:error];
//}
    }
//
///**
// 非同期でログイン(ユーザ名とパスワード)を行う
// @param username ユーザー名
// @param password パスワード
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ
// */
//+ (void)logInWithUsernameInBackground:(NSString *)username
    public static func logInAsync(username: String,
//                             password:(NSString *)password
        password: String,
//                               target:(id)target
        target: AnyObject,
//                             selector:(SEL)selector{
        selector: Selector) {
//    [NCMBUser ncmbLogInInBackground:username mailAddress:nil password:password target:target selector:selector];
        NCMBUser.ncmbLogInAsync(username, mailAddress: nil, password: password, target: target, selector: selector)
//}
    }

    /**
     非同期でログイン(ユーザ名とパスワード)を行う
     @param username ユーザー名
     @param password パスワード
     @param block ログイン後に実行されるblock
     */
    public static func logInAsync(username: String,
                                  password: String,
                                  block: NCMBUserResultBlock?) {
        NCMBUser.ncmbLogInAsync(username, mailAddress: nil, password: password, block: block)
    }

//MARK: - logInWithMailAddress

///**
// 同期でログイン(メールアドレスとパスワード)を行う
// @param email メールアドレス
// @param password パスワード
// @param error エラー
// */
//+ (NCMBUser *)logInWithMailAddress:(NSString *)email
    public static func __logIn(mailAddress email: String,
//                          password:(NSString *)password
        password: String) throws -> NCMBUser {
//                             error:(NSError **)error{
        fatalError("\(#function): Sync methods not supported")
//    return [NCMBUser ncmbLogIn:nil mailAddress:email password:password error:error];
//}
    }
//
///**
// 非同期でログイン(メールアドレスとパスワード)を行う
// @param email メールアドレス
// @param password パスワード
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ
// */
//+ (void)logInWithMailAddressInBackground:(NSString *)email
    public static func logInAsync(mailAddress email: String,
//                                password:(NSString *)password
        password: String,
//                                  target:(id)target
        target: AnyObject,
//                                selector:(SEL)selector{
        selector: Selector) {
//    [NCMBUser ncmbLogInInBackground:nil mailAddress:email password:password target:target selector:selector];
        NCMBUser.ncmbLogInAsync(nil, mailAddress: email, password: password, target: target, selector: selector)
//}
    }
//
//
///**
// 非同期でログイン(メールアドレスとパスワード)を行う
// @param email メールアドレス
// @param password パスワード
// @param block ログイン後に実行されるblock
// */
//+ (void)logInWithMailAddressInBackground:(NSString *)email
    public static func logInAsync(mailAddress email: String,
//                                password:(NSString *)password
        password: String,
//                                   block:(NCMBUserResultBlock)block{
        block: @escaping NCMBUserResultBlock) {
//    [NCMBUser ncmbLogInInBackground:nil mailAddress:email password:password block:block];
        NCMBUser.ncmbLogInAsync(nil, mailAddress: email, password: password, block: block)
//}
    }
//
//MARK: ncmbLogIn
//
//
///**
// targetログイン処理
// @param username ユーザー名
// @param email メールアドレス
// @param password パスワード
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ
// */
//+ (void)ncmbLogInInBackground:(NSString *)username
    private static func ncmbLogInAsync(_ username: String?,
//                  mailAddress:(NSString *)email
        mailAddress email: String?,
//                     password:(NSString *)password
        password: String,
//                       target:(id)target
        target: AnyObject,
//                     selector:(SEL)selector{
        selector: Selector) {
//
//    NSMethodSignature* signature = [target methodSignatureForSelector: selector ];
//    NSInvocation* invocation = [ NSInvocation invocationWithMethodSignature: signature ];
//    [ invocation setTarget:target];
//    [ invocation setSelector: selector ];
//
//    [NCMBUser ncmbLogInInBackground:username mailAddress:email password:password block:^(NCMBUser *user, NSError *error) {
        NCMBUser.ncmbLogInAsync(username, mailAddress: email, password: password) {
            result in
//        [ invocation setArgument:&user atIndex: 2 ];
//        [ invocation setArgument:&error atIndex: 3 ];
//        [ invocation invoke ];
            switch result {
            case .success(let user):
                _ = target.perform(selector, with: user, with: nil)
            case .failure(let error):
                _ = target.perform(selector, with: nil, with: error)
            }
//    }];
        }
//}
    }
//
///**
// ログイン用のNCMBRequestを返す
// */
//+(NCMBRequest*)createConnectionForLogin:(NSString*)username
    private static func createConnectionForLogin(_ username: String?,
//                            mailAddress:(NSString*)mailAddress
        mailAddress: String?,
//                               password:(NSString*)password{
        password: String) -> NCMBRequest {
//    //ログインパラメーター文字列の作成
//    NSMutableArray *queryArray = [NSMutableArray array];
        var queryArray: [String] = []
//    NSArray *sortedQueryArray = nil;
//    if (![username isKindOfClass:[NSNull class]] &&
//        ![mailAddress isKindOfClass:[NSNull class]] &&
//        ![password isKindOfClass:[NSNull class]]){
//
//        [queryArray addObject:[NSString stringWithFormat:@"password=%@", password]];
        queryArray.append("password=\(password)")   //###escaping?
        
//        if ([username length] != 0 && [mailAddress length] == 0){
        if !(username?.isEmpty ?? true) && (mailAddress?.isEmpty ?? true) {
//            [queryArray addObject:[NSString stringWithFormat:@"userName=%@", username]];
            queryArray.append("userName=\(username!)")   //###escaping?
//        } else if ([username length] == 0 && [mailAddress length] != 0){
        } else if (username?.isEmpty ?? true) && !(mailAddress?.isEmpty ?? true) {
//            [queryArray addObject:[NSString stringWithFormat:@"mailAddress=%@", mailAddress]];
            queryArray.append("mailAddress=\(mailAddress!)")
//        }
        }
//        sortedQueryArray = [NSArray arrayWithArray:[queryArray sortedArrayUsingSelector:@selector(compare:)]];
        let sortedQueryArray = queryArray.sorted()
//    }
//
//    //pathの作成
//    NSString *path = @"";
//    for (int i = 0; i< [sortedQueryArray count]; i++){
//        NSString * query = [sortedQueryArray[i] stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"#[]@!&()*+,;\"<>\\%^`{|} \b\t\n\a\r"] invertedSet]];
        func escape(query: String) -> String {
            query.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "#[]@!&()*+,;\"<>\\%^`{|} \u{08}\t\n\u{07}\r").inverted)!
        }
//        if (i == 0){
//            path = [path stringByAppendingString:[NSString stringWithFormat:@"%@", query]];
//        } else {
//            path = [path stringByAppendingString:[NSString stringWithFormat:@"&%@", query]];
//        }
//    }
        let path = sortedQueryArray.map(escape(query:)).joined(separator: "&")
//    NSString *url = [NSString stringWithFormat:@"login?%@", path];
        let url = "login?\(path)"
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLStringForUser:url
        let request = NCMBRequest(urlStringForUser: url,
                                  method: "GET",
                                  header: nil,
                                  body: nil)
//                                                           method:@"GET"
//                                                           header:nil
//                                                             body:nil];
//    return request;
        return request
//}
    }
//
///**
// 同期ログイン処理
// @param username ユーザー名
// @param email メールアドレス
// @param password パスワード
// @param error エラー
// */
//+ (NCMBUser *)ncmbLogIn:(NSString *)username
//            mailAddress:(NSString *)email
//               password:(NSString *)password
//                  error:(NSError **)error{
    private static func __ncmbLogIn(username: String?,
                                    mailAddress email: String?,
                                    password: String) throws -> NCMBUser {
        fatalError("\(#function): Sync methods not supported")
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    //通信開始
//    NCMBRequest *request = [self createConnectionForLogin:username
//                                              mailAddress:email
//                                                 password:password];
//    // 通信
//    NCMBUser __block *loginUser = nil;
//    NSError __block *sessionError = nil;
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
//        if (!requestError){
//            loginUser = [self responseLogIn:responseData];
//            [self saveToFileCurrentUser:loginUser];
//        } else {
//            sessionError = requestError;
//        }
//        dispatch_semaphore_signal(semaphore);
//    }];
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//    if(error){
//        *error = sessionError;
//    }
//    return loginUser;
//}
    }

    /**
     非同期ログイン処理
     @param username ユーザー名
     @param email メールアドレス
     @param password パスワード
     @param block ログイン後に実行されるblock
     */
    private static func ncmbLogInAsync(_ username: String?,
                                       mailAddress email: String?,
                                       password: String,
                                       block: NCMBUserResultBlock?) {
        //リクエストを作成
        let request = self.createConnectionForLogin(username,
                                                    mailAddress: email,
                                                    password: password)
        
        // 通信
        let session = NCMBURLSession(requestAsync: request)
        session.dataAsyncConnection {result in
            switch result {
            case .success(let responseData):
                let loginUser = self.responseLogIn(responseData)
                self.saveToFileCurrentUser(loginUser)
                block?(.success(loginUser))
            case .failure(let requestError):
                block?(.failure(requestError))
            }
        }
    }

    /**
     ログイン系のレスポンス処理
     @param responseData サーバーからのレスポンスデータ
     @return NCMBUser型サーバーのデータを反映させたユーザー
     */
    private static func responseLogIn(_ responseData: Any) -> NCMBUser {
        let loginUser = NCMBUser()
        guard let responseDic = responseData as? [String: Any] else {
            fatalError("ResponseData is not a Dictionary")
        }
        loginUser.afterFetch(responseDic, isRefresh: true)
        return loginUser
    }



//MARK: - logout
//
///**
// 同期でログアウトを行う
// */
    ///Do NOT use this method.
//+ (void)logOut{
    public static func __logOut() {
        fatalError("\(#function): Sync methods not supported")
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    NSError *sessionError = nil;
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:URL_LOGOUT
//                                                           method:@"GET"
//                                                           header:nil
//                                                             body:nil];
//
//    NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
//    [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
//        dispatch_semaphore_signal(semaphore);
//    }];
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//    if (sessionError==nil) {
//        [self logOutEvent];
//    }
//}
    }

    /**
     非同期でログアウトを行う
     @param block ログアウトのリクエストをした後に実行されるblock
     */
    public static func logOutAsync(block: NCMBErrorResultBlock?) {
        //リクエストを作成
        let request = NCMBRequest(urlString: NCMBUser.URL_LOGOUT,
                                  method: "GET",
                                  header: nil,
                                  body: nil)
        // 通信
        let session = NCMBURLSession(requestAsync: request)
        session.dataAsyncConnection {result in
            switch result {
            case .success(_):
                self.logOutEvent()
                block?(nil)
            case .failure(let requestError):
                block?(requestError)
            }
        }
    }

    /**
     ログアウトの処理
     */
    internal static func logOutEvent() {
        if _currentUser != nil {
            _currentUser?.sessionToken = nil
            _currentUser = nil
        }
        if FileManager.default.fileExists(atPath: DATA_CURRENTUSER_PATH) {
            _ = try? FileManager.default.removeItem(atPath: DATA_CURRENTUSER_PATH)
        }
    }

//MARK: requestPasswordResetForEmail
//
///**
// 同期でパスワードリセット要求を行う。
// @param error エラー
// */
//+ (void)requestPasswordResetForEmail:(NSString *)email
    public static func __requestPasswordReset(forEmail email: String) throws {
        fatalError("\(#function): Sync methods not supported")
//                               error:(NSError **)error{
//    [NCMBUser requestMailFromNCMB:URL_PASSWOR_RESET mail:email error:error];
//}
    }
//
///**
// 非同期でパスワードリセット要求を行う。
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ
// */
//+ (void)requestPasswordResetForEmailInBackground:(NSString *)email
    public static func requestPasswordResetAsync(forEmail email: String,
//                                          target:(id)target
        target: AnyObject,
//                                        selector:(SEL)selector{
        selector: Selector) {
//    [NCMBUser requestMailFromNCMB:URL_PASSWOR_RESET mail:email target:target selector:selector];
        NCMBUser.requestMailFromNCMB(URL_PASSWORD_RESET, mail: email, target: target, selector: selector)
//}
    }
//
//
///**
// 非同期でパスワードリセット要求を行う。
// @param block リセット要求後に実行されるblock
// */
//+ (void)requestPasswordResetForEmailInBackground:(NSString *)email
    public static func requestPasswordResetAsync(forEmail email: String,
//                                           block:(NCMBErrorResultBlock)block{
        block: NCMBErrorResultBlock?) {
//    [NCMBUser requestMailFromNCMB:URL_PASSWOR_RESET mail:email block:block];
        NCMBUser.requestMailFromNCMB(URL_PASSWORD_RESET, mail: email, block: block)
//}
    }
//
//MARK: - file
//
//+(NCMBUser*)getFromFileCurrentUser{
    private static func getFromFileCurrentUser() -> NCMBUser? {
//    NCMBUser *user = [NCMBUser user];
        let user = NCMBUser()
//    [user setACL:[[NCMBACL alloc]init]];
        user.acl = NCMBACL()
//    NSError *error = nil;
        do {
//    NSString *str = [[NSString alloc] initWithContentsOfFile:DATA_CURRENTUSER_PATH encoding:NSUTF8StringEncoding error:&error];
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
            let url = URL(fileURLWithPath: DATA_CURRENTUSER_PATH)
            let data = try Data(contentsOf: url)
//    NSMutableDictionary *dicData = [NSMutableDictionary dictionary];
//
//    if ([data isKindOfClass:[NSData class]] && [data length] != 0){
//
//        dicData = [NSJSONSerialization JSONObjectWithData:data
            guard let dicData = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                print("response is not a Dictionary")
                return nil
            }
//                                                  options:NSJSONReadingAllowFragments
//                                                    error:&error];
//        if ([[dicData allKeys] containsObject:@"data"] &&
            if
                let userData = dicData["data"] as? [String: Any],
//            [[dicData allKeys] containsObject:@"className"] &&
                let _ = dicData["className"] as? String,
//            [dicData count] == 2){
                dicData.count == 2
            {
//            //v1の形式でファイルを保存していた場合
//            [user afterFetch:[NSMutableDictionary dictionaryWithDictionary:dicData[@"data"]] isRefresh:YES];
                user.afterFetch(userData, isRefresh: true)
//        } else {
            } else {
//            [user afterFetch:[NSMutableDictionary dictionaryWithDictionary:dicData] isRefresh:YES];
                user.afterFetch(dicData, isRefresh: true)
//        }
            }
//    }
        } catch {
            print(error)
            return nil
        }
//    return user;
        return user
//}
    }
//
///**
// ログインユーザーをファイルに保存する
// @param user NCMBUSer型ファイルに保存するユーザー
// */
//+ (void) saveToFileCurrentUser:(NCMBUser *)user {
    internal static func saveToFileCurrentUser(_ user: NCMBUser) {
//    NSError *e = nil;
        do {
//    NSMutableDictionary *dic = [user toJSONObjectForDataFile];
            let dic = user.toJSONObjectForDataFile()
//    NSData *json = [NSJSONSerialization dataWithJSONObject:dic options:kNilOptions error:&e];
            let json = try JSONSerialization.data(withJSONObject: dic)
//    NSString *strSaveData = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
//    [strSaveData writeToFile:DATA_CURRENTUSER_PATH atomically:YES encoding:NSUTF8StringEncoding error:&e];
            let url = URL(fileURLWithPath: DATA_CURRENTUSER_PATH)
            try json.write(to: url, options: .atomic)
//    currentUser = user;
            _currentUser = user
        } catch let e {
            print(e)
        }
//}
    }
//
///**
// ファイルに書き込むためユーザー情報作成
// @return NSMutableDictionary型ユーザー情報
// */
//- (NSMutableDictionary *)toJSONObjectForDataFile{
    private func toJSONObjectForDataFile() -> [String: Any] {
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        var dic: [String: Any] = [:]
//    for (id key in [estimatedData keyEnumerator]) {
        for (key, value) in estimatedData {
//        [dic setObject:[self convertToJSONFromNCMBObject:[estimatedData valueForKey:key]] forKey:key];
            dic[key] = self.convertToJSONFromNCMBObject(value)
//    }
        }
//    if (self.objectId) {
        if let objectId = self.objectId {
//        [dic setObject:self.objectId forKey:@"objectId"];
            dic["objectId"] = objectId
//    }
        }
//    if (self.createDate){
        if let createDate = self.createDate {
//        NSDateFormatter *df = [self createNCMBDateFormatter];
            let df = self.createNCMBDateFormatter()
//        [dic setObject:[df stringFromDate:self.createDate] forKey:@"createDate"];
            dic["createDate"] = df.string(from: createDate)
//    }
        }
//    if (self.updateDate){
        if let updateDate = self.updateDate {
//        NSDateFormatter *df = [self createNCMBDateFormatter];
            let df = self.createNCMBDateFormatter()
//        [dic setObject:[df stringFromDate:self.updateDate] forKey:@"updateDate"];
            dic["updateDate"] = df.string(from: updateDate)
//    }
        }
//    if(self.sessionToken){
        if let token = self.sessionToken {
//        [dic setObject:self.sessionToken forKey:@"sessionToken"];
            dic["sessionToken"] = token
//    }
        }
//    if (self.ACL) {
        if let acl = self.acl {
//        [dic setObject:self.ACL.dicACL forKey:@"acl"];
            dic["acl"] = acl.dicACL
//    }
        }
//    return dic;
        return dic
//}
    }
//
//
//MARK: - override
//
///**
// ローカルオブジェクトをリセットし、ログアウトする
// */
//- (void)afterDelete{
    override func afterDelete() {
//    if ([NCMBUser currentUser]!= nil && [NCMBUser.currentUser.objectId isEqualToString:self.objectId]) {
        if let user = NCMBUser.currentUser, user.objectId == self.objectId {
//        [NCMBUser logOutEvent];
            NCMBUser.logOutEvent()
//    }
        }
//    self.userName = nil;
        self.userName = nil
//    self.password = nil;
        self.password = nil
//    self.sessionToken = nil;
        self.sessionToken = nil
//    self.mailAddress = nil;
        self.mailAddress = nil
//    [super afterDelete];
        super.afterDelete()
//}
    }
//
//- (void)afterFetch:(NSMutableDictionary *)response isRefresh:(BOOL)isRefresh{
    public override func afterFetch(_ response: [String : Any], isRefresh: Bool) {
//    if ([response objectForKey:@"userName"]){
        if let userName = response["userName"] as? String {
//        self.userName = [response objectForKey:@"userName"];
            self.userName = userName
//    }
        }
//    if ([response objectForKey:@"mailAddress"]){
        if let mailAddress = response["mailAddress"] as? String {
//        self.mailAddress = [response objectForKey:@"mailAddress"];
            self.mailAddress = mailAddress
//    }
        }
//    if ([response objectForKey:@"sessionToken"]) {
        if let sessionToken = response["sessionToken"] as? String {
//        self.sessionToken = [response objectForKey:@"sessionToken"];
            self.sessionToken = sessionToken
//    }
        }
//    [super afterFetch:response isRefresh:YES];
        super.afterFetch(response, isRefresh: true)
//}
    }
//
///**
// オブジェクト更新後に操作履歴とestimatedDataを同期する
// @param response REST APIのレスポンスデータ
// @param operations 同期する操作履歴
// */
//-(void)afterSave:(NSDictionary*)response operations:(NSMutableDictionary *)operations{
    override func afterSave(_ response: [String : Any], operations: NCMBOperationSet?) {
//    [super afterSave:response operations:operations];
        super.afterSave(response, operations: operations)
//
//    //会員新規登録の有無
//    //if ([response objectForKey:@"createDate"]&&![response objectForKey:@"updateDate"]){
//    if ([response objectForKey:@"createDate"] && [response objectForKey:@"updateDate"]){
        if let createDate = response["createDate"] as? String,
            let updateDate = response["updateDate"] as? String {
//        if ([response objectForKey:@"createDate"] == [response objectForKey:@"updateDate"]){
            if createDate == updateDate {
//            _isNew = YES;
                isNew = true
//        }
            }
//    }else{
        } else {
//        _isNew = NO;
            isNew = false
//    }
        }
//
//    //SNS連携(匿名ユーザー等はリクエスト時にuserNameを設定しない)時に必要
//    if ([response objectForKey:@"userName"]){
        if let userName = response["userName"] as? String {
//        [estimatedData setObject:[response objectForKey:@"userName"] forKey:@"userName"];
            estimatedData["userName"] = userName
//    }
        }
//    //SNS連携時に必要
//    //if (![[response objectForKey:@"authData"] isKindOfClass:[NSNull class]]){
//    if ([response objectForKey:@"authData"]){
        if let authData = response["authData"] {
//        if([[response objectForKey:@"authData"] isKindOfClass:[NSNull class]]){
//        } else {
            if let authDataDic = authData as? [String: Any] {
//            NSDictionary *authDataDic = [response objectForKey:@"authData"];
//            NSMutableDictionary *converted = [NSMutableDictionary dictionary];
                var converted: [String: Any] = [:]
//            for (NSString *key in [[authDataDic allKeys] objectEnumerator]){
                for (key, value) in authDataDic {
//                [converted setObject:[self convertToNCMBObjectFromJSON:[authDataDic objectForKey:key]
                    converted[key] = self.convertToNCMBObjectFromJSON(value, convertKey: key)
//                                                            convertKey:key]
//                              forKey:key];
//            }
                }
//            [estimatedData setObject:converted forKey:@"authData"];
                estimatedData["authData"] = converted
//        }
            }
//        if ([response objectForKey:@"sessionToken"]){
            if let token = response["sessionToken"] as? String {
//            [self setSessionToken:[response objectForKey:@"sessionToken"]];
                self.sessionToken = token
//        }
            }
//
//        [NCMBUser saveToFileCurrentUser:self];
            NCMBUser.saveToFileCurrentUser(self)
//    }
        }
//
//    if ([self.objectId isEqualToString:[NCMBUser currentUser].objectId]) {
        if self.objectId == NCMBUser.currentUser?.objectId {
//        self.sessionToken = [NCMBUser currentUser].sessionToken;
            self.sessionToken = NCMBUser.currentUser?.sessionToken
//        [NCMBUser saveToFileCurrentUser:self];
            NCMBUser.saveToFileCurrentUser(self)
//    }
        }
//}
    }
//
//MARK: - link
//
///**
// ログイン中のユーザー情報に、snsの認証情報を紐付ける
// @param snsInfo snsの認証情報
// @param type 認証情報のtype
// @param block 既存のauthDataのtype情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithToken:(NSDictionary *)snsInfo withType:(NSString *)type withBlock:(NCMBErrorResultBlock)block{
    private func link(token snsInfo: [String: Any], type: String, block: @escaping NCMBErrorResultBlock) {
//    // ローカルデータを取得
//    NSMutableDictionary *localAuthData = [NSMutableDictionary dictionary];
//        localAuthData = [NSMutableDictionary dictionaryWithDictionary:[self objectForKey:@"authData"]];
//    }
        var localAuthData = self.object(forKey: "authData") as? [String: Any] ?? [:]
//    //既存のauthDataのtype情報のみ更新する
//    NSMutableDictionary *userAuthData = [NSMutableDictionary dictionary];
        var userAuthData: [String: Any] = [:]
//    [userAuthData setObject:snsInfo forKey:type];
        userAuthData[type] = snsInfo
//    [self setObject:userAuthData forKey:@"authData"];
        self.setObject(userAuthData, forKey: "authData")
//    [self saveInBackgroundWithBlock:^(NSError *error) {
        self.saveAsync {error in
//        if (!error){
            if error == nil {
//            // ローカルデータから既にあるauthDataを取得して認証情報をマージ
//            [localAuthData setObject:snsInfo forKey:type];
                localAuthData[type] = snsInfo
//        }
            }
//        [estimatedData setObject:localAuthData forKey:@"authData"];
            self.estimatedData["authData"] = localAuthData
//        // ログインユーザーをファイルに保存する
//        [NCMBUser saveToFileCurrentUser:self];
            NCMBUser.saveToFileCurrentUser(self)
//        [self executeUserCallback:block error:error];
            block(error)
//    }];
        }
//}
    }
//
///**
// ログイン中のユーザー情報に、googleの認証情報を紐付ける
// @param googleInfo googleの認証情報（idとaccess_token）
// @param block 既存のauthDataのgoogle情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithGoogleToken:(NSDictionary *)googleInfo withBlock:(NCMBErrorResultBlock)block{
    public func link(googleToken googleInfo: [String: Any], block: @escaping NCMBErrorResultBlock) {
//    [self linkWithToken:googleInfo withType:AUTH_TYPE_GOOGLE withBlock:block];
        self.link(token: googleInfo, type: AUTH_TYPE_GOOGLE, block: block)
//}
    }
//
///**
// ログイン中のユーザー情報に、twitterの認証情報を紐付ける
// @param twitterInfo twitterの認証情報
// @param block 既存のauthDataのtwitter情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithTwitterToken:(NSDictionary *)twitterInfo withBlock:(NCMBErrorResultBlock)block{
    public func link(twitterToken twitterInfo: [String: Any], block: @escaping NCMBErrorResultBlock) {
//    [self linkWithToken:twitterInfo withType:AUTH_TYPE_TWITTER withBlock:block];
        self.link(token: twitterInfo, type: AUTH_TYPE_TWITTER, block: block)
//}
    }
//
///**
// ログイン中のユーザー情報に、facebookの認証情報を紐付ける
// @param facebookInfo facebookの認証情報
// @param block 既存のauthDataのfacebook情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithFacebookToken:(NSDictionary *)facebookInfo withBlock:(NCMBErrorResultBlock)block{
    public func link(facebookToken facebookInfo: [String: Any], block: @escaping NCMBErrorResultBlock) {
//    [self linkWithToken:facebookInfo withType:AUTH_TYPE_FACEBOOK withBlock:block];
        self.link(token: facebookInfo, type: AUTH_TYPE_FACEBOOK, block: block)
//}
    }
//
///**
// ログイン中のユーザー情報に、appleの認証情報を紐付ける
// @param appleInfo appleの認証情報
// @param block 既存のauthDataのapple情報のみ更新後実行されるblock。エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)linkWithAppleToken:(NSDictionary *)appleInfo withBlock:(NCMBErrorResultBlock)block{
    public func link(appleToken appleInfo: [String: Any], block: @escaping NCMBErrorResultBlock) {
//    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
        let bundleIdentifier = Bundle.main.bundleIdentifier ?? ""
//    NSDictionary *appleInfoParam = [appleInfo mutableCopy];
        var appleInfoParam = appleInfo
//    [appleInfoParam setValue:bundleIdentifier forKey:@"client_id"];
        appleInfoParam["client_id"] = bundleIdentifier
//    [self linkWithToken:appleInfoParam withType:AUTH_TYPE_APPLE withBlock:block];
        self.link(token: appleInfo, type: AUTH_TYPE_APPLE, block: block)
//}
    }
//
///**
// 会員情報に、引数で指定したtypeの認証情報が含まれているか確認する
// @param type 認証情報のtype（googleもしくはtwitter、facebook、apple、anonymous）
// @return 引数で指定したtypeの会員情報が含まれている場合はYESを返す
// */
//- (BOOL)isLinkedWith:(NSString *)type{
    public func isLinkedWith(_ type: String) -> Bool {
//
//    BOOL isLinkerFlag = NO;
        var isLinked = false
        switch type {
//    if ([type isEqualToString:AUTH_TYPE_GOOGLE]
        case AUTH_TYPE_GOOGLE,
             AUTH_TYPE_TWITTER,
             AUTH_TYPE_FACEBOOK,
             AUTH_TYPE_ANONYMOUS,
             AUTH_TYPE_APPLE:
//        || [type isEqualToString:AUTH_TYPE_TWITTER]
//        || [type isEqualToString:AUTH_TYPE_FACEBOOK]
//        || [type isEqualToString:AUTH_TYPE_ANONYMOUS]
//        || [type isEqualToString:AUTH_TYPE_APPLE])
//    {
//        if ([self objectForKey:@"authData"] && [[self objectForKey:@"authData"] isKindOfClass:[NSDictionary class]]) {
            if let authData = self.object(forKey: "authData") as? [String: Any] {
//            if ([[self objectForKey:@"authData"] objectForKey:type]) {
                if authData[type] != nil {
//                isLinkerFlag = YES;
                    isLinked = true
//            }
                }
//        }
            }
//    }
        default:
            break
        }
//    return isLinkerFlag;
        return isLinked
//}
    }
//
///**
// 会員情報から、引数で指定したtypeの認証情報を削除する
// @param type 認証情報のtype（googleもしくはtwitter、facebook、apple、anonymous）
// @param block エラー情報を返却するblock エラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)unlink:(NSString *)type withBlock:(NCMBErrorResultBlock)block{
    public func unlink(_ type: String, block: NCMBErrorResultBlock?) {
//
//    // Userから指定したtypeの認証情報を削除する
//    if ([[self objectForKey:@"authData"] isKindOfClass:[NSDictionary class]]){
        if var authData = self.object(forKey: "authData") as? [String: Any] {
//        // 指定したtypeと同じ認証情報の場合は削除する
//        if ([self isLinkedWith:type]) {
            if self.isLinkedWith(type) {
//            // ローカルデータを取得
//            NSMutableDictionary *localAuthData = [NSMutableDictionary dictionary];
//            if([[self objectForKey:@"authData"] isKindOfClass:[NSDictionary class]]){
//                localAuthData = [NSMutableDictionary dictionaryWithDictionary:[self objectForKey:@"authData"]];
//            }
                var localAuthData = authData
//            // 削除する認証情報を取得
//            NSMutableDictionary *authData = [NSMutableDictionary dictionaryWithDictionary:[self objectForKey:@"authData"]];
//            // 引数で指定した認証情報を削除
//            [authData setObject:[NSNull null] forKey:type];
                authData[type] = NSNull()
//
//            [self setObject:authData forKey:@"authData"];
                self.setObject(authData, forKey: "authData")
//            [self saveInBackgroundWithBlock:^(NSError *error) {
                self.saveAsync {error in
//                if (!error){
                    if error == nil {
//                    // ローカルデータから既にあるauthDataを取得して引数で指定した認証情報を削除してマージ
//                    [localAuthData removeObjectForKey:type];
                        localAuthData.removeValue(forKey: type)
//                }
                    }
//                [estimatedData setObject:localAuthData forKey:@"authData"];
                    self.estimatedData["authData"] = localAuthData
//                // ログインユーザーをファイルに保存する
//                [NCMBUser saveToFileCurrentUser:self];
                    NCMBUser.saveToFileCurrentUser(self)
//                [self executeUserCallback:block error:error];
                    block?(error)
//            }];
                }
//        } else {
            } else {
//            // 指定したtype以外の認証情報の場合はエラーを返す
//            NSError *error = [NSError errorWithDomain:ERRORDOMAIN
                let error = NSError(domain: ERRORDOMAIN,
//                                                 code:404003
                    code: 404003,
//                                             userInfo:@{NSLocalizedDescriptionKey:@"other token type"}];
                    userInfo: [NSLocalizedDescriptionKey: "other token type"])
//            [self executeUserCallback:block error:error];
                block?(error)
//        }
            }
//    } else {
        } else {
//        // 認証情報がない場合エラーを返す
//        NSError *error = [NSError errorWithDomain:ERRORDOMAIN
            let error = NSError(domain: ERRORDOMAIN,
                                code: 404003,
                                userInfo: [NSLocalizedDescriptionKey: "token not found"])
//                                             code:404003
//                                         userInfo:@{NSLocalizedDescriptionKey:@"token not found"}];
//        [self executeUserCallback:block error:error];
            block?(error)
//    }
        }
//}
    }
//
//MARK: - mailAddressConfirm
//
///**
// メールアドレスが確認済みのものかを把握する
// @return メールアドレスが確認済みの場合はYESを返す
// */
//- (BOOL)isMailAddressConfirm{
    public var isMailAddressConfirmed: Bool {
//
//    return [self objectForKey:@"mailAddressConfirm"]!= [NSNull null] && [[self objectForKey:@"mailAddressConfirm"]boolValue] ? YES : NO;
        if let mailAddressConfirm = self.object(forKey: "mailAddressConfirm") as? Bool {
            return mailAddressConfirm
        } else {
            return false
        }
//}
    }
//
//@end
}
