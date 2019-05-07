//
//  NCMBPush.swift
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
//#import "NCMBObject.h"
import UIKit
//#import "NCMBConstants.h"
//
//#import <AudioToolbox/AudioToolbox.h>
import AudioToolbox
//
//class NCMBQuery;
//
//
///**
// NCMBPushは、プッシュ通知の登録・更新・取得・削除を行うクラスです。
// */
//interface NCMBPush : NCMBObject
public class NCMBPush: NCMBObject {
//
///** name Create */
//
///**
// NCMBPushのインスタンスを生成
// return NCMBPushのインスタンス
// */
//+ (NCMBPush *)push;
//
///** name Configuration */
//
///**
// プッシュ通知のタイトルを設定(Androidのみ)
// param title プッシュ通知のタイトル
// */
//- (void)setTitle:(NSString*)title;
//
///**
// プッシュ通知を送信するチャネルを設定
// param channel プッシュ通知を送信するチャネル
// */
//- (void)setChannel:(NSString *)channel;
//
///**
// プッシュ通知を送信する複数のチャネルを設定
// param channels プッシュ通知を送信する複数のチャネルを格納した配列
// */
//- (void)setChannels:(NSArray *)channels;
//
///**
// (非推奨:新たに利用する場合はsetSearchConditionを使いましょう)
// プッシュ通知の配信先となる配信端末を絞り込むためのクエリを設定
// param query プッシュ先を絞り込むためのクエリ
// */
//- (void)setQuery:(NCMBQuery *)query;
//
///**
// プッシュ通知の配信先となる配信端末を絞り込むためのクエリを設定
// param query プッシュ先を絞り込むためのクエリ
// */
//- (void)setSearchCondition:(NCMBQuery *)query;
//
///**
// プッシュ通知のメッセージ内容を設定
// param message プッシュ通知のメッセージ内容
// */
//- (void)setMessage:(NSString *)message;
//
///**
// Android端末でダイアログプッシュ通知を行う設定
// param dialog ダイアログプッシュ通知を行う場合はtrueを設定。
// */
//- (void)setDialog:(BOOL)dialog;
//
///**
// リッチプッシュ通知用のURLを設定
// param url リッチプッシュ通知で表示するWebページのURL
// */
//- (void)setRichUrl:(NSString *)url;
//
///**
// Androidへの配信設定
// param pushToAndroid 配信設定。配信する場合はtrueを設定。
// */
//- (void)setPushToAndroid:(BOOL)pushToAndroid;
//
///**
// iOSへの配信設定
// param pushToIOS 配信設定。配信する場合はtrueを設定。
// */
//- (void)setPushToIOS:(BOOL)pushToIOS;
//
//
///**
// プッシュ通知の有効期限を設定
// param date プッシュ通知の有効期限
// */
//- (void)expireAtDate:(NSDate *)date;
//
///**
// プッシュ通知配信日時から設定したインターバル後を有効期限に設定
// param timeInterval 設定できる値は、時間単位で指定する場合は「n hour」(n=1～24）、日単位で指定する場合は「n day」（n=1～28）。
// */
//- (void)expireAfterTimeInterval:(NSString*)timeInterval;
//
///**
// プッシュ通知の有効期限の削除
// */
//- (void)clearExpiration;
//
//
///**
// ユーザの情報を設定。開発者が付与したい情報を設定することができる。ここで設定した値はプッシュ通知のペイロードから「com.nifcloud.mbaas.Data」というキーで取得できる
// param userSettingValue ユーザの情報
// */
//- (void)setUserSettingValue:(NSDictionary *)userSettingValue;
//
///**
// プッシュ通知の配信日時を設定
// param date プッシュ通知の配信日時
// */
//- (void)setDeliveryTime:(NSDate *)date;
//
///**
// 即時配信フラグを設定
// param immediateDeliveryFlag 即時配信フラグ。即時配信にする場合はYESを設定。デフォルトはYES。
// */
//- (void)setImmediateDeliveryFlag:(BOOL)immediateDeliveryFlag;
//
///**
// バッジ数を設定(iOSのみ)
// param badgeNumber バッジ数
// */
//- (void)setBadgeNumber:(int)badgeNumber;
//
///**
// バッジ数のインクリメント設定
// param badgeIncrementFlag バッジ数をインクリメントする場合はYESを設定する
// */
//- (void)setBadgeIncrementFlag:(BOOL)badgeIncrementFlag;
//
///**
// 通知音を設定(iOSのみ)
// param soundFileName 音声ファイル名
// */
//- (void)setSound:(NSString*)soundFileName;
//
///**
// content-availableを設定(iOSのみ)
// param contentAvailable content-availableの設定値（真偽値）
// */
//- (void)setContentAvailable:(BOOL)contentAvailable;
//
///**
// categoryを設定(iOSのみ)
// param category categoryの名前
// */
//- (void)setCategory:(NSString*)category;
//
//
///**
// actionを設定(Androidのみ)
// param actionName アクション名
// */
//- (void)setAction:(NSString*)actionName;
//
///**
// プッシュ通知の設定が格納されたNSDictionaryをセットする
// param dic プッシュ通知の設定
// */
//- (void)setData:(NSDictionary*)dic;
//
///** name Send */
//
///**
// 指定したチャネルにメッセージのみのプッシュ通知を送信。必要があればエラーをセットし、取得することもできる。
// param channel プッシュ先のチャネル
// param message メッセージ内容
// param error 処理中に起きたエラーのポインタ
// */
//+ (void)sendPushMessageToChannel:(NSString *)channel
//                     withMessage:(NSString *)message
//                           error:(NSError **)error;
//
//
///**
// 指定したチャネルに非同期でメッセージのみのプッシュ通知を送信。登録し終わったら与えられたblockを呼び出す。
// param channel プッシュ先のチャネル
// param message メッセージ内容
// param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushMessageToChannelInBackground:(NSString *)channel
//                                 withMessage:(NSString *)message
//                                       block:(NCMBErrorResultBlock)block;
//
///**
// 指定したチャネルに非同期でメッセージのみのプッシュ通知を送信。取得し終わったら指定されたcallbackを呼び出す。
// param channel プッシュ先のチャネル
// param message メッセージ内容
// param target 呼び出すセレクタのターゲット
// param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NSNumber )result error:(NSError )error
// resultには送信完了の有無をNSNumber型で渡される。errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushMessageToChannelInBackground:(NSString *)channel
//                                 withMessage:(NSString *)message
//                                      target:(id)target
//                                    selector:(SEL)selector;
//
///**
// 指定したクエリを満たした配信端末にメッセージのみのプッシュ通知を送信。必要があればエラーをセットし、取得することもできる。
// param query 指定するクエリ
// param message メッセージ内容
// param error 処理中に起きたエラーのポインタ
// */
//+ (void)sendPushMessageToQuery:(NCMBQuery *)query
//                   withMessage:(NSString *)message
//                         error:(NSError **)error;
//
//
///**
// 指定したクエリを満たした配信端末に非同期でメッセージのみのプッシュ通知を送信。登録し終わったら与えられたblockを呼び出す。
// param query 指定するクエリ
// param message メッセージ内容
// param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushMessageToQueryInBackground:(NCMBQuery *)query
//                               withMessage:(NSString *)message
//                                     block:(NCMBErrorResultBlock)block;
//
//
///**
// 指定したチャネルにプッシュ通知を送信。必要があればエラーをセットし、取得することもできる。
// param channel プッシュ先のチャネル
// param data プッシュ通知内容
// param error 処理中に起きたエラーのポインタ
// */
//+ (void)sendPushDataToChannel:(NSString *)channel
//                     withData:(NSDictionary *)data
//                        error:(NSError **)error;
//
//
///**
// 指定したチャネルに非同期でプッシュ通知を送信。登録し終わったら与えられたblockを呼び出す。
// param channel プッシュ先のチャネル
// param data プッシュ通知内容
// param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushDataToChannelInBackground:(NSString *)channel
//                                 withData:(NSDictionary *)data
//                                    block:(NCMBErrorResultBlock)block;
//
//
///**
// 指定したチャネルに非同期でプッシュ通知を送信。登録し終わったら指定されたcallbackを呼び出す。
// param channel プッシュ先のチャネル
// param data プッシュ通知内容
// param target 呼び出すセレクタのターゲット
// param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NSNumber )result error:(NSError )error
// resultには送信完了の有無をNSNumber型で渡される。errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushDataToChannelInBackground:(NSString *)channel
//                                 withData:(NSDictionary *)data
//                                   target:(id)target
//                                 selector:(SEL)selector;
//
///**
// 指定したクエリを満たした配信端末にプッシュ通知を送信。必要があればエラーをセットし、取得することもできる。
// param query 指定するクエリ
// param data プッシュ通知内容
// param error 処理中に起きたエラーのポインタ
// */
//+ (void)sendPushDataToQuery:(NCMBQuery *)query
//                   withData:(NSDictionary *)data
//                      error:(NSError **)error;
//
///**
// 指定したクエリを満たした配信端末に非同期でプッシュ通知を送信。登録し終わったら与えられたblockを呼び出す。
// param query 指定するクエリ
// param data プッシュ通知内容
// param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushDataToQueryInBackground:(NCMBQuery *)query
//                               withData:(NSDictionary *)data
//                                  block:(NCMBErrorResultBlock)block;
//
///**
// プッシュ通知を送信。必要があればエラーをセットし、取得することができる。
// param error 処理中に起きたエラーのポインタ
// */
//- (void)sendPush:(NSError **)error;
//
//
///**
// プッシュ通知を非同期で送信。登録し終わったら与えられたblockを呼び出す。
// param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//- (void)sendPushInBackgroundWithBlock:(NCMBErrorResultBlock)block;
//
///**
// プッシュ通知を非同期で送信。取得し終わったら指定されたcallbackを呼び出す。
// param target 呼び出すセレクタのターゲット
// param selector 呼び出すセレクタ。引数として(NSError*)errorオブジェクトを取得できる。
// */
//- (void)sendPushInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
//
///** name Handling */
//
///**
// アプリ起動中にプッシュ通知内容を取得した場合、通知内容を表示する。
// param userInfo プッシュ通知内容
// */
//+ (void)handlePush:(NSDictionary *)userInfo;
//
///**
// アプリ起動中にプッシュ通知内容を取得した場合、Webページを表示する。
// param userInfo プッシュ通知内容
// */
//+ (void)handleRichPush:(NSDictionary *)userInfo;
//
///** name Query */
//
///**
// クラス名を指定してクエリの生成
// */
//+ (NCMBQuery *)query;
//
//
//end
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
//#import "NCMBPush.h"
//#import "NCMBQuery.h"
//
//#import "NCMBObject+Private.h"
//#import "NCMBQuery+Private.h"
//#import "NCMBRichPushView.h"
//
//interface NCMBPush ()
//
//property (nonatomic)NCMBQuery *query;
    private var query: NCMBQuery?
//
//end
//
//implementation NCMBPush
//
//static NCMBRichPushView *rv;
    private static var rv: NCMBRichPushView?
//
//+(NCMBQuery*)query{
    internal override class func query() -> NCMBQuery {
//    NCMBQuery *query = [NCMBQuery queryWithClassName:"push"];
        let query = NCMBQuery(className: "push")
//    return query;
        return query
//}
    }
//
//+(instancetype)push{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    return push;
//}
//
//-(instancetype)init{
    internal required init() {
//    //self = [[NCMBPush alloc] initWithClassName:"push"];
//    self = [self initWithClassName:"push"];
        super.init(className: "push")
//    //self = [super init];
//    if (self){
//        _query = [NCMBQuery queryWithClassName:"installation"];
        query = NCMBQuery(className: "installation")
//    }
//    return self;
//}
    }
//
//#pragma mark - handlilng
//
//+(id)stringWithFormat:(NSString*)format arrayArguments:(NSArray*)argsArray{
    private static func string(format: String, arrayArguments: [Any]) -> String {
//    NSRange range = NSMakeRange(0, [argsArray count]);
//
//    NSMutableData* data = [NSMutableData dataWithLength: sizeof(id) * [argsArray count]];
//
//    [argsArray getObjects: (__unsafe_unretained id *)data.mutableBytes range:range];
        let arguments = arrayArguments.compactMap {$0 as? CVarArg}
//
//    NSString *str =  [[NSString alloc] initWithFormat:format  arguments: data.mutableBytes];
        let strInit = String.init(format:arguments:)
        let str = strInit(format, arguments)
//    return str;
        return str
//}
    }
//
//+ (void)handlePush:(NSDictionary *)userInfo{
    public static func handlePush(_ userInfo: [String: Any]) {
//
//    NSMutableDictionary *dicAps = [userInfo objectForKey:"aps"];
        guard let dicAps = userInfo["aps"] as? [String: Any] else {
            fatalError("aps not specified")
        }
//    NSString *message = nil;
        var message: String? = nil
//    NSString *cancelButtonTitle = "Close";
        let cancelButtonTitle = "Close" //### No localizing?
//    NSString *actionButtonTitle = nil;
        var actionButtonTitle: String? = nil
//    UIAlertView *alert = nil;
//    UIAlertController *alertController = nil;
//    if ([[dicAps objectForKey:"alert"] isKindOfClass:[NSNull class]]) {
        if dicAps["alert"] is NSNull {
            //Do nothing.
//    }else if ([[dicAps objectForKey:"alert"] isKindOfClass:[NSString class]]) {
        } else if let alert = dicAps["alert"] as? String {
//        message = [dicAps objectForKey:"alert"];
            message = alert
//    }else{
        } else if let alertDic = dicAps["alert"] as? [String: Any] {
//        NSMutableDictionary *dicParams = [NSMutableDictionary dictionary];
//        [dicParams setDictionary:[dicAps objectForKey:"alert"]];
            var dicParams = alertDic
//        if ([dicParams objectForKey:"body"]) {
            if let body = dicParams["body"] as? String {
//            message = [dicParams objectForKey:"body"];
                message = body
//        }
            }
//        if ([dicParams objectForKey:"loc-key"]) {
            if let locKey = dicParams["loc-key"] as? String,
                let locArgs = dicParams["loc-args"] as? [Any] {
//            message = [NCMBPush stringWithFormat:NSLocalizedString([dicParams objectForKey:"loc-key"], "loc-key") arrayArguments:[dicParams objectForKey:"loc-args"]];
                message = NCMBPush.string(format: NSLocalizedString(locKey, comment: "loc-key"), arrayArguments: locArgs)
//        }
            }
//        if ([dicParams objectForKey:"action-loc-key"]) {
            if let actionLocKey = dicParams["action-loc-key"] as? String {
//            actionButtonTitle = NSLocalizedString([dicParams objectForKey:"action-loc-key"], "action-loc-key");
                actionButtonTitle = NSLocalizedString(actionLocKey, comment: "action-loc-key")
//        }
            }
//        alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:actionButtonTitle,nil];
//    }
        }
//
//    if ([dicAps objectForKey:"sound"]) {
        if let strSound = dicAps["sound"] as? String {
//        NSString *strSound = [dicAps objectForKey:"sound"];
//        if ([strSound isKindOfClass:[NSNull class]]) {
//
//        }else{
//            NSArray *ary = [strSound componentsSeparatedByString:"."];
                let ary = strSound.components(separatedBy: ".")
//            if ([ary count]>2) {
                if ary.count > 2 {
//                NSString *strSoundName = (NSString*)[ary objectAtIndex:0];
                    let strSoundName = ary[0]
//                NSString *strSoundType = (NSString*)[ary objectAtIndex:1];
                    let strSoundType = ary[1]
//                CFStringRef cfstr_sound_name = CFStringCreateWithCString(kCFAllocatorDefault, [strSoundName UTF8String],kCFStringEncodingUTF8 );
//                CFStringRef cfstr_sound_type = CFStringCreateWithCString(kCFAllocatorDefault, [strSoundType UTF8String],kCFStringEncodingUTF8 );
//                SystemSoundID mSound = 0;
                    var mSound: SystemSoundID = 0
//                CFBundleRef mainBundle = CFBundleGetMainBundle();
                    let mainBundle = Bundle.main
//                CFURLRef soundURL = CFBundleCopyResourceURL(mainBundle, cfstr_sound_name, cfstr_sound_type, NULL );
                    let soundURL = mainBundle.url(forResource: strSoundName, withExtension: strSoundType)!
//                AudioServicesCreateSystemSoundID( soundURL, &mSound );
                    AudioServicesCreateSystemSoundID(soundURL as CFURL, &mSound)
//                AudioServicesPlaySystemSound( mSound );
                    AudioServicesPlaySystemSound(mSound)
//                CFRelease(soundURL);
//                CFRelease(cfstr_sound_name);
//                CFRelease(cfstr_sound_type);
//            }
//
//        }
            }
//    }
        }
//    if (![[dicAps objectForKey:"badge"] isKindOfClass:[NSNull class]]) {
        if let intBadge = dicAps["badge"] as? Int {
//
//        if ([dicAps objectForKey:"badge"]) {
//            [UIApplication sharedApplication].applicationIconBadgeNumber= [[dicAps objectForKey:"badge"] integerValue];
            UIApplication.shared.applicationIconBadgeNumber = intBadge
//        }
//    }
        }
//
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0){
        if #available(iOS 8.0, *) {
//        UIViewController *baseView = [UIApplication sharedApplication].keyWindow.rootViewController;
            var baseVC = UIApplication.shared.keyWindow?.rootViewController
//        while (baseView.presentedViewController != nil && !baseView.presentedViewController.isBeingDismissed) {
            while let presentedVC = baseVC?.presentedViewController,
                !presentedVC.isBeingDismissed {
//            baseView = baseView.presentedViewController;
                    baseVC = presentedVC
//        }
            }
//        alertController = [UIAlertController alertControllerWithTitle:nil
            let alertController = UIAlertController(title: nil,
                                                    message: message,
                                                    preferredStyle: .alert)
//                                                              message:message
//                                                       preferredStyle:UIAlertControllerStyleAlert];
//        [alertController addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            alertController.addAction(UIAlertAction(title: cancelButtonTitle,
                                                    style: .default) {action in
//            [baseView dismissViewControllerAnimated:YES completion:nil];
                baseVC?.dismiss(animated: true, completion: nil)
//        }]];
            })
