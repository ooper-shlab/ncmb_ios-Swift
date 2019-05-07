//
//  NCMBReachability.swift
//  NCMB
//
//  Created by 開発 on 2019/05/01.
//  Copyright © 2019 systena. All rights reserved.
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
//#import <SystemConfiguration/SystemConfiguration.h>
import SystemConfiguration
//
//@interface NCMBReachability : NSObject
//
///**
// シングルトンクラスのインスタンスを返す
// */
//+(NCMBReachability*)sharedInstance;
//
///**
// 指定したhostNameにアクセスできるかを監視するインスタンスを返す
// @param hostName アクセスを確認するホスト名
// */
//- (void)reachabilityWithHostName:(NSString *)hostName;
//
///**
// 電波状況を更新
// */
//+(void)updateFlags:(SCNetworkReachabilityFlags)flags;
//
///**
// 電波状況が変化したときに保存された処理一覧を取得する
// */
//- (void)reachabilityChanged;
//
///**
// 電波状況の監視を開始する
// @return 問題なく開始できた場合はYESを返す
// */
//- (BOOL)startNotifier;
//
///**
// 現在の通信状況を取得する
// @return 通信状況が取得できた場合にtrueを返却する
// */
//- (BOOL)getCurrentReachabilityStatus;
//
///**
// 指定したホスト名にアクセスできる状態かをチェックする
// @return アクセスできる場合はYESを返す
// */
//- (BOOL)isReachableToTarget;
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
//#import "NCMBReachability.h"
//#import "NCMBURLSession.h"
//#import "NCMBConstants.h"
//
//#import <objc/runtime.h>
//#import <arpa/inet.h>
//#import <ifaddrs.h>
//#import <net/if.h>
//
//static NSString *const kHostName = @"mbaas.api.nifcloud.com";
private let kHostName = "mbaas.api.nifcloud.com"
//
///**
// 通信状況が変化した際に呼び出されるコールバックメソッド
// */
//static void ReachabilityCallback(SCNetworkReachabilityRef target,
private func ReachabilityCallback(_ target: SCNetworkReachability,
//                                 SCNetworkReachabilityFlags flags, void* info){
    _ flags: SCNetworkReachabilityFlags, _ info: UnsafeMutableRawPointer?) {
//    //電波状況の更新
//    [NCMBReachability updateFlags:flags];
    NCMBReachability.updateFlags(flags)
//
//    //通信状況に応じてファイルに書き出した処理を実行するメソッドを呼び出す
//    [[NCMBReachability sharedInstance] reachabilityChanged];
    NCMBReachability.shared.reachabilityChanged()
//}
}
//
//@implementation NCMBReachability {
public class NCMBReachability {
//    SCNetworkReachabilityRef internetReachabilityRef;
    private var internetReachabilityRef: SCNetworkReachability?
//    SCNetworkReachabilityFlags internetReachabilityFlags;
    private var internetReachabilityFlags: SCNetworkReachabilityFlags = []
//    SCNetworkReachabilityRef reachabilityRef;
    private var reachabilityRef: SCNetworkReachability?
//    SCNetworkReachabilityFlags reachabilityFlags;
    private var reachabilityFlags: SCNetworkReachabilityFlags = []
//}
//
//static NCMBReachability *ncmbReachability = nil;
    private static var ncmbReachability: NCMBReachability? = nil
//
//static NSObject*_objForLock = nil;
    private static let objForLock = NSObject()
//
//+ (NSObject *)objForLock {
//    if (_objForLock == nil) {
//        _objForLock = [[NSObject alloc] init];
//    }
//    return _objForLock;
//}
//
///**
// APIのエンドポイントを指定して、インターネット接続確認用のリファレンスを作成
// */
//- (NCMBReachability *)init{
    private init() {
//    self->internetReachabilityRef = SCNetworkReachabilityCreateWithName(NULL, [kHostName UTF8String]);
        self.internetReachabilityRef = SCNetworkReachabilityCreateWithName(nil, kHostName)
//    return self;
//}
    }
//
///**
// シングルトンクラスのインスタンスを返す
// */
//+(NCMBReachability*)sharedInstance{
    public static let shared: NCMBReachability = {
//    @synchronized(NCMBReachability.objForLock){
        synchronized(NCMBReachability.objForLock) {
//        if (!ncmbReachability){
            if ncmbReachability == nil {
//            ncmbReachability = [[NCMBReachability alloc] init];
                ncmbReachability = NCMBReachability()
//            [ncmbReachability reachabilityWithHostName:kHostName];
                ncmbReachability!.reachability(hostName: kHostName)
//        }
            }
//    }
        }
//    return ncmbReachability;
        return ncmbReachability!
//}
    }()
//
///**
// 指定したhostNameにアクセスできるかを監視するインスタンスを返す
// @param hostName アクセスを確認するホスト名
// @return ホスト名が指定されたインスタンス
// */
//- (void)reachabilityWithHostName:(NSString *)hostName{
    private func reachability(hostName: String) {
//    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, [hostName UTF8String]);
        if let reachability = SCNetworkReachabilityCreateWithName(nil, hostName) {
//    if (reachability != NULL)
//    {
//        reachabilityRef = reachability;
            reachabilityRef = reachability
//        SCNetworkReachabilityGetFlags(reachabilityRef, &reachabilityFlags);
            SCNetworkReachabilityGetFlags(reachability, &reachabilityFlags)
//    }
        } else {
            print("Failed SCNetworkReachabilityCreateWithName")
        }
//}
    }
//
///**
// 電波状況を更新
// */
//+(void)updateFlags:(SCNetworkReachabilityFlags)flags{
    public static func updateFlags(_ flags: SCNetworkReachabilityFlags) {
//    @synchronized(NCMBReachability.objForLock){
        synchronized(NCMBReachability.objForLock) {
//        [NCMBReachability sharedInstance]->reachabilityFlags = flags;
            NCMBReachability.shared.reachabilityFlags = flags
//    }
        }
//}
    }
//
///**
// 電波状況が変化したときに保存された処理一覧を取得する
// */
//- (void)reachabilityChanged{
    public func reachabilityChanged() {
//    dispatch_queue_t sub_queue = dispatch_queue_create("reachabilityChange", NULL);
        let sub_queue = DispatchQueue(label: "reachabilityChange")
//    dispatch_async(sub_queue, ^{
        sub_queue.async {
//        //ファイルから処理内容を取り出す
//        NSFileManager *fileManager = [NSFileManager defaultManager];
            let fileManager = FileManager.default
            var contents: [String] = []
            do {
//        NSArray *contents = [fileManager contentsOfDirectoryAtPath: COMMAND_CACHE_FOLDER_PATH
                contents = try fileManager.contentsOfDirectory(atPath: COMMAND_CACHE_FOLDER_PATH)
//                                                             error: NULL];
            } catch {
                print(error)
            }
//        //ファイルが無い場合は監視を終了
//        if ([contents count] == 0){
            if contents.isEmpty {
//            @synchronized(NCMBReachability.objForLock){
                synchronized(NCMBReachability.objForLock) {
//                ncmbReachability = nil;
                    NCMBReachability.ncmbReachability = nil
//            }
                }
//        } else {
            } else {
//            for (NSString *fileName in contents){
                for fileName in contents {
//                [self executeCommand:fileName];
                    self.__executeCommand(fileName)
//            }
                }
//        }
            }
//    });
        }
//}
    }
//
///**
// ファイルに書き出された処理を実行する
// ファイル削除後にオフラインになっていた場合はファイル復元を復元する
// */
    ///### 同期的に処理しているが、非mainスレッドからしか呼ばれないので、そのままにしておく
//- (void)executeCommand:(NSString*)fileName{
    private func __executeCommand(_ fileName: String) {
//    //非同期で更新された電波状況を見て、通信可能であればファイルの処理を実行
//    if ([self isReachableToTarget]){
        if self.isReachableToTarget() {
//
//        NSFileManager *fileManager = [[NSFileManager alloc] init];
            let fileManager = FileManager() //### Why not `default`?
//        NSString *filePath = [NSString stringWithFormat:@"%@%@", COMMAND_CACHE_FOLDER_PATH, fileName];
            let filePath = COMMAND_CACHE_FOLDER_PATH + fileName
//        if ([fileManager fileExistsAtPath:filePath]) {
            if fileManager.fileExists(atPath: filePath) {
                let fileURL = URL(fileURLWithPath: filePath)
//
//            //各ファイルから処理内容を取り出す
                do {
//            NSData *data = [NSData dataWithContentsOfFile:filePath];
                    let data = try Data(contentsOf: fileURL)
//            NSDictionary *dictForEventually = [NSKeyedUnarchiver unarchiveObjectWithData:data];
                    let dictForEventually: [String: Any]
                    if #available(iOS 9.0, *) {
                        dictForEventually = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [String: Any]
                    } else {
                        dictForEventually = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String: Any]
                    }
//
//            NSString *url = [dictForEventually objectForKey:@"path"];
                    let url = dictForEventually["path"] as! String
//            NSString *method = [dictForEventually objectForKey:@"method"];
                    let method = dictForEventually["method"] as! String
//            NSDictionary *saveDic = nil;
//            if ([[dictForEventually allKeys] containsObject:@"saveData"]){
//                saveDic = [dictForEventually objectForKey:@"saveData"];
//            }
                    let saveDic = dictForEventually["saveData"] as? [String: Any]
//
//            //ファイルを削除する
//            [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", COMMAND_CACHE_FOLDER_PATH, fileName] error:nil];
                    _ = try? FileManager.default.removeItem(atPath: filePath)
//
//            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                    let semaphore = DispatchSemaphore(value: 0)
//
//            NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:url
                    let request = NCMBRequest(urlString: url,
                                              method: method,
                                              header: nil,
                                              body: saveDic)
//                                                                   method:method
//                                                                   header:nil
//                                                                     body:saveDic];
//            // 通信
//            NSError __block *sessionError = nil;
                    var sessionError: NSError? = nil
//            NCMBURLSession *session = [[NCMBURLSession alloc] initWithRequestSync:request];
                    let session = NCMBURLSession(__requestSync: request)
//            [session dataAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
                    session.dataAsyncConnection {result in
                        switch result {
//                if (requestError){
                        case .failure(let requestError):
//                    sessionError = requestError;
                            sessionError = requestError as NSError
                        default:
                            break
//                }
                        }
//                dispatch_semaphore_signal(semaphore);
                        semaphore.signal()
//            }];
                    }
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
                    semaphore.wait()
//
//            if(sessionError){
                    if sessionError?.code == NSURLErrorNotConnectedToInternet ||
                        sessionError?.code == NSURLErrorNetworkConnectionLost {
//                if (sessionError.code == NSURLErrorNotConnectedToInternet || sessionError.code == NSURLErrorNetworkConnectionLost){
//                    //オフライン時はファイルを復元する
//                    [data writeToFile:[NSString stringWithFormat:@"%@%@", COMMAND_CACHE_FOLDER_PATH, fileName] options:NSDataWritingAtomic error:nil];
                        _ = try? data.write(to: fileURL)
//                }
                    }
//            }
                } catch {
                    print(error)
                }
//        }
            }
//    }
        }
