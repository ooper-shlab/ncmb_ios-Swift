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
import Foundation
//#import "NCMBConstants.h"
//
//#import <AudioToolbox/AudioToolbox.h>
import AudioToolbox
//
//@class NCMBQuery;
//
//
///**
// NCMBPushは、プッシュ通知の登録・更新・取得・削除を行うクラスです。
// */
//@interface NCMBPush : NCMBObject
public class NCMBPush: NCMBObject {
//
///** @name Create */
//
///**
// NCMBPushのインスタンスを生成
// @return NCMBPushのインスタンス
// */
//+ (NCMBPush *)push;
//
///** @name Configuration */
//
///**
// プッシュ通知のタイトルを設定(Androidのみ)
// @param title プッシュ通知のタイトル
// */
//- (void)setTitle:(NSString*)title;
//
///**
// プッシュ通知を送信するチャネルを設定
// @param channel プッシュ通知を送信するチャネル
// */
//- (void)setChannel:(NSString *)channel;
//
///**
// プッシュ通知を送信する複数のチャネルを設定
// @param channels プッシュ通知を送信する複数のチャネルを格納した配列
// */
//- (void)setChannels:(NSArray *)channels;
//
///**
// (非推奨:新たに利用する場合はsetSearchConditionを使いましょう)
// プッシュ通知の配信先となる配信端末を絞り込むためのクエリを設定
// @param query プッシュ先を絞り込むためのクエリ
// */
//- (void)setQuery:(NCMBQuery *)query;
//
///**
// プッシュ通知の配信先となる配信端末を絞り込むためのクエリを設定
// @param query プッシュ先を絞り込むためのクエリ
// */
//- (void)setSearchCondition:(NCMBQuery *)query;
//
///**
// プッシュ通知のメッセージ内容を設定
// @param message プッシュ通知のメッセージ内容
// */
//- (void)setMessage:(NSString *)message;
//
///**
// Android端末でダイアログプッシュ通知を行う設定
// @param dialog ダイアログプッシュ通知を行う場合はtrueを設定。
// */
//- (void)setDialog:(BOOL)dialog;
//
///**
// リッチプッシュ通知用のURLを設定
// @param url リッチプッシュ通知で表示するWebページのURL
// */
//- (void)setRichUrl:(NSString *)url;
//
///**
// Androidへの配信設定
// @param pushToAndroid 配信設定。配信する場合はtrueを設定。
// */
//- (void)setPushToAndroid:(BOOL)pushToAndroid;
//
///**
// iOSへの配信設定
// @param pushToIOS 配信設定。配信する場合はtrueを設定。
// */
//- (void)setPushToIOS:(BOOL)pushToIOS;
//
//
///**
// プッシュ通知の有効期限を設定
// @param date プッシュ通知の有効期限
// */
//- (void)expireAtDate:(NSDate *)date;
//
///**
// プッシュ通知配信日時から設定したインターバル後を有効期限に設定
// @param timeInterval 設定できる値は、時間単位で指定する場合は「n hour」(n=1～24）、日単位で指定する場合は「n day」（n=1～28）。
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
// @param userSettingValue ユーザの情報
// */
//- (void)setUserSettingValue:(NSDictionary *)userSettingValue;
//
///**
// プッシュ通知の配信日時を設定
// @param date プッシュ通知の配信日時
// */
//- (void)setDeliveryTime:(NSDate *)date;
//
///**
// 即時配信フラグを設定
// @param immediateDeliveryFlag 即時配信フラグ。即時配信にする場合はYESを設定。デフォルトはYES。
// */
//- (void)setImmediateDeliveryFlag:(BOOL)immediateDeliveryFlag;
//
///**
// バッジ数を設定(iOSのみ)
// @param badgeNumber バッジ数
// */
//- (void)setBadgeNumber:(int)badgeNumber;
//
///**
// バッジ数のインクリメント設定
// @param badgeIncrementFlag バッジ数をインクリメントする場合はYESを設定する
// */
//- (void)setBadgeIncrementFlag:(BOOL)badgeIncrementFlag;
//
///**
// 通知音を設定(iOSのみ)
// @param soundFileName 音声ファイル名
// */
//- (void)setSound:(NSString*)soundFileName;
//
///**
// content-availableを設定(iOSのみ)
// @param contentAvailable content-availableの設定値（真偽値）
// */
//- (void)setContentAvailable:(BOOL)contentAvailable;
//
///**
// categoryを設定(iOSのみ)
// @param category categoryの名前
// */
//- (void)setCategory:(NSString*)category;
//
//
///**
// actionを設定(Androidのみ)
// @param actionName アクション名
// */
//- (void)setAction:(NSString*)actionName;
//
///**
// プッシュ通知の設定が格納されたNSDictionaryをセットする
// @param dic プッシュ通知の設定
// */
//- (void)setData:(NSDictionary*)dic;
//
///** @name Send */
//
///**
// 指定したチャネルにメッセージのみのプッシュ通知を送信。必要があればエラーをセットし、取得することもできる。
// @param channel プッシュ先のチャネル
// @param message メッセージ内容
// @param error 処理中に起きたエラーのポインタ
// */
//+ (void)sendPushMessageToChannel:(NSString *)channel
//                     withMessage:(NSString *)message
//                           error:(NSError **)error;
//
//
///**
// 指定したチャネルに非同期でメッセージのみのプッシュ通知を送信。登録し終わったら与えられたblockを呼び出す。
// @param channel プッシュ先のチャネル
// @param message メッセージ内容
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushMessageToChannelInBackground:(NSString *)channel
//                                 withMessage:(NSString *)message
//                                       block:(NCMBErrorResultBlock)block;
//
///**
// 指定したチャネルに非同期でメッセージのみのプッシュ通知を送信。取得し終わったら指定されたcallbackを呼び出す。
// @param channel プッシュ先のチャネル
// @param message メッセージ内容
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NSNumber )result error:(NSError )error
// resultには送信完了の有無をNSNumber型で渡される。errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushMessageToChannelInBackground:(NSString *)channel
//                                 withMessage:(NSString *)message
//                                      target:(id)target
//                                    selector:(SEL)selector;
//
///**
// 指定したクエリを満たした配信端末にメッセージのみのプッシュ通知を送信。必要があればエラーをセットし、取得することもできる。
// @param query 指定するクエリ
// @param message メッセージ内容
// @param error 処理中に起きたエラーのポインタ
// */
//+ (void)sendPushMessageToQuery:(NCMBQuery *)query
//                   withMessage:(NSString *)message
//                         error:(NSError **)error;
//
//
///**
// 指定したクエリを満たした配信端末に非同期でメッセージのみのプッシュ通知を送信。登録し終わったら与えられたblockを呼び出す。
// @param query 指定するクエリ
// @param message メッセージ内容
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushMessageToQueryInBackground:(NCMBQuery *)query
//                               withMessage:(NSString *)message
//                                     block:(NCMBErrorResultBlock)block;
//
//
///**
// 指定したチャネルにプッシュ通知を送信。必要があればエラーをセットし、取得することもできる。
// @param channel プッシュ先のチャネル
// @param data プッシュ通知内容
// @param error 処理中に起きたエラーのポインタ
// */
//+ (void)sendPushDataToChannel:(NSString *)channel
//                     withData:(NSDictionary *)data
//                        error:(NSError **)error;
//
//
///**
// 指定したチャネルに非同期でプッシュ通知を送信。登録し終わったら与えられたblockを呼び出す。
// @param channel プッシュ先のチャネル
// @param data プッシュ通知内容
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushDataToChannelInBackground:(NSString *)channel
//                                 withData:(NSDictionary *)data
//                                    block:(NCMBErrorResultBlock)block;
//
//
///**
// 指定したチャネルに非同期でプッシュ通知を送信。登録し終わったら指定されたcallbackを呼び出す。
// @param channel プッシュ先のチャネル
// @param data プッシュ通知内容
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NSNumber )result error:(NSError )error
// resultには送信完了の有無をNSNumber型で渡される。errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushDataToChannelInBackground:(NSString *)channel
//                                 withData:(NSDictionary *)data
//                                   target:(id)target
//                                 selector:(SEL)selector;
//
///**
// 指定したクエリを満たした配信端末にプッシュ通知を送信。必要があればエラーをセットし、取得することもできる。
// @param query 指定するクエリ
// @param data プッシュ通知内容
// @param error 処理中に起きたエラーのポインタ
// */
//+ (void)sendPushDataToQuery:(NCMBQuery *)query
//                   withData:(NSDictionary *)data
//                      error:(NSError **)error;
//
///**
// 指定したクエリを満たした配信端末に非同期でプッシュ通知を送信。登録し終わったら与えられたblockを呼び出す。
// @param query 指定するクエリ
// @param data プッシュ通知内容
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//+ (void)sendPushDataToQueryInBackground:(NCMBQuery *)query
//                               withData:(NSDictionary *)data
//                                  block:(NCMBErrorResultBlock)block;
//
///**
// プッシュ通知を送信。必要があればエラーをセットし、取得することができる。
// @param error 処理中に起きたエラーのポインタ
// */
//- (void)sendPush:(NSError **)error;
//
//
///**
// プッシュ通知を非同期で送信。登録し終わったら与えられたblockを呼び出す。
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある(NSError *error)
// errorにはエラーがなければnilが渡される。
// */
//- (void)sendPushInBackgroundWithBlock:(NCMBErrorResultBlock)block;
//
///**
// プッシュ通知を非同期で送信。取得し終わったら指定されたcallbackを呼び出す。
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。引数として(NSError*)errorオブジェクトを取得できる。
// */
//- (void)sendPushInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
//
///** @name Handling */
//
///**
// アプリ起動中にプッシュ通知内容を取得した場合、通知内容を表示する。
// @param userInfo プッシュ通知内容
// */
//+ (void)handlePush:(NSDictionary *)userInfo;
//
///**
// アプリ起動中にプッシュ通知内容を取得した場合、Webページを表示する。
// @param userInfo プッシュ通知内容
// */
//+ (void)handleRichPush:(NSDictionary *)userInfo;
//
///** @name Query */
//
///**
// クラス名を指定してクエリの生成
// */
//+ (NCMBQuery *)query;
//
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
//#import "NCMBPush.h"
//#import "NCMBQuery.h"
//
//#import "NCMBObject+Private.h"
//#import "NCMBQuery+Private.h"
//#import "NCMBRichPushView.h"
//
//@interface NCMBPush ()
//
//@property (nonatomic)NCMBQuery *query;
    private var query: NCMBQuery?