//        [baseView presentViewController:alertController animated:YES completion:nil];
            baseVC?.present(alertController, animated: true, completion: nil)
//    } else {
        } else {
            //### We do not suppert iOS's less than 8.0
            fatalError("iOS less than 8.0 is not supported")
//        alert = [[UIAlertView alloc] initWithTitle:nil
//                                           message:message
//                                          delegate:nil
//                                 cancelButtonTitle:cancelButtonTitle
//                                 otherButtonTitles:actionButtonTitle, nil];
//        [alert show];
//    }
        }
//}
    }
//
//+ (void) handleRichPush:(NSDictionary *)userInfo {
    public static func handleRichPush(_ userInfo: [String: Any]) {
//    NSString *urlStr = [userInfo objectForKey:"com.nifcloud.mbaas.RichUrl"];
//
//    if ([urlStr isKindOfClass:[NSString class]]) {
        guard let urlStr = userInfo["com.nifcloud.mbaas.RichUrl"] as? String else {
            fatalError("*no url given*")
        }
//        if (rv == nil){
        if rv == nil {
//            rv = [[NCMBRichPushView alloc]init];
            rv = NCMBRichPushView()
//            UIInterfaceOrientation orientation = [[UIApplication sharedApplication]statusBarOrientation];
            let orientation = UIApplication.shared.statusBarOrientation
//            [rv appearWebView:orientation url:urlStr];
            rv!.appearWebView(orientation, url: urlStr)
//        }
        }
//        NSURL *url = [NSURL URLWithString:urlStr];
        let url = URL(string: urlStr)!
//        NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5];
        let req = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
//        [rv loadRequest:req];
        rv!.load(request: req)
//    }
//}
    }
