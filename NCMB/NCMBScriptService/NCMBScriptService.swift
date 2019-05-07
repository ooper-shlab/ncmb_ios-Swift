//
//  NCMBScriptService.swift
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
//
//#import "NCMBRequest.h"
//
///**
// スクリプトを実行するリクエストメソッド
//*/
//typedef NS_ENUM(NSUInteger, NCMBScriptRequestMethod) {
public enum NCMBScriptRequestMethod: UInt {
//    /// GETメソッドでのスクリプト実行
//    NCMBExecuteWithGetMethod,
    case get
//    /// POSTメソッドでのスクリプト実行
//    NCMBExecuteWithPostMethod,
    case post
//    /// PUTメソッドでのスクリプト実行
//    NCMBExecuteWithPutMethod,
    case put
//    /// DELETEメソッドでのスクリプト実行
//    NCMBExecuteWithDeleteMethod
    case delete
//};
}
//
//extern NSString *const NCMBScriptServiceDefaultEndPoint;
public let NCMBScriptServiceDefaultEndPoint = "https://script.mbaas.api.nifcloud.com"
//extern NSString *const NCMBScriptServiceApiVersion;
public let NCMBScriptServiceApiVersion = "2015-09-01"
//extern NSString *const NCMBScriptServicePath;
public let NCMBScriptServicePath = "script"
//
//typedef void (^NCMBScriptExecuteCallback) (NSData *data, NSError *error);
public typealias NCMBScriptExecuteCallback = (Result<Data,Error>)->Void
//
//@interface NCMBScriptService : NSObject
public class NCMBScriptService {
//
//@property NSString *endpoint;
    public let endpoint: String
//
//@property NCMBRequest *request;
    public var request: NCMBRequest?
//
//@property NSURLSession *session;
    public let session: URLSession
//
//- (instancetype)initWithEndpoint:(NSString *)endpoint;
//
//- (NSData *)executeScript:(NSString *)name
//               method:(NCMBScriptRequestMethod)method
//               header:(NSDictionary *)header
//                 body:(NSDictionary *)body
//                query:(NSDictionary *)query
//                error:(NSError **)error;
//
//- (void)executeScript:(NSString *)name
//               method:(NCMBScriptRequestMethod)method
//               header:(NSDictionary *)header
//                 body:(NSDictionary *)body
//                query:(NSDictionary *)query
//            withBlock:(NCMBScriptExecuteCallback)callback;
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
//#import "NCMBScriptService.h"
//
//NSString *const NCMBScriptServiceDefaultEndPoint = @"https://script.mbaas.api.nifcloud.com";
//NSString *const NCMBScriptServiceApiVersion = @"2015-09-01";
//NSString *const NCMBScriptServicePath = @"script";
//
//@implementation NCMBScriptService
//
//- (instancetype)init {
    private init() {
//    self = [super init];
//    self.endpoint = NCMBScriptServiceDefaultEndPoint;
        self.endpoint = NCMBScriptServiceDefaultEndPoint
//
//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        let config = URLSessionConfiguration.default
//
//    _session = [NSURLSession sessionWithConfiguration:config
        session = URLSession(configuration: config,
                             delegate: nil,
                             delegateQueue: .main)
//                                             delegate:nil
//                                        delegateQueue:[NSOperationQueue mainQueue]];
//    return self;
//}
    }
//
//- (instancetype)initWithEndpoint:(NSString *)endpoint {
    public init(endpoint: String) {
//    self = [self init];
//    self.endpoint = endpoint;
        self.endpoint = endpoint
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config, delegate: nil, delegateQueue: .main)
//    return self;
//}
    }
