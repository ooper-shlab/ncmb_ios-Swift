//
//  NCMB.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/01.
//

/*
 Copyright 2017-2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit
#if canImport(UserNotifications)
import UserNotifications
#endif

/**
 NCMBクラスは、キーの設定やレスポンスバリデーションの設定を行うクラスです。
 */
public class NCMB: NSObject {

///**
// アプリケーションキーとクライアントキーの設定
// @param applicationKey アプリケーションを一意に識別するキー
// @param clientKey APIを利用する際に必要となるキー
// */
//+ (void)setApplicationKey:(NSString *)applicationKey clientKey:(NSString *)clientKey;
//
///**
// アプリケーションキーの取得
// */
//+ (NSString *)getApplicationKey;
//
///**
// クライアントキーの取得
// */
//+ (NSString *)getClientKey;
//
///**
// レスポンスが改ざんされていないか判定する機能を有効にする<br/>
// デフォルトは無効です
// @param checkFlag true:有効, false:無効
// */
//+ (void)enableResponseValidation:(BOOL)checkFlag;
//
///**
// レスポンバリデーションの設定状況を取得
// */
//+ (BOOL)getResponseValidationFlag;
//
///**
// プッシュ通知アラートを表示させる
// */
//+ (void)showConfirmPushNotification;
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
//#import "NCMB.h"
//#if __has_include(<UserNotifications/UserNotifications.h>)
//#import <UserNotifications/UserNotifications.h>
//#endif
//#if __has_include(<UIKit/UIKit.h>)
//#import <UIKit/UIKit.h>
//#endif
//
//@implementation NCMB

    private static var applicationKey: String? = nil
    private static var clientKey: String? = nil
    private static var responseValidationFlag: Bool = false

//MARK: - init