//
//+ (void) resetRichPushView {
    @objc internal static func resetRichPushView() {
//    rv = nil;
        rv = nil
//}
    }
//
//#pragma mark - push notification configuration
//
//- (void)setUserSettingValue:(NSDictionary *)userSettingValue{
    public func set(userSettingValue: [String: Any]) {
//    [self setObject:userSettingValue forKey:"userSettingValue"];
        self.setObject(userSettingValue, forKey: "userSettingValue")
//}
    }
//
//- (void)setChannel:(NSString *)channel{
    public func set(channel: String) {
//    [_query whereKey:"channels" containedIn:[channel]];
        query?.where(key: "channels", containedIn: [channel])
//    [self setObject:[_query getQueryDictionary] forKey:"searchCondition"];
        self.setObject(query?.getQueryDictionary(), forKey: "searchCondition")
//}
    }
//
//- (void)setChannels:(NSArray *)channels{
    public func set(channels: [String]) {
//    [_query whereKey:"channels" containedIn:channels];
        query?.where(key: "channels", containedIn: channels)
//    [self setObject:[_query getQueryDictionary] forKey:"searchCondition"];
        self.setObject(query?.getQueryDictionary(), forKey: "searchCondition")
//}
    }
//
//- (void)setPushToAndroid:(BOOL)pushToAndroid{
    public func set(pushToAndroid: Bool) {
//    NSMutableArray *sendDeviceType;
        var sendDeviceType: [String] = []
//    if ([[estimatedData allKeys] containsObject:"target"]){
        if let target = estimatedData["target"] as? [String] {
//        sendDeviceType = [NSMutableArray arrayWithArray:[estimatedData objectForKey:"target"]];
            sendDeviceType = target
//    } else {
//        sendDeviceType = [NSMutableArray array];
//    }
        }
//    if (pushToAndroid){
        if pushToAndroid {
//        if ([sendDeviceType indexOfObject:"android"] == NSNotFound){
//            [sendDeviceType addObject:"android"];
//        }
//    } else {
        } else {
//        NSUInteger index = [sendDeviceType indexOfObject:"android"];
//        if (index != NSNotFound){
            if let index = sendDeviceType.firstIndex(of: "android") {
//            [sendDeviceType removeObjectAtIndex:index];
                sendDeviceType.remove(at: index)
//        }
            }
//    }
        }
//    [self setObject:sendDeviceType forKey:"target"];
        self.setObject(sendDeviceType, forKey: "target")
//}
    }
