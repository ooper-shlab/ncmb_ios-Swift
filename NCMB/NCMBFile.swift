//
//  NCMBFile.swift
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
import Foundation
//#import <MobileCoreServices/MobileCoreServices.h>
import MobileCoreServices
//#import "NCMBObject.h"
////#import "NCMBSubclassing.h"
//
//@class NCMBQuery;
//@class NCMBACL;
//
//
///**
// NCMBFileクラスは、ニフクラ mobile backend上でアプリに必要な画像や動画、様々なバイナリデータを管理するクラスです。
//
// このクラスはNCMBObjectを継承していますが、REST APIでファイルクラスのフィールド更新ができないため、
// setObject:forKey: や addObject:forKey: などは対応していません。
// 対応していないメソッドは以下の通りです。
//
//    relationForKey:
//    addObject:forKey:
//    addObjectsFromArray:forKey:
//    addUniqueObject:forKey:
//    addUniqueObjectsFromArray:forKey:
//    removeObject:forKey:
//    removeObjectsInArray:forKey:
//    removeObjectForKey:
//    incrementKey:
//    incrementKey:byAmount:
//    saveEventually:
//    refresh:
//    refreshInBackgroundWithBlock:
//    refreshInBackgroundWithTarget:selector:
//    fetch:
//    fetchInBackgroundWithBlock:
//    fetchInBackgroundWithTarget:selector:
//    deleteEventually:
//
// */
//@interface NCMBFile : NCMBObject
public class NCMBFile: NCMBObject {
//
///** @name Properties */
//
///// ファイル名
//@property (readonly) NSString *name;
    private(set) public var name: String?
//
///// ファイルを取得するためのURL
//@property (readonly) NSString *url;
    private(set) public var url: String?
//
//
///** @name Create */
//
///**
// 指定したデータ(NSData)を持つNCMBFileのインスタンスを生成
// @param data 指定するデータ(NSData)
// @return id型 NCMBFileのインスタンス
// */
//+ (id)fileWithData:(NSData *)data;
//
///**
// 指定したファイル名とデータ(NSData)を持つNCMBFileのインスタンスを生成
// @param name 指定するファイル名
// @param data 指定するデータ(NSData)
// @return id型 NCMBFileのインスタンス
// */
//+ (id)fileWithName:(NSString *)name data:(NSData *)data;
//
///**
// 指定したファイルパスで取得したデータと指定したファイル名を持つNCMBFileのインスタンスを生成
// @param name 指定するファイル名
// @param path 指定するファイルパス
// @return id型 NCMBFileのインスタンス
// */
//+ (id)fileWithName:(NSString *)name
//    contentsAtPath:(NSString *)path;
//
//
///// 指定したファイルがサーバ上と同じ内容かどうかを判断。変更があった場合や、生成のみで未保存状態の場合はtrueを返す。サーバにsave済の場合はfalseを返す。
//@property (readonly) BOOL isDirty;
    private(set) public var isDirty: Bool = false
//
//
///** @name Save */
//
///**
// データを非同期で保存。保存の進度により定期的にprogressBlockを呼び出し、100パーセントに達し保存がし終わったらblockを呼び出す。
// @param block 保存完了後に実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NSError *error）<br/>errorにはエラーがあればエラーのポインタが渡され、なければnilが渡される。
// @param progressBlock 保存進度により定期的に実行されるblock。blockは次の引数のシグネチャを持つ必要がある（int percentDone）
// */
//- (void)saveInBackgroundWithBlock:(NCMBErrorResultBlock)block
//                    progressBlock:(NCMBProgressBlock)progressBlock;
//
//
///** @name Get */
//
///// データがあるかどうかを判断。データがあればtrueを返す。
//@property (readonly) BOOL isDataAvailable;
    private(set) public var isDataAvailable: Bool = false
//
///**
// データの取得。必要があればエラーをセットし、取得することもできる。
// @param error 処理中に起きたエラーのポインタ
// @return NSData型 取得データ
// */
//- (NSData *)getData:(NSError **)error;
//
///**
// データを非同期で取得。取得し終わったら与えられたblockを呼び出す。
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NSData *data, NSError *error）
// resultには取得したデータが渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)getDataInBackgroundWithBlock:(NCMBDataResultBlock)block;
//
///**
// データを非同期で取得。取得の進度により定期的にprogressBlockを呼び出し、100パーセントに達し取得し終わったらresultBlockを呼び出す。
// @param resultBlock 取得完了後に実行されるblock。resultBlockは次の引数のシグネチャを持つ必要がある（NSData *data, NSError *error）
// @param progressBlock 取得進度により定期的に実行されるblock。progressBlockは次の引数のシグネチャを持つ必要がある（int percentDone）
// */
//- (void)getDataInBackgroundWithBlock:(NCMBDataResultBlock)resultBlock
//                       progressBlock:(NCMBProgressBlock)progressBlock;
//
///**
// データを非同期で取得。取得し終わったら指定されたコールバックを呼び出す。
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。 (void)callbackWithResult:(NSData *)result error:(NSError **)error
// resultには取得したデータが渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)getDataInBackgroundWithTarget:(id)target selector:(SEL)selector;
//
//
///** @name Transfer */
//
//
///**
// 通信のキャンセルを行う
// */
//- (void)cancel;
//
//
///** @name Query */
//
///**
// ファイルを検索するためのNCMBQueryを生成
// @return NCMBQueryのインスタンス
// */
//+ (NCMBQuery *)query;
//
//#pragma mark - Unsupported
//
//-(void)refresh:(NSError **)error __attribute__((deprecated));
//-(void)refreshInBackgroundWithBlock:(NCMBObjectResultBlock)block __attribute__((deprecated));
//-(void)refreshInBackgroundWithTarget:(id)target selector:(SEL)selector __attribute__((deprecated));
//-(void)fetch:(NSError **)error __attribute__((deprecated));
//-(NCMBRelation *)relationForKey:(NSString *)key __attribute__((deprecated));
//-(void)addObject:(id)object forKey:(NSString *)key __attribute__((deprecated));
//-(void)addObjectsFromArray:(NSArray *)objects forKey:(NSString *)key __attribute__((deprecated));
//-(void)addUniqueObject:(id)object forKey:(NSString *)key __attribute__((deprecated));
//-(void)addUniqueObjectsFromArray:(NSArray *)objects forKey:(NSString *)key __attribute__((deprecated));
//-(void)removeObject:(id)object forKey:(NSString *)key __attribute__((deprecated));
//-(void)removeObjectsFromArray:(NSArray *)objects forKey:(NSString *)key __attribute__((deprecated));
//-(void)removeObjectForKey:(NSString *)key __attribute__((deprecated));
//-(void)incrementKey:(NSString *)key __attribute__((deprecated));
//-(void)incrementKey:(NSString *)key byAmount:(NSNumber *)amount __attribute__((deprecated));
//-(void)saveEventually:(NCMBErrorResultBlock)callback __attribute__((deprecated));
//-(void)deleteEventually:(NCMBErrorResultBlock)callback __attribute__((deprecated));
//
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
//#import "NCMBFile.h"
//#import "NCMBObject+Private.h"
//#import "NCMBACL.h"
//#import "NSDataBase64Encode.h"
//#import "NCMBQuery.h"
//#import "NCMBURLSession.h"
//#import "NCMBDateFormat.h"
//
//#pragma mark - url
//#define URL_FILE @"files"
    private let URL_FILE = "files"
//#define URL_PATH @"https://mbaas.api.nifcloud.com/2013-09-01/"
    private let URL_PATH = "https://mbaas.api.nifcloud.com/2013-09-01/"
//
//@interface NCMBFile(){
//    NCMBURLSession *session;
    private var session: NCMBURLSession?
//    dispatch_semaphore_t semaphore;
    private var __semaphore: DispatchSemaphore?
//}
//
//@property (nonatomic,strong) NSData *file;
    private var file: Data?
//
//@end
//
//@implementation NCMBFile
//static NSMutableData *resultData = nil;
    private static var resultData: Data? = nil
//
//#pragma mark - UnsupportedOperationException
////非推奨メソッド
//-(void)refresh:(NSError **)error {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
//}
//-(void)refreshInBackgroundWithBlock:(NCMBObjectResultBlock)block {
    public override func refreshAsync(block: NCMBErrorResultBlock?) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)refreshInBackgroundWithTarget:(id)target selector:(SEL)selector {
    public override func refreshAsync(target: AnyObject, selector: Selector) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)fetch:(NSError **)error {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
//}
//-(void)fetchInBackgroundWithBlock:(NCMBErrorResultBlock)block {
    public override func fetchAsync(block: NCMBErrorResultBlock?) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)fetchInBackgroundWithTarget:(id)target selector:(SEL)selector {
    public override func fetchAsync(target: AnyObject, selector: Selector) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)deleteEventually:(NCMBErrorResultBlock)callback{
    public override func deleteEventually(_ callback: NCMBErrorResultBlock?) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(NCMBRelation *)relationForKey:(NSString *)key{
    public override func relation(forKey key: String) -> NCMBRelation {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//    return nil;
//}
    }
//-(void)addObject:(id)object forKey:(NSString *)key{
    public override func addObject(_ object: Any, forKey key: String) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)addObjectsFromArray:(NSArray *)objects forKey:(NSString *)key{
    public override func addObjects(from objects: [Any], forKey key: String) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)addUniqueObject:(id)object forKey:(NSString *)key{
    public override func addUniqueObject(_ object: Any, forKey key: String) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)addUniqueObjectsFromArray:(NSArray *)objects forKey:(NSString *)key{
    public override func addUniqueObjects(from objects: [Any], forKey key: String) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)removeObject:(id)object forKey:(NSString *)key{
    public override func removeObject(_ object: Any, forKey key: String) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)removeObjectsFromArray:(NSArray *)objects forKey:(NSString *)key{
    public override func removeObjects(in objects: [Any], forKey key: String) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)removeObjectForKey:(NSString *)key{
    public override func removeObject(forKey key: String) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)incrementKey:(NSString *)key{
    public override func increment(key: String) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)incrementKey:(NSString *)key byAmount:(NSNumber *)amount{
    public override func increment(key: String, by amount: NSNumber) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//-(void)saveEventually:(NCMBErrorResultBlock)callback{
    public override func saveEventually(_ callback: NCMBErrorResultBlock?) {
//    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UnsupportedOperation." userInfo:nil] raise];
        fatalError("UnsupportedOperation.")
//}
    }
//
//#pragma mark - init
//
///**
// 指定したファイルパスで取得したデータと指定したファイル名を持つNCMBFileのインスタンスを生成
// @param name 指定するファイル名
// @param path 指定するファイルパス
// */
//+ (id)fileWithName:(NSString *)name
//    contentsAtPath:(NSString *)path{
    ///Do NOT use this method
    public static func __file(name: String, contentsAtPath path: String) -> NCMBFile? {
        fatalError("\(#function): Sync methods not supported")
//    NCMBFile *file = [NCMBFile fileWithName:path data:nil];
        let file = NCMBFile.file(name: path, data: nil)
//    NSError *error = nil;
        let data: Data
        do {
//    NSData *data = [file getData:&error];
            data = try file.__getData()
//    if (error) {
        } catch {
//        return nil;
            return nil
        }
//    }else{
//        NCMBFile *returnFile = [NCMBFile fileWithName:name data:data];
        let returnFile = NCMBFile.file(name: name, data: data)
//        return returnFile;
        return returnFile
//    }
//}
    }
//
//
///**
// 指定したデータ(NSData)を持つNCMBFileのインスタンスを生成
// @param data 指定するデータ(NSData)
// @return id型 NCMBFile
// */
//+ (id)fileWithData:(NSData *)data{
    public static func file(data: Data) -> NCMBFile {
//    NCMBFile *file = [[NCMBFile alloc] initWithClassName:@"file"];
        let file = NCMBFile(className: "file")
//    file.file = data;
        file.file = data
//    [file privateSetIsDirty:TRUE];
        file.isDirty = true
//    [file privateSetName:[NCMBFile uniqueTagFromObject]];
        file.privateSetName(NCMBFile.uniqueTagFromObject())
//    return file;
        return file
//}
    }
//
//- (instancetype)init{
    public convenience required init() {
//    return [self initWithClassName:@"file"];
        self.init(className: "file")
//}
    }
//
///**
// 指定したファイル名とデータ(NSData)を持つNCMBFileのインスタンスを生成
// @param name 指定するファイル名
// @param data 指定するデータ(NSData)
// @return id型 NCMBFile
// */
//+ (id)fileWithName:(NSString *)name data:(NSData *)data{
    public static func file(name: String, data: Data?) -> NCMBFile {
//    NCMBFile *file = [[NCMBFile alloc] init];
        let file = NCMBFile()
//    file.file = data;
        file.file = data
//    [file privateSetName:name];
        file.privateSetName(name)
//    [file privateSetIsDirty:YES];
        file.isDirty = true
//    return file;
        return file
//}
    }
//
//#pragma mark - property
//
///**
// プロパティnameにファイル名を設定する
// @param strName ファイル名
// */
//-(void)privateSetName:(NSString *)strName{
    private func privateSetName(_ strName: String) {
//    if (_name != strName) {
        if name != strName {
//        _name = strName;
            name = strName
//        [self setObject:strName forKey:@"fileName"];
            self.setObject(strName, forKey: "fileName")
//    }
        }
//}
    }
//
///**
// プロパティurlに通信成功時のパスを設定する
// @param strURL url
// */
//-(void)privateSetURL:(NSString *)strURL{
//    if (_url != strURL) {
//        _url = strURL;
//    }
//}
//
///**
// fileの保存状態を取得する
// @param flag YES=未保存,NO=保存済
// */
//-(void)privateSetIsDirty:(BOOL)flag{
//    _isDirty = flag;
//}
//
//#pragma mark - save
//
///**
// データを非同期で保存。保存の進度により定期的にprogressBlockを呼び出し、100パーセントに達し保存がし終わったらblockを呼び出す。
// @param block 保存完了後に実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NSError *error）
// errorにはエラーがあればエラーのポインタが渡され、なければnilが渡される。
// @param progressBlock 保存進度により定期的に実行されるblock。blockは次の引数のシグネチャを持つ必要がある（int percentDone）
// */
//- (void)saveInBackgroundWithBlock:(NCMBErrorResultBlock)block
    public func saveAsync(block: NCMBErrorResultBlock?,
//                    progressBlock:(NCMBProgressBlock)progressBlock{
        progressBlock: NCMBProgressBlock?) {
//
//    //リクエスト作成
//    NSError *e = nil;
//    NSMutableDictionary *operation = [self beforeConnection];
        guard let operation = self.beforeConnection() else {
            fatalError("operation is nil")
        }
//    NCMBRequest *request = [self createRequest:operation error:&e];
        let request = try! self.createRequest(operation)
//
//    // 通信
//    session = [[NCMBURLSession alloc] initWithProgress:request progress:progressBlock];
        session = NCMBURLSession(request, progress: progressBlock)
//    [session fileUploadAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
        session?.fileUploadAsyncConnection {result in
//        if (requestError){
            switch result {
            case .failure(let requestError):
//            [self mergePreviousOperation:operation];
                self.mergePreviousOperation(operation)
                block?(requestError)
//        } else {
            case .success(let responseData):
//            [self afterSave:responseData operations:operation];
                self.afterSave(responseData as! [String : Any], operations: operation)
//        }
//
//        // コールバック実行
//        [self executeUserCallback:block error:requestError];
                block?(nil)
            }
//
//    }];
        }
//}
    }
//
//
//
//#pragma mark - get
//
///**
// データの取得。必要があればエラーをセットし、取得することもできる。
// @param error 処理中に起きたエラーのポインタ
// @return NSData型 取得データ
// */
    ///Do NOT use this method.
//- (NSData *)getData:(NSError **)error{
    private func __getData() throws -> Data {
        fatalError("\(#function): Sync methods not supported")
//    semaphore = dispatch_semaphore_create(0);
        __semaphore = DispatchSemaphore(value: 0)
//    NSError __block *sessionError = nil;
        var sessionError: Error? = nil
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:[NSString stringWithFormat:@"%@/%@",URL_FILE,self.name]
        let request = NCMBRequest(urlString: "\(URL_FILE)/\(self.name!)",
            method: "GET",
            header: nil,
            body: nil)
//                                                           method:@"GET"
//                                                           header:nil
//                                                             body:nil];
//
//    session = [[NCMBURLSession alloc] initWithRequestSync:request];
        session = NCMBURLSession(__requestSync: request)
//    [session fileDownloadAsyncConnectionWithBlock:^(NSData *responseData, NSError *requestError){
        session!.fileDownloadAsyncConnection {result in
            switch result {
//        if (requestError){
            case let .failure(requestError):
//            sessionError = requestError;
                sessionError = requestError
//        }else{
            case let .success(responseData as Data):
//            self.file = responseData;
                self.file = responseData
//            [self privateSetIsDirty:NO];
                self.isDirty = false
//        }
            default:
                fatalError("Unexpectd result: \(result)")
            }
//        dispatch_semaphore_signal(semaphore);
            self.__semaphore?.signal()
//    }];
        }
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        _ = __semaphore?.wait(timeout: .distantFuture)
//
//    if(error){
//        *error = sessionError;
        if sessionError != nil {throw sessionError!}
//    }
//    return self.file;
        return self.file!
//}
    }
//
///**
// データを非同期で取得。取得し終わったら指定されたコールバックを呼び出す。
// @param target 呼び出すセレクタのターゲット
// @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。 (void)callbackWithResult:(NSData *)result error:(NSError **)error
// resultには取得したデータが渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)getDataInBackgroundWithTarget:(id)target selector:(SEL)selector{
    public func getDataAsync(target: AnyObject, selector: Selector) {
//    NSMethodSignature* signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//    [self getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        self.getDataAsync{result in
//        [invocation setArgument:&data atIndex:2];
//        [invocation setArgument:&error atIndex:3];
//        [invocation invoke];
            switch result {
            case .success(let data):
                _ = target.perform(selector, with: data, with: nil)
            case .failure(let error):
                _ = target.perform(selector, with: nil, with: error as NSError)
            }
//    }progressBlock:nil];
        }
//}
    }
//
///**
// データを非同期で取得。取得し終わったら与えられたblockを呼び出す。
// @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NSData *data, NSError *error）
// resultには取得したデータが渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
// */
//- (void)getDataInBackgroundWithBlock:(NCMBDataResultBlock)block{
    public func getDataAsync(block: @escaping NCMBDataResultBlock) {
//    [self getDataInBackgroundWithBlock:block progressBlock:nil];
        self.getDataAsync(block: block, progressBlock: nil)
//}
    }
//
///**
// データを非同期で取得。取得の進度により定期的にprogressBlockを呼び出し、100パーセントに達し取得し終わったらresultBlockを呼び出す。
// @param resultBlock 取得完了後に実行されるblock。resultBlockは次の引数のシグネチャを持つ必要がある（NSData *data, NSError *error）
// @param progressBlock 取得進度により定期的に実行されるblock。progressBlockは次の引数のシグネチャを持つ必要がある（int percentDone）
// */
//- (void)getDataInBackgroundWithBlock:(NCMBDataResultBlock)resultBlock
    public func getDataAsync(block resultBlock: NCMBDataResultBlock?,
                                    progressBlock: NCMBProgressBlock?) {
//                       progressBlock:(NCMBProgressBlock)progressBlock{
//
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURLString:[NSString stringWithFormat:@"%@/%@",URL_FILE,self.name]
        guard let path = self.name else {
            fatalError("self.name is nil")
        }
        let request = NCMBRequest(urlString: "\(URL_FILE)/\(path)",
            method: "GET",
            header: nil,
            body: nil)
//                                                           method:@"GET"
//                                                           header:nil
//                                                             body:nil];
//
//    session = [[NCMBURLSession alloc] initWithProgress:request progress:progressBlock];
        session = NCMBURLSession(request, progress: progressBlock)
//    [session fileDownloadAsyncConnectionWithBlock:^(NSData *responseData, NSError *requestError){
        session?.fileDownloadAsyncConnection {result in
            var callbackResult: Result<Data,Error>
//        if (!requestError){
            switch result {
            case .success(let responseData as Data):
//            self.file = responseData;
                self.file = responseData
//            [self privateSetIsDirty:NO];
                self.isDirty = false
                callbackResult = .success(responseData)
//        }
            case .failure(let error):
                callbackResult = .failure(error)
            default:
                fatalError("unexpected result: \(result)")
            }
//
//        // コールバック実行
//        if(resultBlock){
//            resultBlock(self.file,requestError);
            resultBlock?(callbackResult)
//        }
//    }];
        }
//}
    }
//
//#pragma mark - create
//
///**
// ファイル名をTimeStampとUUIDをエンコードした文字列で生成する
// @return NSString型 エンコードされた文字列
// */
//+(NSString*) uniqueTagFromObject{
    private static func uniqueTagFromObject() -> String {
//    NSData *data =[[NSString stringWithFormat:@"%@%@",[NCMBFile getTimeStamp],[NCMBFile getUUID]] dataUsingEncoding:NSUTF8StringEncoding];
        let data = "\(NCMBFile.getTimeStamp())\(NCMBFile.getUUID())".data(using: .utf8)!
//    return [NSString stringWithFormat:@"%@",[NSDataBase64Encode stringEncodedWithBase64:data]];
        return data.base64EncodedString()
//}
    }
//
///**
// タイムスタンプを生成する
// @return NSString型 タイムスタンプ
// */
//+(NSString*) getTimeStamp{
    private static func getTimeStamp() -> String {
//    return [[NCMBDateFormat getFileNameDateFormat] stringFromDate:[NSDate date]];
        return NCMBDateFormat.getFileNameDateFormat().string(from: Date())
//}
    }
//
///**
// UUIDを生成する
// @return NSString型 UUID
// */
//+(NSString*) getUUID {
    private static func getUUID() -> String {
//    CFUUIDRef uuidObj = CFUUIDCreate(nil);
        let uuidObj = UUID()
//    NSString *uuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
        let uuidString = uuidObj.uuidString
//    CFRelease(uuidObj);
//    return uuidString;
        return uuidString
//}
    }
//
//- (NSMutableData*)createBody:(NSMutableDictionary*)operation
    private func createBody(_ operation: NCMBOperationSet) throws -> Data {
//                       error:(NSError**)error{
//    NSMutableDictionary *ncmbDic = [self convertToJSONDicFromOperation:operation];
        var ncmbDic = self.convertToJSONDicFromOperation(operation)
//    //fileは履歴管理していないため直接設定する
//    if(self.file){
        if let data = self.file {
//        [ncmbDic setObject:self.file forKey:@"file"];
            ncmbDic["file"] = data
//    }
        }
//
//    NSMutableData *body = [[NSMutableData alloc] init];
        var body: Data = Data()
//    NSError *convertError = nil;
//
//    //未保存の場合は登録、保存済みの場合は更新処理を行う
//    if (self.isDirty){
        if self.isDirty {
//        //POSTはmultipart/form-dataの形で通信を行う
//        NSMutableDictionary *jsonDic = [self convertToJSONFromNCMBObject:ncmbDic];
            guard var jsonDic = self.convertToJSONFromNCMBObject(ncmbDic) as? [String: Any] else {
                return Data()
            }
//
//        //ファイル名、mimeTypeの作成
//        NSData* data = [jsonDic objectForKey:@"file"];
            let data = jsonDic["file"] as? Data ?? Data()
//        NSString* fileName = [jsonDic objectForKey:@"fileName"];
            let fileName = jsonDic["fileName"] as? String ?? "no-name"
//        NSString* mimeType = [NCMBFile mimeTypeForFileName:fileName];
            let mimeType = NCMBFile.mimeType(forFileName: fileName)
            
//        [jsonDic removeObjectForKey:@"file"];
            jsonDic["file"] = nil
//        [jsonDic removeObjectForKey:@"fileName"];
            jsonDic["fileName"] = nil
//
//        NSString *boundary = @"_NCMBProjectBoundary";
            let boundary = "_NCMBProjectBoundary"
//        //aclのform-dataを作成
//        if ([[jsonDic allKeys] count]>0) {
            if !jsonDic.isEmpty {
//            for (NSString *key in [jsonDic allKeys]) {
                for (key, value) in jsonDic {
//                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                    body.append("--\(boundary)\r\n".data(using: .utf8)!)
//                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n\r\n", key,key] dataUsingEncoding:NSUTF8StringEncoding]];
                    body.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
//                [body appendData:[NSJSONSerialization dataWithJSONObject:[jsonDic objectForKey:key] options:kNilOptions error:&convertError]];
                    body.append(try JSONSerialization.data(withJSONObject: value))
//                if (convertError){
//                    return nil;
//                }
//                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                    body.append("\r\n".data(using: .utf8)!)
//            }
                }
//        }
            }
//        //fileのform-dataを作成
//        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", @"file",fileName] dataUsingEncoding:NSUTF8StringEncoding]];
            body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
//        [body appendData:[[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n",mimeType] dataUsingEncoding:NSUTF8StringEncoding]];
            body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
//        [body appendData:data];
            body.append(data)
//        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            body.append("\r\n".data(using: .utf8)!)
//        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            body.append("--\(boundary)--\r\n\r\n".data(using: .utf8)!)
//        if (convertError){
//            return nil;
//        }
//    } else {
        } else {
//        //PUTはapplication/jsonなのでaclのみ取り出し、通常の通信と同様に更新する
//        NSMutableDictionary *aclDic = [NSMutableDictionary dictionary];
            var aclDic: [String: Any] = [:]
//        if([ncmbDic objectForKey:@"acl"]){
            if let acl = ncmbDic["acl"] {
//            [aclDic setObject:[ncmbDic objectForKey:@"acl"] forKey:@"acl"];
                aclDic["acl"] = acl
//        }
            }
//
//        NSMutableDictionary *jsonDic = [self convertToJSONFromNCMBObject:aclDic];
            let jsonDic = self.convertToJSONFromNCMBObject(aclDic)
//        body = (NSMutableData*)[NSJSONSerialization dataWithJSONObject:jsonDic options:kNilOptions error:&convertError];
            body = try JSONSerialization.data(withJSONObject: jsonDic)
//        if (convertError){
//            return nil;
//        }
//    }
        }
//    return body;
        return body
//}
    }
//
//
///**
// 拡張子に合わせてmineTypeを生成する
// @param fileName ファイル名
// @return NSString型 mineType
// */
//+ (NSString*) mimeTypeForFileName: (NSString *) fileName {
    private static func mimeType(forFileName fileName: String?) -> String {
//    NSString * path = [[fileName componentsSeparatedByString:@"."] lastObject];
        let path = fileName?.components(separatedBy: ".").last
//
//    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)path, NULL);
        let utiUnmanaged = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, path! as CFString, nil)
        let uti = utiUnmanaged?.takeRetainedValue()
//    CFStringRef mimeType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
        let mimeTypeUnmanaged = UTTypeCopyPreferredTagWithClass(uti!, kUTTagClassMIMEType)
        let mimeType = mimeTypeUnmanaged?.takeRetainedValue() as String?
//
//    CFRelease(UTI);
//    NSString* resultStr = (__bridge NSString *)(mimeType);
        let resultStr = mimeType
//    if (!mimeType) {
        if mimeType == nil {
//
//        return @"application/octet-stream";
            return "application/octet-stream"
//    }
        }
//    CFRelease(mimeType);
//    return resultStr;
        return resultStr!
//}
    }