//
//@end
//
//@implementation NCMBPush
//
//static NCMBRichPushView *rv;
    private static var rv: NCMBRichPushView?
//
//+(NCMBQuery*)query{
    internal override class func query() -> NCMBQuery {
//    NCMBQuery *query = [NCMBQuery queryWithClassName:@"push"];
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
//    //self = [[NCMBPush alloc] initWithClassName:@"push"];
//    self = [self initWithClassName:@"push"];
        super.init(className: "push")
//    //self = [super init];
//    if (self){
//        _query = [NCMBQuery queryWithClassName:@"installation"];
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
//    NSMutableDictionary *dicAps = [userInfo objectForKey:@"aps"];
        guard let dicAps = userInfo["aps"] as? [String: Any] else {
            fatalError("aps not specified")
        }
//    NSString *message = nil;
        let message: String? = nil
//    NSString *cancelButtonTitle = @"Close";
        let cancelButtonTitle = "Close"
//    NSString *actionButtonTitle = nil;
        let actionButtonTitle: String? = nil
//    UIAlertView *alert = nil;
//    UIAlertController *alertController = nil;
//    if ([[dicAps objectForKey:@"alert"] isKindOfClass:[NSNull class]]) {
//    }else if ([[dicAps objectForKey:@"alert"] isKindOfClass:[NSString class]]) {
//        message = [dicAps objectForKey:@"alert"];
//    }else{
//        NSMutableDictionary *dicParams = [NSMutableDictionary dictionary];
//        [dicParams setDictionary:[dicAps objectForKey:@"alert"]];
//        if ([dicParams objectForKey:@"body"]) {
//            message = [dicParams objectForKey:@"body"];
//        }
//        if ([dicParams objectForKey:@"loc-key"]) {
//            message = [NCMBPush stringWithFormat:NSLocalizedString([dicParams objectForKey:@"loc-key"], @"loc-key") arrayArguments:[dicParams objectForKey:@"loc-args"]];
//        }
//        if ([dicParams objectForKey:@"action-loc-key"]) {
//            actionButtonTitle = NSLocalizedString([dicParams objectForKey:@"action-loc-key"], @"action-loc-key");
//        }
//        alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:actionButtonTitle,nil];
//    }
//
//    if ([dicAps objectForKey:@"sound"]) {
//        NSString *strSound = [dicAps objectForKey:@"sound"];
//        if ([strSound isKindOfClass:[NSNull class]]) {
//
//        }else{
//            NSArray *ary = [strSound componentsSeparatedByString:@"."];
//            if ([ary count]>2) {
//                NSString *strSoundName = (NSString*)[ary objectAtIndex:0];
//                NSString *strSoundType = (NSString*)[ary objectAtIndex:1];
//                CFStringRef cfstr_sound_name = CFStringCreateWithCString(kCFAllocatorDefault, [strSoundName UTF8String],kCFStringEncodingUTF8 );
//                CFStringRef cfstr_sound_type = CFStringCreateWithCString(kCFAllocatorDefault, [strSoundType UTF8String],kCFStringEncodingUTF8 );
//                SystemSoundID mSound = 0;
//                CFBundleRef mainBundle = CFBundleGetMainBundle();
//                CFURLRef soundURL = CFBundleCopyResourceURL(mainBundle, cfstr_sound_name, cfstr_sound_type, NULL );
//                AudioServicesCreateSystemSoundID( soundURL, &mSound );
//                AudioServicesPlaySystemSound( mSound );
//                CFRelease(soundURL);
//                CFRelease(cfstr_sound_name);
//                CFRelease(cfstr_sound_type);
//            }
//
//        }
//    }
//    if (![[dicAps objectForKey:@"badge"] isKindOfClass:[NSNull class]]) {
//
//        if ([dicAps objectForKey:@"badge"]) {
//            [UIApplication sharedApplication].applicationIconBadgeNumber= [[dicAps objectForKey:@"badge"] integerValue];
//        }
//    }
//
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0){
//        UIViewController *baseView = [UIApplication sharedApplication].keyWindow.rootViewController;
//        while (baseView.presentedViewController != nil && !baseView.presentedViewController.isBeingDismissed) {
//            baseView = baseView.presentedViewController;
//        }
//        alertController = [UIAlertController alertControllerWithTitle:nil
//                                                              message:message
//                                                       preferredStyle:UIAlertControllerStyleAlert];
//        [alertController addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            [baseView dismissViewControllerAnimated:YES completion:nil];
//        }]];
//        [baseView presentViewController:alertController animated:YES completion:nil];
//    } else {
//        alert = [[UIAlertView alloc] initWithTitle:nil
//                                           message:message
//                                          delegate:nil
//                                 cancelButtonTitle:cancelButtonTitle
//                                 otherButtonTitles:actionButtonTitle, nil];
//        [alert show];
//    }
//}
    }