//
//- (void)setPushToIOS:(BOOL)pushToIOS{
    public func set(pushToIOS: Bool) {
//    NSMutableArray *sendDeviceType;
        var sendDeviceType: [String] = []
//    if ([[estimatedData allKeys] containsObject:"target"]){
        if let target = estimatedData["target"] as? [String] {
//        sendDeviceType = [NSMutableArray arrayWithArray:[estimatedData objectForKey:"target"]];
            sendDeviceType = target
//    } else {
//        sendDeviceType = [NSMutableArray array];
//    }
        }
//    if (pushToIOS){
        if pushToIOS {
//        if ([sendDeviceType indexOfObject:"ios"] == NSNotFound){
            if !sendDeviceType.contains("ios") {
//            [sendDeviceType addObject:"ios"];
                sendDeviceType.append("ios")
//        }
            }
//    } else {
        } else {
//        NSUInteger index = [sendDeviceType indexOfObject:"ios"];
//        if (index != NSNotFound){
            if let index = sendDeviceType.firstIndex(of: "ios") {
//            [sendDeviceType removeObjectAtIndex:index];
                sendDeviceType.remove(at: index)
//        }
            }
//    }
        }
//    [self setObject:sendDeviceType forKey:"target"];
        self.setObject(sendDeviceType, forKey: "target")
//}
    }