//
///**
// ファイル取得のURL及びファイル名の設定を行う
// @param response REST APIのレスポンスデータ
// */
//-(void)privateSetNameAndURL:(NSDictionary *)response{
    private func privateSetNameAndURL(_ response: [String: Any]) {
//    if ([response objectForKey:@"fileName"]) {
        if let fileName = response["fileName"] as? String {
//        [self privateSetName:[response objectForKey:@"fileName"]];
            self.name = fileName
//        NSString *strPath = [NSString stringWithFormat:@"%@/%@",URL_FILE,[response objectForKey:@"fileName"]];
            let strPath = "\(URL_FILE)/\(fileName)"
//        [self privateSetURL:[NSString stringWithFormat:@"%@%@",URL_PATH,strPath]];
            self.url = "\(URL_PATH)\(strPath)"
//    }
        }
//}
    }
//
//#pragma mark - cancel
///**
// 通信が行われていた場合に通信のキャンセルを行う
// */
//- (void)cancel{
    public func cancel() {
//    if (session.uploadTask !=nil && session.uploadTask.state == NSURLSessionTaskStateRunning) {
        if let uploadTask = session?.uploadTask, uploadTask.state == .running {
//        [session.uploadTask cancel];
            uploadTask.cancel()
//    } else if (session.downloadTask !=nil && session.downloadTask.state == NSURLSessionTaskStateRunning){
        } else if let downloadTask = session?.downloadTask, downloadTask.state == .running {
//        [session.downloadTask cancel];
            downloadTask.cancel()
//    }
        }
//}
    }
