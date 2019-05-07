//
//  NCMBURLSession.swift
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
//#import "NCMBRequest.h"
import CommonCrypto
//
//
//@interface NCMBURLSession : NSURLSession<NSURLSessionTaskDelegate>
public class NCMBURLSession: URLSession,
URLSessionTaskDelegate, URLSessionDataDelegate, URLSessionDownloadDelegate {
//
//// コールバック
//typedef void (^NCMBProgressBlock)(int percentDone);
//typedef void (^NCMBResultBlock)(id response, NSError *error);
    public typealias NCMBResultBlock = NCMBAnyObjectResultBlock
//
//// プロパティ
//@property (nonatomic)NCMBRequest *request;
    let request: NCMBRequest
//@property (nonatomic)NSURLSessionConfiguration *config;
    let config: URLSessionConfiguration
//@property (nonatomic)NSURLSession *session;
    var session: URLSession?
//@property (nonatomic)NSURLSessionDataTask *dataTask;
    var dataTask: URLSessionDataTask?
//@property (nonatomic)NSURLSessionDataTask *uploadTask;
    var uploadTask: URLSessionDataTask?
//@property (nonatomic)NSURLSessionDownloadTask *downloadTask;
    var downloadTask: URLSessionDownloadTask?
//@property (nonatomic)NSMutableData *responseData;
    var responseData: Data = Data()
//@property (nonatomic,copy) void (^block)(id response, NSError *error);
    var block: NCMBAnyObjectResultBlock?
//@property (nonatomic,copy) void (^blockProgress)(int progress);
    var blockProgress: NCMBProgressBlock?
//
//- (id)initWithRequestSync:(NCMBRequest*)request;
//
//- (id)initWithRequestAsync:(NCMBRequest*)request;
//
//- (id)initWithRequest:(NCMBRequest*)request cachePolicy:(NSURLRequestCachePolicy)cachePolicy;
//
//- (id)initWithProgress:(NCMBRequest*)request  progress:(void (^)(int progress))progress;
//
//
//- (void)dataAsyncConnectionWithBlock:(NCMBResultBlock)block;
//
//- (void)fileUploadAsyncConnectionWithBlock:(NCMBResultBlock)block;
//
//- (void)fileDownloadAsyncConnectionWithBlock:(NCMBResultBlock)block;
//
//// ---------------------------------------------------------------------
////  NSURLSessionTaskDelegate(upload)
//// ---------------------------------------------------------------------
//
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data;
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error;
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler;
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend;
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task needNewBodyStream:(void (^)(NSInputStream *bodyStream))completionHandler;
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task willPerformHTTPRedirection:(NSHTTPURLResponse *)response newRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLRequest *))completionHandler;
//
//
//
//// ---------------------------------------------------------------------
////  NSURLSessionDownloadDelegate
//// ---------------------------------------------------------------------
//
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes;
//
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite;
//
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location;
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
//#import "NCMBURLSession.h"
//#import "NCMBError.h"
//#import "NCMB.h"
//#import "NCMBUser.h"
//#import "NCMBUser+Private.h"
//#import <CommonCrypto/CommonCrypto.h>
//
//@implementation NCMBURLSession
//
//#pragma mark - Initializer
//
//
//// 進捗状況取得デリゲートを指定して初期化を行う（NCMBFile用）
//- (id)initWithProgress:(NCMBRequest*)request  progress:(void (^)(int progress))progress{
    public convenience init(_ request: NCMBRequest, progress: NCMBProgressBlock?) {
        self.init(requestAsync: request)
//    self.blockProgress = progress;
        self.blockProgress = progress
//    return [self initWithRequestAsync:request];
//}
    }
//
//// 初期化を行う
//- (id)initWithRequestSync:(NCMBRequest*)request {
    public convenience init(__requestSync request: NCMBRequest) {
        //### 非mainスレッドからなら呼んでも良い
        //fatalError("\(#function): Sync methods not supported")
        self.init(request: request, cachePolicy: .useProtocolCachePolicy)
//    self.session = [NSURLSession sessionWithConfiguration:self.config delegate:self delegateQueue:nil];
        self.session = URLSession(configuration: self.config, delegate: self, delegateQueue: nil)
//    return [self initWithRequest:request cachePolicy:kNilOptions];
//}
    }