//}
    }
//
///**
// 電波状況の監視を開始する
// @return 問題なく開始できた場合はYESを返す
// */
//- (BOOL)startNotifier
//{
    @discardableResult
    public func startNotifier() -> Bool {
//    BOOL returnValue = NO;
        var returnValue: Bool = false;
//    SCNetworkReachabilityContext context = {0, (__bridge void *)(self), NULL, NULL, NULL};
        var context = SCNetworkReachabilityContext(version: 0, info: Unmanaged.passRetained(self).toOpaque(), retain: nil, release: nil, copyDescription: nil)
//
//    //電波状況が変化したときに呼び出されるコールバックを指定する
//    if (SCNetworkReachabilitySetCallback(reachabilityRef, ReachabilityCallback, &context))
//    {
        if SCNetworkReachabilitySetCallback(reachabilityRef!, ReachabilityCallback, &context) {
//        //電波状況の監視をスタートさせる
//        if (SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode))
//        {
            if SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef!, CFRunLoopGetCurrent(), CFRunLoopMode.defaultMode.rawValue) {
//            returnValue = YES;
                returnValue = true
//        }
            }
//    }
        }
//
//    return returnValue;
        return returnValue
//}
    }
//
//- (void)stopNotifier
//{
    private func stopNotifier() {
//    if (reachabilityRef != NULL)
//    {
        if let reachabilityRef = reachabilityRef {
//        SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef,
            SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef,
                                                       
//                                                   CFRunLoopGetCurrent(),
                CFRunLoopGetCurrent(),
//                                                   kCFRunLoopDefaultMode);
                CFRunLoopMode.defaultMode.rawValue)
//    }
        }