    ///ncmb_swift互換メソッド
    public static func initialize(applicationKey: String, clientKey: String) {
        self.setApplicationKey(applicationKey, clientKey: clientKey)
    }
    /**
     アプリケーションキーとクライアントキーの設定
     @param applicationKey アプリケーションを一意に識別するキー
     @param clientKey APIを利用する際に必要となるキー
     */
    public static func setApplicationKey(_ appKey: String, clientKey cliKey: String) {
        NCMB.createFolder()
        applicationKey = appKey
        clientKey = cliKey
        let reachability = NCMBReachability.shared
        //[reachability reachabilityWithHostName:@"mbaas.api.nifcloud.com"];
        reachability.startNotifier()
        
    }

//MARK: - Key
//+ (NSString *)getApplicationKey{
    public static func getApplicationKey() -> String? {
//    return applicationKey;
        return applicationKey
//}
    }
//
//+ (NSString *)getClientKey{
    public static func getClientKey() -> String? {
//    return clientKey;
        return clientKey
//}
    }
//
//MARK: - ResponseValidation
//+ (BOOL)getResponseValidationFlag{
    public static func getResponseValidationFlag() -> Bool {
//    return responseValidationFlag;
        return responseValidationFlag
//}
    }
//
//+ (void)enableResponseValidation:(BOOL)checkFlag{
    public static func enableResponseValidation(_ checkFlag: Bool) {
//    responseValidationFlag = checkFlag;
        responseValidationFlag = checkFlag
//}
    }

//MARK: - File

/**
 SDKで利用するファイルの保存ディレクトリを作成する
 */
    private static func createFolder() {
    //ライブラリファイルのパスを取得
//    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        let urls = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
//    NSString* dirName = [paths objectAtIndex:0];
        let dirName = urls[0]
//
//    //SDKで利用するフォルダを作成
//    [NCMB saveDirPath:dirName str:@"Private Documents"];
        NCMB.saveDirURL(dirName, str: "Private Documents")
//    [NCMB saveDirPath:[NSString stringWithFormat:@"%@/Private Documents",dirName] str:@"NCMB"];
        NCMB.saveDirURL(dirName.appendingPathComponent("Private Documents"), str: "NCMB")
//
//    //SaveEventually用の処理内容保存場所
//    [NCMB saveDirPath:[NSString stringWithFormat:@"%@/Private Documents/NCMB",dirName] str:@"Command Cache"];
        let url = dirName.appendingPathComponent("Private Documents", isDirectory: true)
            .appendingPathComponent("NCMB")
        NCMB.saveDirURL(url, str: "Command Cache")
//
//}
    }

/**
 ファイルの有無をチェックし、無ければ指定されたパスにファイルを作成する
 */
//+(void)saveDirPath:(NSString*)dirName  str:(NSString*)str {
    private static func saveDirURL(_ dirName: URL, str: String) {
//    //fileの保存先作成
//    NSMutableString* saveFileDirPath = [NSMutableString string];
        let saveFileDirPath = dirName
//    [saveFileDirPath appendString:dirName];
//    [saveFileDirPath appendString:[NSString stringWithFormat:@"/%@/",str]];
            .appendingPathComponent(str, isDirectory: true)
//
//    //fileが存在するかチェックする。fileが存在しない場合のみ新規作成
//    BOOL isYES = YES;
        var isDir: ObjCBool = false
//    NSFileManager* fileManager = [NSFileManager defaultManager];
        let fileManager = FileManager.default
//    BOOL isExist = [fileManager fileExistsAtPath:saveFileDirPath isDirectory:&isYES];
        let fileExists = fileManager.fileExists(atPath: saveFileDirPath.path, isDirectory: &isDir)
//    if( isExist == false ) {
        if !fileExists {
//        [fileManager createDirectoryAtPath:saveFileDirPath withIntermediateDirectories:YES attributes:nil error:nil];
            _ = try? fileManager.createDirectory(at: saveFileDirPath, withIntermediateDirectories: true, attributes: nil)
//    }
        }
//}
    }
//
//#if __has_include(<UIKit/UIKit.h>)
    #if canImport(UIKit)
///**
// プッシュ通知アラート
// */
//+(void)showConfirmPushNotification {
    public static func showConfirmPushNotification() {
//    // iOSのバージョンで処理を分ける
//    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10, 0, 0}]){
        if #available(iOS 10.0, *) {
//        #if __has_include(<UserNotifications/UserNotifications.h>)
            #if canImport(UserNotifications)
//        //iOS10以上での、DeviceToken要求方法
//        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
//        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
            let center = UNUserNotificationCenter.current()
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert |
            center.requestAuthorization(options: [.alert, .badge, .sound]) {
//                                                 UNAuthorizationOptionBadge |
//                                                 UNAuthorizationOptionSound)
//                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
                granted, error in
//                                  if (error) {
                if error != nil {
//                                      return;
                    return
//                                  }
                }
//                                  if (granted) {
                if granted {
//                                      //通知を許可にした場合DeviceTokenを要求
//                                      [[UIApplication sharedApplication] registerForRemoteNotifications];
                    UIApplication.shared.registerForRemoteNotifications()
//                                  }
                }
//                              }];
            }
//        #endif
            #endif
//    } else if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){8, 0, 0}]){
        } else if #available(iOS 8.0, *) {
//        //iOS10未満での、DeviceToken要求方法
//        //通知のタイプを設定したsettingを用意
//        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
//        UIUserNotificationType type = UIUserNotificationTypeAlert |
            let type: UIUserNotificationType = [.alert, .badge, .sound]
//        UIUserNotificationTypeBadge |
//        UIUserNotificationTypeSound;
//        UIUserNotificationSettings *setting;
//        setting = [UIUserNotificationSettings settingsForTypes:type
//                                                    categories:nil];
            let setting = UIUserNotificationSettings(types: type, categories: nil)
//
//        //通知のタイプを設定
//        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
            UIApplication.shared.registerUserNotificationSettings(setting)
//
//        //DeviceTokenを要求
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
            UIApplication.shared.registerForRemoteNotifications()
//    } else {
        } else {
//        //iOS8未満での、DeviceToken要求方法
//        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
            UIApplication.shared.registerForRemoteNotifications(matching: [
                .alert, .badge, .sound
            ])
//         (UIRemoteNotificationTypeAlert |
//          UIRemoteNotificationTypeBadge |
//          UIRemoteNotificationTypeSound)];
//    }
        }
//}
    }
//#endif
    #endif
//
//@end
}

extension NCMB {
    internal static let endpoint = ["user": "users",
                                    "role": "roles",
                                    "installation": "installations",
                                    "push": "push",
                                    "file": "files"]

    internal static func baseUrl(ncmbClassName: String) -> String {
        return endpoint[ncmbClassName] ?? "classes/\(ncmbClassName)"
    }
    
    public enum Error: Swift.Error {
        case badResponse
    }
}