//
//// 初期化を行う
//- (id)initWithRequestAsync:(NCMBRequest*)request {
    public convenience init(requestAsync request: NCMBRequest) {
        self.init(request: request, cachePolicy: .useProtocolCachePolicy)
//    // コールバックをメインスレッドで実行させるために[NSOperationQueue mainQueue]を設定する
//    self.session = [NSURLSession sessionWithConfiguration:self.config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        self.session = URLSession(configuration: self.config, delegate: self, delegateQueue: .main)
//    return [self initWithRequest:request cachePolicy:kNilOptions];
//}
    }
//
//- (id)initWithRequest:(NCMBRequest*)request cachePolicy:(NSURLRequestCachePolicy)cachePolicy{
    public init(request: NCMBRequest, cachePolicy: NSURLRequest.CachePolicy) {
//    self = [super init];
//
//    self.request = request;
        self.request = request
//    self.responseData = [[NSMutableData alloc] init];
//
//    // デフォルト設定
//    self.config = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.config = URLSessionConfiguration.default
//    self.config.requestCachePolicy = cachePolicy;
        self.config.requestCachePolicy = cachePolicy
//
//    return self;
        super.init()
//}
    }
//
//#pragma mark - AsyncConnection(非同期)
//
//// 非同期通信で通信を行う
//- (void)dataAsyncConnectionWithBlock:(NCMBResultBlock)block{
    public func dataAsyncConnection(block: NCMBResultBlock?) {
//    self.block = block;
        self.block = block
//    self.dataTask = [self.session dataTaskWithRequest:self.request];
        self.dataTask = self.session?.dataTask(with: self.request.urlRequest)
//    [self.dataTask resume];
        self.dataTask?.resume()
//}
    }
//
//// 非同期通信でファイルのダウンロードを行う
//- (void)fileDownloadAsyncConnectionWithBlock:(NCMBResultBlock)block{
    public func fileDownloadAsyncConnection(block: @escaping NCMBResultBlock) {
//    self.block = block;
        self.block = block
//    self.downloadTask = [self.session downloadTaskWithRequest:self.request];
        self.downloadTask = self.session?.downloadTask(with: self.request.urlRequest)
//    [self.downloadTask resume];
        self.downloadTask?.resume()
//}
    }
//
//// 非同期通信でファイルのアップロードを行う
//- (void)fileUploadAsyncConnectionWithBlock:(NCMBResultBlock)block{
    public func fileUploadAsyncConnection(block: @escaping NCMBResultBlock) {
//    self.block = block;
        self.block = block
//    self.uploadTask = [self.session uploadTaskWithRequest:self.request fromData:self.request.HTTPBody];
        self.uploadTask = self.session?.uploadTask(with: self.request.urlRequest, from: self.request.urlRequest.httpBody!)
//    [self.uploadTask resume];
        self.uploadTask?.resume()
//}
    }
//
//#pragma mark - after connection
//
///**
// レスポンスの処理を行う
// @param contents NSData型のレスポンスデータ
// @param response NSHTTPURLResponse型のレスポンス
// @param error エラーを保持するポインタ
// @return id型のレスポンスを返す
// */
//- (id)convertResponse:(NSData*)contents
    private func convert(_ contents: Data,
//             response:(NSHTTPURLResponse*)response
                         response: HTTPURLResponse?
//                error:(NSError**)error
//{
    ) throws -> Any {
//    if (response.statusCode == 200 || response.statusCode == 201){
        if response?.statusCode == 200 || response?.statusCode == 201 {
//        NSDictionary *responseDic = [NSDictionary dictionary];
//
//        // レスポンスシグネチャの検証
//        [self signatureCheck:response contentsData:contents error:error];
            try signatureCheck(response, contentsData: contents)
//
//        //NCMBFile　getDataの場合はNSDataを返却
//        NSRange range = [[response.URL absoluteString] rangeOfString:@"files/"];
//        if (range.location != NSNotFound && [_request.HTTPMethod isEqualToString:@"GET"]) {
            if response?.url?.absoluteString.contains("files/") ?? false && request.urlRequest.httpMethod == "GET" {
//            *error = nil;
//            return contents;
                return contents
//        }
            }
//
//        //削除の場合は空、それ以外はNSDictionaryが返却される
//        responseDic = [self convertResponseToDic:contents error:error];
            let responseDic = try self.convertResponseToDic(contents)
//
//        return responseDic;
            return responseDic
//    } else {
        } else {
//        [self convertErrorFromJSON:contents response:response error:error];
            try self.convertErrorFromJSON(contents, response: response)
//        return [self convertResponseToDic:contents error:error];
            return try self.convertResponseToDic(contents)
//    }
        }
//}
    }
