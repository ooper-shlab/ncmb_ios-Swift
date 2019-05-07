//
//  NCMBAnalytics.swift
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
import UIKit
//
///**
// NCMBAnalyticsクラスは、プッシュ通知の開封をニフクラ mobile backendに登録するクラスです。
// */
//@interface NCMBAnalytics : NSObject
public class NCMBAnalytics {
//
///**
// アプリが起動された際に、情報を送信。didFinishLaunchingWithOptions内で呼び出す。
// @param launchOptions プッシュ通知内容を含むアプリケーションの起動オプション
// */
//+ (void)trackAppOpenedWithLaunchOptions:(NSDictionary *)launchOptions;
//
///**
// プッシュ通知によりアプリが起動された際に、情報を送信。didReceiveRemoteNotification内で呼び出す
// @param userInfo プッシュ通知内容
// */
//+ (void)trackAppOpenedWithRemoteNotificationPayload:(NSDictionary *)userInfo;
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
//#import <UIKit/UIKit.h>
//#import "NCMBAnalytics.h"
//#import "NCMBPush.h"
//#import "NCMBInstallation.h"
//#import "NCMBURLSession.h"
//
//@implementation NCMBAnalytics
//
//+(void)trackAppOpenedWithLaunchOptions:(NSDictionary *)launchOptions{
    public static func trackAppOpened(launchOptions: [UIApplication.LaunchOptionsKey: Any]) {
//    NSDictionary *userInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
        let userInfo = launchOptions[.remoteNotification] as! [AnyHashable: Any]
//    [self trackAppOpenedWithRemoteNotificationPayload:userInfo];
        self.trackAppOpened(remoteNotificationPayload: userInfo)
//}
    }
//
//+ (void)trackAppOpenedWithRemoteNotificationPayload:(NSDictionary *)userInfo{
    public static func trackAppOpened(remoteNotificationPayload userInfo: [AnyHashable: Any]) {
//    NSString * pushId = [userInfo objectForKey:@"com.nifcloud.mbaas.PushId"];
        if
            let pushId = userInfo["com.nifcloud.mbaas.PushId"] as? String,
//    NCMBInstallation *installation = [NCMBInstallation currentInstallation];
            case let installation = NCMBInstallation.current(),
//    if (pushId != nil && installation.deviceToken != nil){
            let deviceToken = installation.deviceToken
        {
//        //コネクションを作成
//        NSDictionary *requestData = @{@"deviceType":installation.deviceType,
            let requestData: [String: String] = ["deviceType": installation.deviceType!,
//                                     @"deviceToken":installation.deviceToken
                "deviceToken":  deviceToken
//                                     };
            ]
//
//        NSString *url = [NSString stringWithFormat:@"push/%@/openNumber", pushId];
            let url = "push/\(pushId)/openNumber"
//        NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:url
            let request = NCMBRequest(urlString: url,
                                      method: "POST",
                                      header: nil,
                                      body: requestData)
//                                                               method:@"POST"
//                                                               header:nil
//                                                                 body:requestData];
//
//        NCMBURLSession *session = [[NCMBURLSession alloc] initWithProgress:request progress:nil];
            let session = NCMBURLSession(request, progress: nil)
//        [session dataAsyncConnectionWithBlock:nil];
            session.dataAsyncConnection(block: nil)
//        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
            UIApplication.shared.applicationIconBadgeNumber = 0
//    }
        }
//}
    }
//
//@end
}