//
//- (void)setDialog:(BOOL)dialog{
    public func set(dialog: Bool) {
//    [self setObject:[NSNumber numberWithBool:dialog] forKey:"dialog"];
        self.setObject(dialog, forKey: "dialog")
//}
    }
//
//- (void)setImmediateDeliveryFlag:(BOOL)immediateDeliveryFlag{
    public func set(immediateDeliveryFlag: Bool) {
//    [self setObject:[NSNumber numberWithBool:immediateDeliveryFlag] forKey:"immediateDeliveryFlag"];
        self.setObject(immediateDeliveryFlag, forKey: "immediateDeliveryFlag")
//    [self removeObjectForKey:"deliveryTime"];
        self.removeObject(forKey: "deliveryTime")
//}
    }
//
//- (void)setDeliveryTime:(NSDate *)date{
    public func set(deliveryTime date: Date) {
//    [self setObject:date forKey:"deliveryTime"];
        self.setObject(date, forKey: "deliveryTime")
//    [self removeObjectForKey:"immediateDeliveryFlag"];
        self.removeObject(forKey: "immediateDeliveryFlag")
//}
    }
//
//- (void)setMessage:(NSString *)message{
    public func set(message: String) {
//    [self setObject:message forKey:"message"];
        self.setObject(message, forKey: "message")
//}
    }