//
///**
// レスポンスのNSDataをNSDictionaryにセットする
// @param contentsData mBaaSから返却されるJSONデータ
// @param error エラー
// @return レスポンスのNSDictionary
// */
//- (NSDictionary *)convertResponseToDic:(NSData *)contentsData error:(NSError **)error{
    private func convertResponseToDic(_ contentsData: Data) throws -> [String: Any] {
//    NSError *convertErr = nil;
//    NSDictionary *jsonDic = [NSDictionary dictionary];
        let jsonDic: [String: Any] = [:]
//    if ([contentsData isKindOfClass:[NSData class]] && [contentsData length] != 0){
        if !contentsData.isEmpty {
//        jsonDic = [NSJSONSerialization JSONObjectWithData:contentsData
            return try JSONSerialization.jsonObject(with: contentsData,
//                                                  options:NSJSONReadingAllowFragments
                                                options: .allowFragments) as! [String: Any]
//                                                    error:&convertErr];
//    }
        }
//
//    if (convertErr){
//        //削除の場合はconvertErrが返る
//        if (error != nil){
//            *error = convertErr;
//        }
//            return nil;
//    }
//    return jsonDic;
        return jsonDic
//}
    }
//
///**
// エラーレスポンスのJSONをNSErrorに変換する
// @param response エラーが含まれているJSON
// @param error エラーを保持するポインタ
// */
//- (void)convertErrorFromJSON:(NSData*)contents response:(NSHTTPURLResponse*)response error:(NSError**)error {
    private func convertErrorFromJSON(_ contents: Data, response: HTTPURLResponse?) throws {
//    NSDictionary *errDic = [self convertResponseToDic:contents error:error];
        let errDic = try self.convertResponseToDic(contents)
//    if (errDic != nil && [errDic count] != 0){
        if !errDic.isEmpty {
//        // mBaaSが返却するエラー時
//        [self checkE401001Error:[errDic objectForKey:@"code"]];
            self.checkE401001Error(errDic["code"] as? String)
//        //エラーコードをNSIntegerへの変換
//        NSString *codeStr = [[errDic objectForKey:@"code"] stringByReplacingOccurrencesOfString:@"E"
            let codeStr = (errDic["code"] as! String).replacingOccurrences(of: "E", with: "")
//                                                                                     withString:@""];
//        //エラーメッセージがあれば取得し設定
//        NSMutableDictionary *errorMessage = [NSMutableDictionary dictionary];
            var errorMessage: [String: Any] = [:]
//        if([errDic objectForKey:@"error"] ){
            if let error = errDic["error"] {
//            [errorMessage setObject:[errDic objectForKey:@"error"] forKey:NSLocalizedDescriptionKey];
                errorMessage[NSLocalizedDescriptionKey] = error
//        }
            }
//
//        if (error != nil){
//            *error = [[NSError alloc] initWithDomain:kNCMBErrorDomain
            throw NSError(domain: kNCMBErrorDomain, code: Int(codeStr) ?? -999, userInfo: errorMessage)
//                                                code:[codeStr integerValue]
//                                            userInfo:errorMessage];
//        }
//    } else {
        } else {
//        // 通信エラー時
//        if (*error == nil){
//            *error = [[NSError alloc] initWithDomain:NSCocoaErrorDomain
            throw NSError(domain: NSCocoaErrorDomain,
//                                                code:response.statusCode
                code: response?.statusCode ?? 999,
//                                            userInfo:@{NSLocalizedDescriptionKey:@"Connection Error."}];
                userInfo: [NSLocalizedDescriptionKey: "Connection Error."])
//        }
//    }
        }
//}
    }
//
//
///**
// セッショントークンの有効期限が切れていた場合、E401001エラーが返る
// このエラーだった場合は、ログアウト処理を行う
// @param errorCode エラーコード
// */
//-(void)checkE401001Error:(NSString *)errorCode{
    private func checkE401001Error(_ errorCode: String?) {
//    if([kNCMBErrorInvalidAuthHeader isEqualToString:errorCode]){
        if errorCode == kNCMBErrorInvalidAuthHeader {
//        NCMBUser *currentUser = [NCMBUser currentUser];
            let currentUser = NCMBUser.currentUser
//        NSString *currentUserSessionToken = currentUser.sessionToken;
            let currentUserSessionToken = currentUser?.sessionToken
//        //Eventuallyメソッドで古いsessionの場合があるので現在のsessionとも比較する
//        NSString *sessionToken = [NCMBUser getCurrentSessionToken];
            let sessionToken = NCMBUser.getCurrentSessionToken()
//        if(sessionToken != nil && [sessionToken isEqualToString:currentUserSessionToken]){
            if sessionToken != nil && sessionToken == currentUserSessionToken {
//            [NCMBUser logOutEvent];
                NCMBUser.logOutEvent()
//        }
            }
//    }
        }
//}
    }