//
//- (NSData *)executeScript:(NSData*)data error:(NSError**)error {
//    return nil;
//}
//
//- (NSURL *)createUrlFromScriptName:(NSString *)scriptName query:(NSDictionary *)queryDic {
    private func createUrl(fromScriptName scriptName: String, query queryDic: [String: Any]) -> URL {
//    NSString *url = [NSString stringWithFormat:@"%@/%@/%@/%@",
        let apiVersion = NCMBScriptServiceApiVersion
        let servicePath = NCMBScriptServicePath
        var url = "\(endpoint)/\(apiVersion)/\(servicePath)/\(scriptName)"
//                     _endpoint,
//                     NCMBScriptServiceApiVersion,
//                     NCMBScriptServicePath,
//                     scriptName];
//    if(queryDic != nil && [queryDic count] > 0) {
        if !queryDic.isEmpty {
//        url = [url stringByAppendingString:@"?"];
            var joiner = "?"
//        for (NSString *key in [[queryDic allKeys] sortedArrayUsingSelector:@selector(compare:)]) {
            for (key, value) in queryDic.sorted(by: {$0.key < $1.key}) {
//            NSString *encodedStr = nil;
                var encodedStr: String? = nil
//            if ([[queryDic objectForKey:key] isKindOfClass:[NSDictionary class]] ||
                if value is [String: Any] || value is [Any] {
//                [[queryDic objectForKey:key] isKindOfClass:[NSArray class]])
//            {
//                NSError *error = nil;
                    do {
//                NSData *json = [NSJSONSerialization dataWithJSONObject:[queryDic objectForKey:key]
                        let json = try JSONSerialization.data(withJSONObject: value)
//                                                               options:kNilOptions
//                                                                 error:&error];
//                if (!error) {
//                    NSString *jsonStr = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
                        let jsonStr = String(data: json, encoding: .utf8)!
//                    encodedStr = [NCMBRequest returnEncodedString:jsonStr];
                        encodedStr = NCMBRequest.returnEncodedString(jsonStr)
//                }
                    } catch {
                        print(error)
                    }
//            } else {
                } else {
//                encodedStr = [NCMBRequest returnEncodedString:[NSString stringWithFormat:@"%@",[queryDic objectForKey:key]]];
                    encodedStr = NCMBRequest.returnEncodedString(String(describing: value))
//            }
                }
//            if (encodedStr) {
                if let encodedStr = encodedStr {
//                url = [url stringByAppendingString:[NSString stringWithFormat:@"%@=%@&", key, encodedStr]];
                    url += "\(joiner)\(key)=\(encodedStr)"
                    joiner = "&"
//            }
                }
//
//        }
            }
//        url = [url stringByReplacingOccurrencesOfString:@"&$"
//                                             withString:@""
//                                                options:NSRegularExpressionSearch
//                                                  range:NSMakeRange(0, url.length)];
//    }
        }
//    return [NSURL URLWithString:url];
        return URL(string: url)!
//}
    }
//
//- (NCMBRequest *)createRequest:(NSURL *)url
    private func createRequest(url: URL,
//                        method:(NCMBScriptRequestMethod)method
        method: NCMBScriptRequestMethod,
//                        header:(NSDictionary *)headerDic
        header headerDic: [String: String],
//                          body:(NSDictionary *)body
        body: [String: Any]) -> NCMBRequest {
//{
//
//    NSString *methodStr = nil;
        let methodStr: String
//    switch (method) {
        switch method {
//        case NCMBExecuteWithGetMethod:
        case .get:
//            methodStr = @"GET";
            methodStr = "GET"
//            break;
//        case NCMBExecuteWithPostMethod:
        case .post:
//            methodStr = @"POST";
            methodStr = "POST"
//            break;
//        case NCMBExecuteWithPutMethod:
        case .put:
//            methodStr = @"PUT";
            methodStr = "PUT"
//            break;
//        case NCMBExecuteWithDeleteMethod:
        case .delete:
//            methodStr = @"DELETE";
            methodStr = "DELETE"
//            break;
//        default:
//            break;
//    }
        }
//
//    NSData *bodyData = nil;
        var bodyData: Data? = nil
//    if (body != nil && [body count] > 0) {
        if !body.isEmpty {
//        NSError *error = nil;
            do {
//        bodyData = [NSJSONSerialization dataWithJSONObject:body
                bodyData = try JSONSerialization.data(withJSONObject: body)
//                                                   options:kNilOptions
//                                                     error:&error];
//        if (error) {
            } catch {
//            [NSException raise:NSInvalidArgumentException format:@"body data is invalid json format."];
                fatalError("body data is invalid json format.")
//        }
            }
//    }
        }
//
//    return [[NCMBRequest alloc] initWithURL:url
        return NCMBRequest(url: url,
                           method: methodStr,
                           header: headerDic,
                           bodyData: bodyData)
//                                     method:methodStr
//                                     header:headerDic
//                                   bodyData:bodyData];
//}
    }