//
//- (void)setSearchCondition:(NCMBQuery *)query{
    public func set(searchCondition query: NCMBQuery) {
//    if ([query.ncmbClassName isEqualToString:"installation"]){
        if query.ncmbClassName == "installation" {
//        _query = query;
            self.query = query
//        [self setObject:[_query getQueryDictionary] forKey:"searchCondition"];
            self.setObject(query.getQueryDictionary(), forKey: "searchCondition")
//    }
        }
//}
    }
//
//- (void)setRichUrl:(NSString *)url{
    public func set(richUrl url: String) {
//    [self setObject:url forKey:"richUrl"];
        self.setObject(url, forKey: "richUrl")
//}
    }
//
//- (void)setTitle:(NSString *)title{
    public func set(title: String) {
//    [self setObject:title forKey:"title"];
        self.setObject(title, forKey: "title")
//}
    }
//
//- (void)setAction:(NSString *)actionName{
    public func set(action actionName: String) {
//    [self setObject:actionName forKey:"action"];
        self.setObject(actionName, forKey: "action")
//}
    }
//
//- (void)setContentAvailable:(BOOL)contentAvailable{
    public func set(contentAvailable: Bool) {
//    [self setObject:[NSNumber numberWithBool:contentAvailable] forKey:"contentAvailable"];
        self.setObject(contentAvailable, forKey: "contentAvailable")
//    [self setObject:[NSNumber numberWithBool:NO] forKey:"badgeIncrementFlag"];
        self.setObject(false, forKey: "badgeIncrementFlag")
//    //[self removeObjectForKey:"badgeIncrementFlag"];
        //self.removeObject(forKey: "badgeIncrementFlag")
//}
    }
//
//- (void)setBadgeIncrementFlag:(BOOL)badgeIncrementFlag{
    public func set(badgeIncrementFlag: Bool) {
//    [self setObject:[NSNumber numberWithBool:badgeIncrementFlag] forKey:"badgeIncrementFlag"];
        self.setObject(badgeIncrementFlag, forKey: "badgeIncrementFlag")
//    [self setObject:[NSNumber numberWithBool:NO] forKey:"contentAvailable"];
        self.setObject(false, forKey: "contentAvailable")
//    //[self removeObjectForKey:"contentAvailable"];
        //self.removeObject(forKey: "contentAvailable")
//}
    }
//
//- (void)setBadgeNumber:(int)badgeNumber{
    public func set(badgeNumber: Int) {
//    if (![self objectForKey:"contentAvailable"] && ![self objectForKey:"badgeIncrementFlag"]){
        if self.object(forKey: "contentAvailable") == nil && self.object(forKey: "badgeIncrementFlag") == nil {
//        [self setObject:[NSNumber numberWithInt:badgeNumber] forKey:"badgeSetting"];
            self.setObject(badgeNumber, forKey: "badgeSetting")
//        [self setObject:[NSNumber numberWithBool:NO] forKey:"badgeIncrementFlag"];
            self.setObject(false, forKey: "badgeIncrementFlag")
//        [self setObject:[NSNumber numberWithBool:NO] forKey:"contentAvailable"];
            self.setObject(false, forKey: "contentAvailable")
//    }
        }
//}
    }
//
//- (void)setSound:(NSString *)soundFileName{
    public func set(sound soundFileName: String) {
//    [self setObject:soundFileName forKey:"sound"];
        self.setObject(soundFileName, forKey: "sound")
//}
    }
//
//- (void)setCategory:(NSString *)category{
    public func set(category: String) {
//    [self setObject:category forKey:"category"];
        self.setObject(category, forKey: "category")
//}
    }