//}
    }
//
///**
// 現在の通信状況を取得する
// @return 通信状況が取得できた場合にtrueを返却する
// */
//- (BOOL)getCurrentReachabilityStatus{
    @discardableResult
    public func getCurrentReachabilityStatus() -> Bool {
//    //名前解決できるかをチェック
//    if (SCNetworkReachabilityGetFlags(internetReachabilityRef, &internetReachabilityFlags)){
        if
            let internetReachability = internetReachabilityRef,
            SCNetworkReachabilityGetFlags(internetReachability, &internetReachabilityFlags)
        {
//        //ターゲットへの接続状況を取得
//        if ((internetReachabilityFlags & kSCNetworkReachabilityFlagsReachable) != 0){
            if internetReachabilityFlags.contains(.reachable) {
//            return SCNetworkReachabilityGetFlags(reachabilityRef, &reachabilityFlags);
                return reachabilityRef != nil
                    && SCNetworkReachabilityGetFlags(reachabilityRef!, &reachabilityFlags)
//        } else {
            } else {
//            return NO;
                return false
//        }
            }
//    }
        }
//    return NO;
        return false
//
//}
    }
//
///**
// 指定したホスト名にアクセスできる状態かをチェックする
// @return アクセスできる場合はYESを返す
// */
//- (BOOL)isReachableToTarget{
    public func isReachableToTarget() -> Bool {
//
//    if ((reachabilityFlags & kSCNetworkReachabilityFlagsReachable ) != 0)
//    {
        if reachabilityFlags.contains(.reachable) {
//        //ターゲットへのアクセスが可能である場合
//        if ((reachabilityFlags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
//        {
            if !reachabilityFlags.contains(.connectionRequired) {
//            //ターゲットへのコネクションが
//            return YES;
                return true
//        }
            }
//    }
        }
//
//    return NO;
        return false
//}
    }
//
//@end
}
