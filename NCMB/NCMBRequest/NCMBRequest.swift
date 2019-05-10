//
//  NCMBRequest.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/01.
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
//#import <UIKit/UIKit.h>
import UIKit
import CommonCrypto

enum NCMBRequestError: Error {
    case invalidArgument(reason: String)
}
//
//@interface NCMBRequest : NSMutableURLRequest
public class NCMBRequest {
    public var urlRequest: URLRequest
//
//@property (nonatomic)NSString *signature;
    public var signature: String?
//@property (nonatomic)NSString *applicationKey;
    public var applicationKey: String?
//@property (nonatomic)NSString *clientKey;
    public var clientKey: String?
//
//-(instancetype)initWithURLString:(NSString *)urlString
//                    method:(NSString *)method
//                    header:(NSDictionary *)headers
//                      body:(NSDictionary *)body;
//
//-(instancetype)initWithURL:(NSURL *)url
//                    method:(NSString *)method
//                    header:(NSDictionary *)headers
//                  bodyData:(NSData *)bodyData;
//
//+(NSString *)returnTimeStamp;
//
//+(NSString *)returnSessionToken;
//
//-(NSString *)returnSignature:(NSURL *)url method:(NSString *)method timestamp:(NSString *)timestamp;
//
//+(NSString *)returnEncodedString:(NSString *)originalString;
//
//+(NSString *)encodingSigneture:(NSString *)strForSignature  method:(NCMBRequest *)request;
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
//#import "NCMB.h"
//#import "NCMBRequest.h"
//#import "NCMBUser+Private.h"
//#import <CommonCrypto/CommonCrypto.h>
//#import "NCMBDateFormat.h"

    private static let kEndPoint = "https://mbaas.api.nifcloud.com"

    private static let kAPIVersion = "2013-09-01"

    private let appKeyField = "X-NCMB-Application-Key"

    private let timestampField = "X-NCMB-Timestamp"

    private let signatureField = "X-NCMB-Signature"

    private let sessionTokenField = "X-NCMB-Apps-Session-Token"

    private let signatureMethod = "SignatureMethod=HmacSHA256"

    private let signatureVersion = "SignatureVersion=2"

    private let kSDKVersionFieldName = "X-NCMB-SDK-Version"

    private let kOSVersionFieldName = "X-NCMB-OS-Version"

//@implementation NCMBRequest
//
//-(instancetype)initWithURL:(NSURL *)url
    public init(url: URL,
//                    method:(NSString *)method
        method: String,
//                    header:(NSDictionary *)headers
        header headers: [String: String]?,
//                  bodyData:(NSData *)bodyData
        bodyData: Data?
//{
    ) {
//    self = [NCMBRequest requestWithURL:url
//                           cachePolicy:NSURLRequestReloadIgnoringCacheData
//                       timeoutInterval:10.0];
        urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10.0)
//
//    // カスタムヘッダー設定
//    if (headers != nil && [headers count] > 0) {
        if let headers = headers, !headers.isEmpty {
//        for (NSString *key in [headers allKeys]) {
            for (key, value) in headers {
//            [self setValue:[headers objectForKey:key] forHTTPHeaderField:key];
                self.urlRequest.setValue(value, forHTTPHeaderField: key)
//        }
            }
//    }
        }
//
//    // 必須項目の設定
//    self.HTTPMethod = method;
        self.urlRequest.httpMethod = method
//    [self setValue:[NCMB getApplicationKey] forHTTPHeaderField:appKeyField];
        self.urlRequest.setValue(NCMB.getApplicationKey(), forHTTPHeaderField: appKeyField)
//    NSString *timestampStr = [NCMBRequest returnTimeStamp];
        let timestampStr = NCMBRequest.returnTimeStamp()
//    [self setValue:timestampStr forHTTPHeaderField:timestampField];
        self.urlRequest.setValue(timestampStr, forHTTPHeaderField: timestampField)
//    [self setValue:[NCMBRequest returnSessionToken] forHTTPHeaderField:sessionTokenField];
        self.urlRequest.setValue(NCMBRequest.returnSessionToken(), forHTTPHeaderField: sessionTokenField)
//    [self setValue:[self returnSignature:url
        self.urlRequest.setValue(self.returnSignature(
            url,
//                                  method:method
            method: method,
//                               timestamp:timestampStr] forHTTPHeaderField:signatureField];
            timestamp: timestampStr), forHTTPHeaderField: signatureField)
//
//    NSRange range = [url.description rangeOfString:@"script.mbaas.api.nifcloud.com"];
//    if(![headers objectForKey:@"Content-Type"] || range.location != NSNotFound){
        if headers?["Content-Type"] == nil || url.absoluteString.contains("script.mbaas.api.nifcloud.com") {
//        [self setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            self.urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    }
        }
//
//    // ボディデータ設定
//    if ([method isEqualToString:@"POST"] || [method isEqualToString:@"PUT"]) {
        if method == "POST" || method == "PUT" {
//        self.HTTPBody = bodyData;
            self.urlRequest.httpBody = bodyData
//    }
        }
//    // Set SDK and OS version
//    NSString *osVersion = [[UIDevice currentDevice] systemVersion];
        let osVersion = UIDevice.current.systemVersion
//    [self setValue:[NSString stringWithFormat:@"ios-%@", osVersion] forHTTPHeaderField:kOSVersionFieldName];
        self.urlRequest.setValue("ios-\(osVersion)", forHTTPHeaderField: kOSVersionFieldName)
//    [self setValue:[NSString stringWithFormat:@"ios-%@", SDK_VERSION] forHTTPHeaderField:kSDKVersionFieldName];
        self.urlRequest.setValue("ios-\(SDK_VERSION)", forHTTPHeaderField: kSDKVersionFieldName)
//
//    return self;
//}
    }