//
///**
// シグネチャが有効かどうかの検証を行う
// @param response 通信のレスポンス
// @param contentsData mBaaSから返却されるJSONデータ
// @param error エラー
// */
//-(void)signatureCheck:(NSURLResponse *)response contentsData:(NSData *)contentsData error:(NSError **)error{
    private func signatureCheck(_ response: URLResponse?, contentsData: Data) throws {
//    //レスポンスシグネチャ取得
//    NSDictionary *responseDic = [((NSHTTPURLResponse *)response) allHeaderFields];
        let responseDic = (response as? HTTPURLResponse)?.allHeaderFields as? [String: String] ?? [:]
//    NSString *responseSignature = [responseDic valueForKey:@"X-NCMB-Response-Signature"];
        let responseSignature = responseDic["X-NCMB-Response-Signature"]
//
//    //有効であればレスポンスシグネチャのチェックを行う
//    if ([NCMB getResponseValidationFlag] == YES && responseSignature != nil){
        if NCMB.getResponseValidationFlag(), let responseSignature = responseSignature {
//
//        NSString *strForSignature =  self.request.signature;
            guard let strForSignature = self.request.signature else {
                print("request.signature is nil")
                return
            }
//        //レスポンスシグネチャ比較用のシグネチャ生成
//        NSString *createdSignature = nil;
            var createdSignature: String? = nil
//        NSRange contentTypeRange = [[responseDic valueForKey:@"Content-Type"] rangeOfString:@"application/json"];
            if responseDic["Content-Type"]?.contains("application/json") ?? false {
//        if (contentTypeRange.location != NSNotFound) {
//            NSString *dataString = [[NSString alloc] initWithData:contentsData encoding:NSUTF8StringEncoding];
                let dataString = String(data: contentsData, encoding: .utf8)!
//            if (![dataString isEqualToString:@""]){
                if !dataString.isEmpty {
//                NSString *forSignString = [strForSignature stringByAppendingFormat:@"\n%@", dataString];
                    let forSignString = "\(strForSignature)\n\(dataString)"
//                createdSignature = [NCMBRequest encodingSigneture:forSignString method:self.request];
                    createdSignature = NCMBRequest.encodingSignature(forSignString, method: self.request)
//            } else {
                } else {
//                //メソッドがDELETEorログアウト時はreceiveDataがない
//                createdSignature = [NCMBRequest encodingSigneture:strForSignature method:self.request];
                    createdSignature = NCMBRequest.encodingSignature(strForSignature, method: self.request)
//            }
                }
//        } else {
            } else {
//            //NCMBFile時の処理。バイナリデータは16進数文字列に変換する
//            NSMutableString *dataString = [NSMutableString stringWithCapacity:[contentsData length]];
//            long length = [contentsData length];
//            char *bytes = malloc(sizeof(char) * length);
//            [contentsData getBytes:bytes length:length];
//            for (int i = 0; i < length; i++){
//                [dataString appendFormat:@"%02.2hhx", bytes[i]];
//            }
//            free(bytes);
//            NSString *forSignDataString = [strForSignature stringByAppendingFormat:@"\n%@", dataString];
                let forSignDataString = "\(strForSignature)\n\(contentsData.hexString)"
//            createdSignature = [NCMBRequest encodingSigneture:forSignDataString method:self.request];
                createdSignature = NCMBRequest.encodingSignature(forSignDataString, method: self.request)
//        }
            }
//
//        //シグネチャが一致しない場合はエラーを設定する
//        if (createdSignature && ![responseSignature isEqualToString:createdSignature]){
            if createdSignature != nil && responseSignature != createdSignature! {
//            NSMutableDictionary *validationErrDetails = [NSMutableDictionary dictionary];
                let validationErrDetails = [
//            [validationErrDetails setObject:@"E100001" forKey:@"code"];
                    "code": "E100001",
//            [validationErrDetails setObject:@"Authentication error by response signature incorrect." forKey:NSLocalizedDescriptionKey];
                    NSLocalizedDescriptionKey: "Authentication error by response signature incorrect."
                ]
//            *error = [NSError errorWithDomain:ERRORDOMAIN code:100001 userInfo:validationErrDetails];
                throw NSError(domain: ERRORDOMAIN, code: 100001, userInfo: validationErrDetails)
//        }
            }
//    }
        }
//}
    }