//
//
//- (void)expireAtDate:(NSDate *)date{
    public func expire(at date: Date) {
//    [self setObject:date forKey:"deliveryExpirationDate"];
        self.setObject(date, forKey: "deliveryExpirationDate")
//}
    }
//
//- (void)expireAfterTimeInterval:(NSString *)timeInterval{
    public func expire(afterTimeInterval timeInterval: String) {
//    [self setObject:timeInterval forKey:"deliveryExpirationTime"];
        self.setObject(timeInterval, forKey: "deliveryExpirationTime")
//}
    }
//
//- (void)clearExpiration{
    public func clearExpiration() {
//    [self removeObjectForKey:"deliveryExpirationDate"];
        self.removeObject(forKey: "deliveryExpirationDate")
//    [self removeObjectForKey:"deliveryExpirationTime"];
        self.removeObject(forKey: "deliveryExpirationTime")
//}
    }
//
//- (void)setData:(NSDictionary*)dic{
    public func set(data dic: [String: Any]) {
//    for (NSString *key in [[dic allKeys] objectEnumerator]){
        for (key, value) in dic {
//        if ([key isEqualToString:"badgeSetting"]){
            if key == "badgeSetting", let intValue = value as? Int {
//            [self setBadgeNumber:[[dic objectForKey:key] intValue]];
                self.set(badgeNumber: intValue)
//        } else if ([key isEqualToString:"badgeIncrementFlag"]){
            } else if key == "badgeIncrementFlag", let boolValue = value as? Bool {
//            [self setBadgeIncrementFlag:[[dic objectForKey:key] boolValue]];
                self.set(badgeIncrementFlag: boolValue)
//        } else if ([key isEqualToString:"contentAvailable"]){
            } else if key == "contentAvailable", let boolValue = value as? Bool {
//            [self setContentAvailable:[[dic objectForKey:key] boolValue]];
                self.set(contentAvailable: boolValue)
//        } else {
            } else {
//            [self setObject:[dic objectForKey:key] forKey:key];
                self.setObject(value, forKey: key)
//        }
            }
//    }
        }
//}
    }
//
//#pragma mark - sendPush
//
//- (void)sendPush:(NSError **)error{
    public func __sendPush() throws {
        fatalError("\(#function): Sync methods not supported")
//    [self save:error];
//}
    }
//
//- (void)sendPushInBackgroundWithBlock:(NCMBErrorResultBlock)block{
    public func sendPushAsync(block: NCMBErrorResultBlock?) {
//    [self saveInBackgroundWithBlock:block];
        self.saveAsync(block: block)
//}
    }
//
//- (void)sendPushInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func sendPushAsync(target: AnyObject, selector: Selector) {
//    [self saveInBackgroundWithTarget:target selector:selector];
        self.saveAsync(target: target, selector: selector)
//}
    }
//
//+ (void)sendPushDataToChannel:(NSString *)channel
    public static func __sendPush(toChannel channel: String,
//                     withData:(NSDictionary *)data
        data: [String: Any]) throws {
        fatalError("\(#function): Sync methods not supported")
//                        error:(NSError **)error{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setChannel:channel];
//    [push setData:data];
//    [push sendPush:error];
//
//}
    }
//
//+ (void)sendPushDataToChannelInBackground:(NSString *)channel
    public static func sendPushAsync(toChannel channel: String,
//                                 withData:(NSDictionary *)data
        data: [String: Any],
//                                    block:(NCMBErrorResultBlock)block{
        block: NCMBErrorResultBlock?) {
//    NCMBPush *push = [[NCMBPush alloc] init];
        let push = NCMBPush()
//    [push setChannel:channel];
        push.set(channel: channel)
//    [push setData:data];
        push.set(data: data)
//    [push sendPushInBackgroundWithBlock:block];
        push.sendPushAsync(block: block)
//}
    }
//
//+ (void)sendPushDataToChannelInBackground:(NSString *)channel
    public static func sendPushAsync(toChannel channel: String,
//                                 withData:(NSDictionary *)data
        data: [String: Any],
//                                   target:(id)target
        target: AnyObject,
//                                 selector:(SEL)selector{
        selector: Selector) {
//    NCMBPush *push = [[NCMBPush alloc] init];
        let push = NCMBPush()
//    [push setChannel:channel];
        push.set(channel: channel)
//    [push setData:data];
        push.set(data: data)
//    [push sendPushInBackgroundWithTarget:target selector:selector];
        push.sendPushAsync(target: target, selector: selector)
//
//}
    }
//
//+ (void)sendPushDataToQuery:(NCMBQuery *)query
    public static func __sendPush(to query: NCMBQuery,
//                   withData:(NSDictionary *)data
        data: [String: Any]) throws {
        fatalError("\(#function): Sync methods not supported")
//                      error:(NSError **)error{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setQuery:query];
//    [push setData:data];
//    [push sendPush:error];
//}
    }