//
//-(instancetype)initWithURLString:(NSString *)urlString
    public convenience init(urlString: String,
//                          method:(NSString *)method
        method: String,
//                          header:(NSDictionary *)headers
        header headers: [String: String]?,
//                            body:(NSDictionary *)body
        body: [String: Any]?
//{
    )  {
//    NSString *path = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"#[]@!()*+,;\"<>\\%^`{|} \b\t\n\a\r"] invertedSet]];
        let allowed = CharacterSet(charactersIn: "#[]@!()*+,;\"<>\\%^`{|} \u{8}\t\n\u{7}\r").inverted
        let path = urlString.addingPercentEncoding(withAllowedCharacters: allowed)!
//
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",kEndPoint,kAPIVersion,path]];
        let url = URL(string: "\(NCMBRequest.kEndPoint)/\(NCMBRequest.kAPIVersion)/\(path)")!
        print(#function, "url=", url.absoluteString)
        //print(#function, "body=", body)
//    NSData *bodyData = nil;
        var bodyData: Data?
//    if (body != nil) {
        if let body = body {
//        NSError *error = nil;
//        bodyData = [NSJSONSerialization dataWithJSONObject:body
//                                                   options:kNilOptions
//                                                     error:&error];
            do {
                bodyData = try JSONSerialization.data(withJSONObject: body)
                print(#function, "bodyData=", String(data: bodyData!, encoding: .utf8)!)
//        if (error) {
            } catch {
//            [NSException raise:NSInvalidArgumentException format:@"body data is invalid json format."];
                fatalError("body data is invalid json format.")
//        }
            }
//    }
        }
//    return [self initWithURL:url method:method header:headers bodyData:bodyData];
        self.init(url: url, method: method, header: headers, bodyData: bodyData)
//}
    }
//
//+(NSString *)returnTimeStamp{
    public static func returnTimeStamp() -> String {
//    return [[NCMBDateFormat getIso8601DateFormat] stringFromDate:[NSDate date]];
        return NCMBDateFormat.getIso8601DateFormat().string(from: Date())
//}
    }
//
//+(NSString *)returnSessionToken {
    public static func returnSessionToken() -> String? {
//    return [NCMBUser getCurrentSessionToken];
        return NCMBUser.getCurrentSessionToken()
//}
    }
//
//+(NSString *)returnEncodedString:(NSString *)originalString {
    public static func returnEncodedString(_ originalString: String) -> String {
//
//    NSString *escapedStr = [originalString stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@":/?#[]@!$&'()*+,;=\"<>\\%^`{|} \b\t\n\a\r"] invertedSet]];
        let allowed = CharacterSet(charactersIn: ":/?#[]@!$&'()*+,;=\"<>\\%^`{|} \u{8}\t\n\u{7}\r").inverted
        let escapedStr = originalString.addingPercentEncoding(withAllowedCharacters: allowed)!
//    return escapedStr;
        return escapedStr
//}
    }
//
//-(NSString *)returnSignature:(NSURL *)url method:(NSString *)method timestamp:(NSString *)timestamp {
    public func returnSignature(_ url: URL, method: String, timestamp: String) -> String {
//    if ([NCMB getClientKey] == nil || [NCMB getApplicationKey] == nil){
        guard let clientKey = NCMB.getClientKey(), let applicationKey = NCMB.getApplicationKey() else {
//        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Application key or Client key must not be nil." userInfo:nil] raise];
            fatalError("Application key or Client key must not be nil.")
//    }
        }
//    self.applicationKey =[NCMB getApplicationKey];
        self.applicationKey = applicationKey
//    self.clientKey =[NCMB getClientKey];
        self.clientKey = clientKey
//
//    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
//    // components.pathはデコードされた値が返却されるのでエンコードする(POST時のファイル名が日本語の場合などに必要)
//    NSString *path = [components.path stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"#[]@!()*+,;\"<>\\%^`{|} \b\t\n\a\r"] invertedSet]];
        let allowed = CharacterSet(charactersIn: "#[]@!()*+,;\"<>\\%^`{|} \u{8}\t\n\u{7}\r").inverted
        let path = components!.path.addingPercentEncoding(withAllowedCharacters: allowed)!
//    self.signature = [NSString stringWithFormat:@"%@\n%@\n%@\n%@&%@&%@&%@",
        self.signature = "\(method)\n\(components!.host!)\n\(path)\n\(signatureMethod)&\(signatureVersion)&\(appKeyField)=\(self.applicationKey!)&\(timestampField)=\(timestamp)"
//                      method,
//                      components.host,
//                      path,
//                      signatureMethod,
//                      signatureVersion,
//                      [NSString stringWithFormat:@"%@=%@", appKeyField, self.applicationKey],
//                      [NSString stringWithFormat:@"%@=%@", timestampField, timestamp]];
//    if (components.percentEncodedQuery != nil && components.percentEncodedQuery.length > 0) {
        if let query = components?.percentEncodedQuery, !query.isEmpty {
//        if ([@"GET" isEqualToString:method]) {
            if method == "GET" {
//            self.signature = [self.signature stringByAppendingString:[NSString stringWithFormat:@"&%@", components.percentEncodedQuery]];
                self.signature? += "&\(query)"
//        }
            }
//    }
        }
//
//    return [NCMBRequest encodingSigneture:self.signature method:self];
        print("self.signature!=",self.signature!)
        return NCMBRequest.encodingSignature(self.signature!, method: self)
//}
    }
//
///**
// 署名用文字列を元にシグネチャに変換
// @param strForSignature 署名用文字列
// @return NSString型シグネチャ
// */
//+(NSString *)encodingSigneture:(NSString *)strForSignature  method:(NCMBRequest *)request{
    public static func encodingSignature(_ strForSignature: String, method request: NCMBRequest) -> String {
//
//    if (request.clientKey == nil || request.applicationKey == nil){
        guard
            let cKey = request.clientKey,
            request.applicationKey != nil
            else {
//        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Application key or Client key must not be nil." userInfo:nil] raise];
                fatalError("Application key or Client key must not be nil.")
//    }
        }
//    const char *cKey = [request.clientKey cStringUsingEncoding:NSUTF8StringEncoding];
//    const char *cData = [strForSignature cStringUsingEncoding:NSUTF8StringEncoding];
        let cData = strForSignature
//
//    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
        var cHMAC: [UInt8] = Array(repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
//
//    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), cKey, cKey.utf8.count, cData, cData.utf8.count, &cHMAC)
//
//    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
        let HMAC = Data(cHMAC)
//                                          length:sizeof(cHMAC)];
//
//    NSString *signature = [HMAC base64EncodedStringWithOptions:kNilOptions];
        let signature = HMAC.base64EncodedString()
//
//    return signature;
        return signature
//}
    }
//
//@end
}