//
//- (NSData *)executeScript:(NSString *)name
    public func executeScript(_ name: String,
//                   method:(NCMBScriptRequestMethod)method
        method: NCMBScriptRequestMethod,
//                   header:(NSDictionary *)header
        header: [String: String],
//                     body:(NSDictionary *)body
        body: [String: Any],
//                    query:(NSDictionary *)query
        query: [String: Any]) throws -> Data {
//                    error:(NSError **)error {
        fatalError("\(#function): Sync methods not supported")
//    _request = [self createRequest:[self createUrlFromScriptName:name query:query]
//                            method:method
//                            header:header
//                              body:body];
//
//    __block NSData *result = nil;
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//
//    void (^completionHandler)(NSData *data, NSURLResponse *response, NSError *error) = ^void (NSData *data, NSURLResponse *response, NSError *responseError) {
//        NSHTTPURLResponse *httpRes = (NSHTTPURLResponse*)response;
//        if (httpRes.statusCode != 200 && httpRes.statusCode != 201) {
//            NSError *jsonError = nil;
//            if (data != nil) {
//                NSDictionary *errorRes = [NSJSONSerialization JSONObjectWithData:data
//                                                                         options:NSJSONReadingAllowFragments
//                                                                           error:&jsonError];
//                if (jsonError) {
//                    responseError = jsonError;
//                } else {
//                    responseError = [NSError errorWithDomain:@"NCMBErrorDomain"
//                                                        code:httpRes.statusCode
//                                                    userInfo:@{NSLocalizedDescriptionKey:[errorRes objectForKey:@"error"]}];
//
//                }
//            }
//            if (error != nil) {
//                *error = responseError;
//                result = nil;
//            }
//
//        } else {
//            result = data;
//        }
//        dispatch_semaphore_signal(semaphore);
//
//    };
//    if (method == NCMBExecuteWithGetMethod || method == NCMBExecuteWithDeleteMethod) {
//        _request.HTTPBody = nil;
//        [[_session dataTaskWithRequest:_request
//                     completionHandler:completionHandler] resume];
//    } else {
//        [[_session uploadTaskWithRequest:_request
//                                fromData:_request.HTTPBody
//                       completionHandler:completionHandler] resume];
//
//    }
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//
//    return result;
//}
    }
//
//- (void)executeScript:(NSString *)name
    public func executeScript(_ name: String,
//               method:(NCMBScriptRequestMethod)method
        method: NCMBScriptRequestMethod,
//               header:(NSDictionary *)header
        header: [String: String],
//                 body:(NSDictionary *)body
        body: [String: Any],
//                query:(NSDictionary *)query
        query: [String: Any],
//            withBlock:(NCMBScriptExecuteCallback)callback
        block callback: NCMBScriptExecuteCallback?) {
//{
//    _request = [self createRequest:[self createUrlFromScriptName:name query:query]
        request = self.createRequest(url: self.createUrl(fromScriptName: name, query: query), method: method, header: header, body: body)
//                            method:method
//                            header:header
//                              body:body];
        typealias CompletionHandlerType = @convention(block) (Data?, URLResponse?, Error?)->Void
//    void (^completionHandler)(NSData *data, NSURLResponse *response, NSError *error) = ^void (NSData *data, NSURLResponse *response, NSError *error) {
        let completionHandler: CompletionHandlerType = {data, response, error in
//        NSHTTPURLResponse *httpRes = (NSHTTPURLResponse*)response;
            let httpRes = response as! HTTPURLResponse
//        if (httpRes.statusCode != 200 && httpRes.statusCode != 201) {
            if httpRes.statusCode != 200 && httpRes.statusCode != 201 {
//            NSError *jsonError = nil;
//            if (data != nil) {
                if let data = data {
                    do {
//                NSDictionary *errorRes = [NSJSONSerialization JSONObjectWithData:data
                        let errorRes = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
//                                                                         options:NSJSONReadingAllowFragments
//                                                                           error:&jsonError];
                        let error = NSError(domain: "NCMBErrorDomain",
                                            code: httpRes.statusCode,
                                            userInfo: [NSLocalizedDescriptionKey: errorRes?["error"] as Any])
                        callback?(.failure(error))
//                if (jsonError) {
                    } catch let jsonError {
//                    error = jsonError;
                        callback?(.failure(jsonError))
                        return
                    }
//                } else {
//                    error = [NSError errorWithDomain:@"NCMBErrorDomain"
//                                                code:httpRes.statusCode
//                                            userInfo:@{NSLocalizedDescriptionKey:[errorRes objectForKey:@"error"]}];
//
//                }
//            }
                }
//            if (callback != nil) {
//                callback(nil, error);
//            }
//
//        } else {
            } else {
//            if (callback != nil) {
//                callback(data, error);
                if let error = error {
                    callback?(.failure(error))
                } else {
                    callback?(.failure(NCMBError.unknownError))
                }
//            }
//        }
            }
//    };
        }
//    if (method == NCMBExecuteWithGetMethod || method == NCMBExecuteWithDeleteMethod) {
        if method == .get || method == .delete {
//        _request.HTTPBody = nil;
            request?.urlRequest.httpBody = nil
//        [[_session dataTaskWithRequest:_request
            session.dataTask(with: request!.urlRequest, completionHandler: completionHandler).resume()
//                     completionHandler:completionHandler] resume];
//    } else {
        } else {
//        [[_session uploadTaskWithRequest:_request
            session.uploadTask(with: request!.urlRequest, from: request!.urlRequest.httpBody, completionHandler: completionHandler).resume()
//                                fromData:_request.HTTPBody
//                       completionHandler:completionHandler] resume];
//
//    }
        }
//}
    }
//
//@end
}