//
//+ (void)sendPushDataToQueryInBackground:(NCMBQuery *)query
    public static func sendPushAsync(to query: NCMBQuery,
//                               withData:(NSDictionary *)data
        data: [String: Any],
//                                  block:(NCMBErrorResultBlock)block{
        block: NCMBErrorResultBlock?) {
//    NCMBPush *push = [[NCMBPush alloc] init];
        let push = NCMBPush()
//    [push setQuery:query];
        push.set(searchCondition: query)
//    [push setData:data];
        push.set(data: data)
//    [push sendPushInBackgroundWithBlock:block];
        push.sendPushAsync(block: block)
//}
    }
//
//+ (void)sendPushMessageToChannel:(NSString *)channel
    public static func __sendPush(toChannel channel: String,
//                     withMessage:(NSString *)message
        message: String) throws {
        fatalError("\(#function): Sync methods not supported")
//                           error:(NSError **)error{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setChannel:channel];
//    [push setMessage:message];
//    [push sendPush:error];
//}
    }
//
//+ (void)sendPushMessageToChannelInBackground:(NSString *)channel
    public static func sendPushAsync(toChannel channel: String,
//                                 withMessage:(NSString *)message
        message: String,
//                                       block:(NCMBErrorResultBlock)block{
        block: NCMBErrorResultBlock?) {
//    NCMBPush *push = [[NCMBPush alloc] init];
        let push = NCMBPush()
//    [push setChannel:channel];
        push.set(channel: channel)
//    [push setMessage:message];
        push.set(message: message)
//    [push sendPushInBackgroundWithBlock:block];
        push.sendPushAsync(block: block)
//}
    }
//
//+ (void)sendPushMessageToChannelInBackground:(NSString *)channel
    public static func sendPushAsync(toChannel channel: String,
//                                 withMessage:(NSString *)message
        message: String,
//                                      target:(id)target
        target: AnyObject,
//                                    selector:(SEL)selector{
        selector: Selector) {
//    NCMBPush *push = [[NCMBPush alloc] init];
        let push = NCMBPush()
//    [push setChannel:channel];
        push.set(channel: channel)
//    [push setMessage:message];
        push.set(message: message)
//    [push sendPushInBackgroundWithTarget:target selector:selector];
        push.sendPushAsync(target: target, selector: selector)
//}
    }
//
//+ (void)sendPushMessageToQuery:(NCMBQuery *)query
    public static func __sendPush(to query: NCMBQuery,
//                   withMessage:(NSString *)message
        message: String) throws {
//                         error:(NSError **)error{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setQuery:query];
//    [push setMessage:message];
//    return [push sendPush:error];
//}
    }
//
//+ (void)sendPushMessageToQueryInBackground:(NCMBQuery *)query
    public static func sendPushAsync(to query: NCMBQuery,
//                               withMessage:(NSString *)message
        message: String,
//                                     block:(NCMBErrorResultBlock)block{
        block: NCMBErrorResultBlock?) {
//    NCMBPush *push = [[NCMBPush alloc] init];
        let push = NCMBPush()
//    [push setQuery:query];
        push.set(searchCondition: query)
//    [push setMessage:message];
        push.set(message: message)
//    [push sendPushInBackgroundWithBlock:block];
        push.sendPushAsync(block: block)
//}
    }
//
//#pragma mark - override
//
//- (void)setObject:(id)object forKey:(NSString *)key{
    public override func setObject(_ object: Any?, forKey key: String) {
//    //既定フィールドの配列を作成
//    NSArray *keys = ["deliveryTime",
//                      "immediateDeliveryFlag",
//                      "target",
//                      "searchCondition",
//                      "message",
//                      "userSettingValue",
//                      "deliveryExpirationDate",
//                      "deliveryExpirationTime",
//                      "action",
//                      "title",
//                      "dialog",
//                      "badgeIncrementFlag",
//                      "badgeSetting",
//                      "sound",
//                      "contentAvailable",
//                      "category",
//                      "richUrl",
//                      "acl"
//                      ];
        enum My {
            static let keys: Set<String> = ["deliveryTime",
                              "immediateDeliveryFlag",
                              "target",
                              "searchCondition",
                              "message",
                              "userSettingValue",
                              "deliveryExpirationDate",
                              "deliveryExpirationTime",
                              "action",
                              "title",
                              "dialog",
                              "badgeIncrementFlag",
                              "badgeSetting",
                              "sound",
                              "contentAvailable",
                              "category",
                              "richUrl",
                              "acl"
                              ]
        }
//    if ([keys containsObject:key]){
        if My.keys.contains(key) {
//        [super setObject:object forKey:key];
            super.setObject(object, forKey: key)
//    } else {
        } else {
//        //NCMBPushクラスは任意フィールドを設定できない
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:"UnsupportedOperation." userInfo:nil] raise];
            fatalError("UnsupportedOperation.")
//    }
        }
//}
    }
//
//#pragma mark delegate
//
//
//
//end
}