//
//+ (void) handleRichPush:(NSDictionary *)userInfo {
//    NSString *urlStr = [userInfo objectForKey:@"com.nifcloud.mbaas.RichUrl"];
//
//    if ([urlStr isKindOfClass:[NSString class]]) {
//        if (rv == nil){
//            rv = [[NCMBRichPushView alloc]init];
//            UIInterfaceOrientation orientation = [[UIApplication sharedApplication]statusBarOrientation];
//            [rv appearWebView:orientation url:urlStr];
//        }
//        NSURL *url = [NSURL URLWithString:urlStr];
//        NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5];
//        [rv loadRequest:req];
//    }
//}
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
//    [self setObject:userSettingValue forKey:@"userSettingValue"];
//}
//
//- (void)setChannel:(NSString *)channel{
//    [_query whereKey:@"channels" containedIn:@[channel]];
//    [self setObject:[_query getQueryDictionary] forKey:@"searchCondition"];
//}
//
//- (void)setChannels:(NSArray *)channels{
//    [_query whereKey:@"channels" containedIn:channels];
//    [self setObject:[_query getQueryDictionary] forKey:@"searchCondition"];
//}
//
//- (void)setPushToAndroid:(BOOL)pushToAndroid{
//    NSMutableArray *sendDeviceType;
//    if ([[estimatedData allKeys] containsObject:@"target"]){
//        sendDeviceType = [NSMutableArray arrayWithArray:[estimatedData objectForKey:@"target"]];
//    } else {
//        sendDeviceType = [NSMutableArray array];
//    }
//    if (pushToAndroid){
//        if ([sendDeviceType indexOfObject:@"android"] == NSNotFound){
//            [sendDeviceType addObject:@"android"];
//        }
//    } else {
//        NSUInteger index = [sendDeviceType indexOfObject:@"android"];
//        if (index != NSNotFound){
//            [sendDeviceType removeObjectAtIndex:index];
//        }
//    }
//    [self setObject:sendDeviceType forKey:@"target"];
//}
//
//- (void)setPushToIOS:(BOOL)pushToIOS{
//    NSMutableArray *sendDeviceType;
//    if ([[estimatedData allKeys] containsObject:@"target"]){
//        sendDeviceType = [NSMutableArray arrayWithArray:[estimatedData objectForKey:@"target"]];
//    } else {
//        sendDeviceType = [NSMutableArray array];
//    }
//    if (pushToIOS){
//        if ([sendDeviceType indexOfObject:@"ios"] == NSNotFound){
//            [sendDeviceType addObject:@"ios"];
//        }
//    } else {
//        NSUInteger index = [sendDeviceType indexOfObject:@"ios"];
//        if (index != NSNotFound){
//            [sendDeviceType removeObjectAtIndex:index];
//        }
//    }
//    [self setObject:sendDeviceType forKey:@"target"];
//}
//
//- (void)setDialog:(BOOL)dialog{
//    [self setObject:[NSNumber numberWithBool:dialog] forKey:@"dialog"];
//}
//
//- (void)setImmediateDeliveryFlag:(BOOL)immediateDeliveryFlag{
//    [self setObject:[NSNumber numberWithBool:immediateDeliveryFlag] forKey:@"immediateDeliveryFlag"];
//    [self removeObjectForKey:@"deliveryTime"];
//}
//
//- (void)setDeliveryTime:(NSDate *)date{
//    [self setObject:date forKey:@"deliveryTime"];
//    [self removeObjectForKey:@"immediateDeliveryFlag"];
//}
//
//- (void)setMessage:(NSString *)message{
//    [self setObject:message forKey:@"message"];
//}
//
//- (void)setSearchCondition:(NCMBQuery *)query{
//    if ([query.ncmbClassName isEqualToString:@"installation"]){
//        _query = query;
//        [self setObject:[_query getQueryDictionary] forKey:@"searchCondition"];
//    }
//}
//
//- (void)setRichUrl:(NSString *)url{
//    [self setObject:url forKey:@"richUrl"];
//}
//
//- (void)setTitle:(NSString *)title{
//    [self setObject:title forKey:@"title"];
//}
//
//- (void)setAction:(NSString *)actionName{
//    [self setObject:actionName forKey:@"action"];
//}
//
//- (void)setContentAvailable:(BOOL)contentAvailable{
//    [self setObject:[NSNumber numberWithBool:contentAvailable] forKey:@"contentAvailable"];
//    [self setObject:[NSNumber numberWithBool:NO] forKey:@"badgeIncrementFlag"];
//    //[self removeObjectForKey:@"badgeIncrementFlag"];
//}
//
//- (void)setBadgeIncrementFlag:(BOOL)badgeIncrementFlag{
//    [self setObject:[NSNumber numberWithBool:badgeIncrementFlag] forKey:@"badgeIncrementFlag"];
//    [self setObject:[NSNumber numberWithBool:NO] forKey:@"contentAvailable"];
//    //[self removeObjectForKey:@"contentAvailable"];
//}
//
//- (void)setBadgeNumber:(int)badgeNumber{
//    if (![self objectForKey:@"contentAvailable"] && ![self objectForKey:@"badgeIncrementFlag"]){
//        [self setObject:[NSNumber numberWithInt:badgeNumber] forKey:@"badgeSetting"];
//        [self setObject:[NSNumber numberWithBool:NO] forKey:@"badgeIncrementFlag"];
//        [self setObject:[NSNumber numberWithBool:NO] forKey:@"contentAvailable"];
//    }
//}
//
//- (void)setSound:(NSString *)soundFileName{
//    [self setObject:soundFileName forKey:@"sound"];
//}
//
//- (void)setCategory:(NSString *)category{
//    [self setObject:category forKey:@"category"];
//}
//
//
//- (void)expireAtDate:(NSDate *)date{
//    [self setObject:date forKey:@"deliveryExpirationDate"];
//}
//
//- (void)expireAfterTimeInterval:(NSString *)timeInterval{
//    [self setObject:timeInterval forKey:@"deliveryExpirationTime"];
//}
//
//- (void)clearExpiration{
//    [self removeObjectForKey:@"deliveryExpirationDate"];
//    [self removeObjectForKey:@"deliveryExpirationTime"];
//}
//
//- (void)setData:(NSDictionary*)dic{
//    for (NSString *key in [[dic allKeys] objectEnumerator]){
//        if ([key isEqualToString:@"badgeSetting"]){
//            [self setBadgeNumber:[[dic objectForKey:key] intValue]];
//        } else if ([key isEqualToString:@"badgeIncrementFlag"]){
//            [self setBadgeIncrementFlag:[[dic objectForKey:key] boolValue]];
//        } else if ([key isEqualToString:@"contentAvailable"]){
//            [self setContentAvailable:[[dic objectForKey:key] boolValue]];
//        } else {
//            [self setObject:[dic objectForKey:key] forKey:key];
//        }
//    }
//}
//
//#pragma mark - sendPush
//
//- (void)sendPush:(NSError **)error{
//    [self save:error];
//}
//
//- (void)sendPushInBackgroundWithBlock:(NCMBErrorResultBlock)block{
//    [self saveInBackgroundWithBlock:block];
//}
//
//- (void)sendPushInBackgroundWithTarget:(id)target selector:(SEL)selector{
//    [self saveInBackgroundWithTarget:target selector:selector];
//}
//
//+ (void)sendPushDataToChannel:(NSString *)channel
//                     withData:(NSDictionary *)data
//                        error:(NSError **)error{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setChannel:channel];
//    [push setData:data];
//    [push sendPush:error];
//
//}
//
//+ (void)sendPushDataToChannelInBackground:(NSString *)channel
//                                 withData:(NSDictionary *)data
//                                    block:(NCMBErrorResultBlock)block{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setChannel:channel];
//    [push setData:data];
//    [push sendPushInBackgroundWithBlock:block];
//}
//
//+ (void)sendPushDataToChannelInBackground:(NSString *)channel
//                                 withData:(NSDictionary *)data
//                                   target:(id)target
//                                 selector:(SEL)selector{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setChannel:channel];
//    [push setData:data];
//    [push sendPushInBackgroundWithTarget:target selector:selector];
//
//}
//
//+ (void)sendPushDataToQuery:(NCMBQuery *)query
//                   withData:(NSDictionary *)data
//                      error:(NSError **)error{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setQuery:query];
//    [push setData:data];
//    [push sendPush:error];
//}
//
//+ (void)sendPushDataToQueryInBackground:(NCMBQuery *)query
//                               withData:(NSDictionary *)data
//                                  block:(NCMBErrorResultBlock)block{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setQuery:query];
//    [push setData:data];
//    [push sendPushInBackgroundWithBlock:block];
//}
//
//+ (void)sendPushMessageToChannel:(NSString *)channel
//                     withMessage:(NSString *)message
//                           error:(NSError **)error{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setChannel:channel];
//    [push setMessage:message];
//    [push sendPush:error];
//}
//
//+ (void)sendPushMessageToChannelInBackground:(NSString *)channel
//                                 withMessage:(NSString *)message
//                                       block:(NCMBErrorResultBlock)block{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setChannel:channel];
//    [push setMessage:message];
//    [push sendPushInBackgroundWithBlock:block];
//}
//
//+ (void)sendPushMessageToChannelInBackground:(NSString *)channel
//                                 withMessage:(NSString *)message
//                                      target:(id)target
//                                    selector:(SEL)selector{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setChannel:channel];
//    [push setMessage:message];
//    [push sendPushInBackgroundWithTarget:target selector:selector];
//}
//
//+ (void)sendPushMessageToQuery:(NCMBQuery *)query
//                   withMessage:(NSString *)message
//                         error:(NSError **)error{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setQuery:query];
//    [push setMessage:message];
//    return [push sendPush:error];
//}
//
//+ (void)sendPushMessageToQueryInBackground:(NCMBQuery *)query
//                               withMessage:(NSString *)message
//                                     block:(NCMBErrorResultBlock)block{
//    NCMBPush *push = [[NCMBPush alloc] init];
//    [push setQuery:query];
//    [push setMessage:message];
//    [push sendPushInBackgroundWithBlock:block];
//}
//
//#pragma mark - override
//
//- (void)setObject:(id)object forKey:(NSString *)key{
//    //既定フィールドの配列を作成
//    NSArray *keys = @[@"deliveryTime",
//                      @"immediateDeliveryFlag",
//                      @"target",
//                      @"searchCondition",
//                      @"message",
//                      @"userSettingValue",
//                      @"deliveryExpirationDate",
//                      @"deliveryExpirationTime",
//                      @"action",
//                      @"title",
//                      @"dialog",
//                      @"badgeIncrementFlag",
//                      @"badgeSetting",
//                      @"sound",
//                      @"contentAvailable",
//                      @"category",
//                      @"richUrl",
//                      @"acl"
//                      ];
//    if ([keys containsObject:key]){
//        [super setObject:object forKey:key];
//    } else {
//        //NCMBPushクラスは任意フィールドを設定できない
//        [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
//    }
//}
//
//#pragma mark delegate
//
//
//
//@end
}