//
//#pragma mark - query
//
//+ (NCMBQuery *)query{
    public override static func query() -> NCMBQuery {
//    return [NCMBQuery queryWithClassName:@"file"];
        return NCMBQuery(className: "file")
//}
    }
//
//
//#pragma mark - override
//
///**
// mobile backendにオブジェクトを保存する
// @param error エラーを保持するポインタ
// */
///Do NOT use thid method
//- (void)save:(NSError **)error{
    public override func __save() throws {
        fatalError("\(#function): Sync methods not supported")
//    semaphore = dispatch_semaphore_create(0);
//
//    //リクエスト作成
//    NSError __block *sessionError = nil;
//    NSMutableDictionary *operation = [self beforeConnection];
//    NCMBRequest *request = [self createRequest:operation error:&sessionError];
//    if(sessionError){
//        if(error){
//            *error = sessionError;
//        }
//        return;
//    }
//
//    // 通信
//    session = [[NCMBURLSession alloc] initWithRequestSync:request];
//    [session fileUploadAsyncConnectionWithBlock:^(NSDictionary *responseData, NSError *requestError){
//        if (requestError){
//            //通信エラー or mbエラー
//            [self mergePreviousOperation:operation];
//            sessionError = requestError;
//        } else {
//            [self afterSave:responseData operations:operation];
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
// mobile backendにfileを保存する。非同期通信を行う。
// @param userBlock 通信後に実行されるblock。引数にNSError *errorを持つ。
// */
//- (void)saveInBackgroundWithBlock:(NCMBErrorResultBlock)userBlock{
    public override func saveAsync(block userBlock: NCMBErrorResultBlock?) {
//    [self saveInBackgroundWithBlock:userBlock progressBlock:nil];
        self.saveAsync(block: userBlock, progressBlock: nil)
//}
    }
//
///**
// fileをmobile backendとローカル上から削除する
// @param error エラーを保持するポインタを保持するポインタ
// */
    ///Do NOT use this method.
//- (void)delete:(NSError**)error{
    public override func __delete() throws {
        fatalError("\(#function): Sync methods not supported")
//    if (_name){
//        NSString *url = [NSString stringWithFormat:@"%@/%@",URL_FILE,self.name];
//        [self delete:url error:error];
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
// fileをmobile backendとローカル上から削除する。非同期通信を行う。
// @param userBlock 通信後に実行されるblock。引数にBOOL succeeded, NSError *errorを持つ。
// */
//- (void)deleteInBackgroundWithBlock:(NCMBErrorResultBlock)userBlock{
    public override func deleteAsync(block userBlock: NCMBErrorResultBlock?) {
//    if (_name){
        if let name = self.name {
//        NSString *url = [NSString stringWithFormat:@"%@/%@",URL_FILE,self.name];
            let url = "\(URL_FILE)/\(name)"
//        [self deleteInBackgroundWithBlock:url block:userBlock];
            self.deleteAsync(url, block: userBlock)
//    } else {
        } else {
//        if (userBlock){
            if let userBlock = userBlock {
//            NSError *localError = [NSError errorWithDomain:ERRORDOMAIN
                let localError = NSError(domain: ERRORDOMAIN,
                                         code: 400003,
                                         userInfo: [NSLocalizedDescriptionKey: "objectId is empty."])
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
//+(id)object{
    public override static func object() -> NCMBObject {
//    return [[NCMBFile alloc] init];
        return NCMBFile()
//}
    }
//
//+(NSString *)ncmbClassName{
    public static var ncmbClassName: String {
//    return @"file";
        return "file"
//}
    }
//
///**
// オブジェクト更新後に操作履歴とestimatedDataを同期する
// @param response REST APIのレスポンスデータ
// @param operations 同期する操作履歴
// */
//-(void)afterSave:(NSDictionary*)response operations:(NSMutableDictionary*)operations{
    override func afterSave(_ response: [String : Any], operations: NCMBOperationSet?) {
//    //NCMBFileのレスポンス処理
//    [self privateSetNameAndURL:response];
        self.privateSetNameAndURL(response)
//    [self privateSetIsDirty:NO];
        self.isDirty = false
//    //通常のレスポンス処理
//    [super afterSave:response operations:operations];
        super.afterSave(response, operations: operations)
//}
    }
//
///**
// ファイル情報取得時にACLを変換し、保存済みファイルであることを設定する
// */
//- (void)afterFetch:(NSMutableDictionary *)response isRefresh:(BOOL)isRefresh{
    public override func afterFetch(_ response: [String : Any], isRefresh: Bool) {
//    self.ACL = [NCMBACL ACL];
        self.acl = NCMBACL()
//    self.ACL.dicACL = [NSMutableDictionary dictionaryWithDictionary:[response objectForKey:@"acl"]];
        guard let dicACL = response["acl"] as? [String: [String: Bool]] else {
            fatalError("invalid dicACL")
        }
        self.acl?.dicACL = dicACL
//    if ([response objectForKey:@"mimeType"]){
        if let mimeType = response["mimeType"] as? String {
//        [estimatedData setObject:[response objectForKey:@"mimeType"] forKey:@"mimeType"];
            estimatedData["mimeType"] = mimeType
//    }
        }
//    if ([response objectForKey:@"fileSize"]){
        if let fileSize = response["fileSize"] {
//        [estimatedData setObject:[response objectForKey:@"fileSize"] forKey:@"fileSize"];
            estimatedData["fileSize"] = fileSize
//    }
        }
//    [super afterFetch:response isRefresh:isRefresh];
        super.afterFetch(response, isRefresh: isRefresh)
//    _isDirty = NO;
        isDirty = false
//}
    }
//
//- (NCMBRequest *)createRequest:(NSMutableDictionary*)operation error:(NSError**)error{
    private func createRequest(_ operation: NCMBOperationSet) throws -> NCMBRequest{
//    //リクエスト作成
//    NSMutableData *body = [self createBody:operation error:error];
        let body = try createBody(operation)
//    NSString *method = @"POST";
        var method = "POST"
//    NSMutableDictionary *header = [NSMutableDictionary dictionary];
        var header: [String: String] = [:]
//    if(self.isDirty){
        if self.isDirty {
//        // POST時
//        [header setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=_NCMBProjectBoundary"]  forKey:@"Content-Type"];
            header["Content-Type"] = "multipart/form-data; boundary=_NCMBProjectBoundary"
//        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
            let postLength = String(describing: body.count)
//        [header setValue:postLength forKey:@"Content-Length"];
            header["Content-Length"] = postLength
//    }else{
        } else{
//        // PUT時
//        method = @"PUT";
            method = "PUT"
//    }
        }
//    // 日本語ファイル名の場合エンコーディング必須
//    NSString *fileName = [NCMBRequest returnEncodedString:self.name];
        let fileName = NCMBRequest.returnEncodedString(self.name!)
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@", URL_PATH,URL_FILE,fileName]];
        let url = URL(string: "\(URL_PATH)\(URL_FILE)/\(fileName)")!
//    NCMBRequest *request = [[NCMBRequest alloc] initWithURL:url
        let request = NCMBRequest(url: url,
                                  method: method,
                                  header: header,
                                  bodyData: body)
//                                                     method:method
//                                                     header:header
//                                                   bodyData:body];
//    return request;
        return request
//}
    }
//@end
}