//
//#pragma mark - NSURLSessionTaskDelegate
//
//// データタスク,アップロードタスク終了時に呼び出されるデリゲート
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//    // 一回のパケットに収まらないデータ量の場合は複数回呼ばれるのでデータを追加していく
//    [self.responseData appendData:data];
        self.responseData.append(data)
//}
    }
//
//// タスク終了時に呼び出されるデリゲート。正常終了、エラー終了、途中終了でもこのメソッドが呼ばれる
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
//{
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//      NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)task.response;
        let httpURLResponse = task.response as? HTTPURLResponse
////    NSInteger responseStatusCode = [httpURLResponse statusCode];
        let responseStatusCode = httpURLResponse?.statusCode ?? 999
////    NSLog(@"ステータスコード:%li",(long)responseStatusCode);
        NSLog("ステータスコード:\(responseStatusCode)")
//
//    [session invalidateAndCancel];
        session.invalidateAndCancel()
//
//    // 各機能クラスに結果を渡す。File取得APIの場合はNSData型を返却。それ以外のAPIはNSDictionary型を返却。
//    id response = [self convertResponse:self.responseData response:httpURLResponse error:&error];
        let result = Result<Any, Error> {
            try self.convert(self.responseData, response: httpURLResponse)
        }
//    if(self.block != nil){
//        self.block(response,error);
//    }
        self.block?(result)
//}
    }
//
//// Basic認証、SSL認証、クライアント認証が掛かっている場合に呼び出されるデリゲート
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler
//{
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//    // SSL認証の設定
//    completionHandler(NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]);
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
//}
    }
//
//// アップロードタスクの処理中に定期的に呼び出されるデリゲート
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
//{
    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
////    NSLog(@"bytesSent:%lld",bytesSent); // 今回送信したデータサイズ
////    NSLog(@"totalBytesSent:%lld",totalBytesSent); // これまで送信したデータサイズの累計
////    NSLog(@"totalBytesExpectedToSend:%lld",totalBytesExpectedToSend); // 送信する予定すべてのデータサイズ
//    if(self.blockProgress != nil){
        if let blockProgress = self.blockProgress {
//        float percent = (float)totalBytesSent/(float)totalBytesExpectedToSend;
            let percent = Float(totalBytesSent)/Float(totalBytesExpectedToSend)
//        self.blockProgress(percent * 100);
            blockProgress(Int(percent * 100))
//    }
        }
//}
    }
//
//// リクエストを再送する際に呼び出されるデリゲート
//// 再送要求が無い場合、このメソッドは呼ばれません
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task needNewBodyStream:(void (^)(NSInputStream *bodyStream))completionHandler
//{
    public func urlSession(_ session: URLSession, task: URLSessionTask, needNewBodyStream completionHandler: @escaping (InputStream?) -> Void) {
//}
    }
//
//// アップロート終了後，レスポンスがリダイレクトされる場合呼び出されるデリゲート
//// リダイレクトが無い場合，このメソッドは呼ばれません
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task willPerformHTTPRedirection:(NSHTTPURLResponse *)response newRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLRequest *))completionHandler
//{
    public func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
//}
    }
//
//#pragma mark - NSURLSessionDownloadDelegate
//
//// cancelByProducingResumeDataメソッドでダウンロードのタスクをキャンセル後、
//// downloadTaskWithResumeDataメソッドでダウンロードを途中からresumeした場合に呼び出されるデリゲート
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
//{
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
//    // NSLog(@"[fileOffset] %lld, [expectedTotalBytes] %lld", fileOffset, expectedTotalBytes);
//}
    }
//
//// ダウンロードタスクの処理中に定期的に呼び出されるデリゲート
//// 進捗率をコールバックに返す
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
//{
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//    // NSLog(@"[bytesWritten] %lld, [totalBytesWritten] %lld, [totalBytesExpectedToWrite] %lld", bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
//
//    if(self.blockProgress != nil){
        if let blockProgress = self.blockProgress {
//        float percent = (float)totalBytesWritten/(float)totalBytesExpectedToWrite;
            let percent = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
//        self.blockProgress(percent * 100);
            blockProgress(Int(percent * 100))
//    }
        }
//}
    }
//
//// ダウンロードタスク終了時に呼び出されるデリゲート
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
//{
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//    if([location isFileURL]){
        if location.isFileURL {
//        NSData* data = [NSData dataWithContentsOfURL:location];
            let data = try! Data(contentsOf: location)
//        self.responseData = (NSMutableData*)data;
            self.responseData = data
//    }
        }
//}
    }
//
//@end
}
