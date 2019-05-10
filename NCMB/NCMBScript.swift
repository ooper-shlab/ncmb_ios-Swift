//
//  NCMBScript.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/02
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
//#import "NCMBScriptService.h"
//
///**
// NCMBScriptクラスは、ニフクラ mobile backendに登録されているスクリプトを実行するためのクラスです。
// */
//@interface NCMBScript : NSObject
public class NCMBScript {
//
///// service スクリプト実行APIをリクエストするためのService
//@property NCMBScriptService* service;
    public var service: NCMBScriptService
//
///// scriptName スクリプトのファイル名
//@property NSString *scriptName;
    public var scriptName: String
//
///// method スクリプトをリクエストする場合のメソッド
//@property NCMBScriptRequestMethod method;
    public var method: NCMBScriptRequestMethod
//
///**
// スクリプト名とリクエストメソッドを指定してNCMBScriptのインスタンスを作成
// @param name スクリプトのファイル名
// @param method スクリプトをリクエストする場合のメソッド
// @return NCMBScriptのインスタンス
//*/
//+ (instancetype)scriptWithName:(NSString*)name method:(NCMBScriptRequestMethod)method;
//
///**
// スクリプト名とリクエストメソッド、APIのエンドポイントを指定してNCMBScriptのインスタンスを作成
// @param name スクリプトのファイル名
// @param method スクリプトをリクエストする場合のメソッド
// @param endpoint ローカルで動作させているスクリプトをリクエストする場合などに指定するAPIサーバーのエンドポイント
// @return NCMBScriptのインスタンス
//*/
//+ (instancetype)scriptWithName:(NSString *)name
//                        method:(NCMBScriptRequestMethod)method
//                      endpoint:(NSString *)endpoint;
//
///**
// リクエストパラメータを指定してスクリプトを同期通信で実行し、結果を取得する
// @param data リクエスト時のbodyデータ（リクエストメソッドが NCMBExecuteWithPostMethod / NCMBExecuteWithPutMethod の場合のみ送信される）
// @param headers リクエスト時のヘッダー
// @param queries リクエスト時のクエリパラメータ(クエリストリングに変換されます)
// @param error エラーオブジェクトのポインタ
// @return スクリプトを実行した結果をNSDataで返す
//*/
//- (NSData *)execute:(NSDictionary *)data
//            headers:(NSDictionary *)headers
//            queries:(NSDictionary *)queries
//              error:(NSError **)error;
//
///**
// リクエストパラメータを指定してスクリプトを非同期通信で実行し、結果を取得する
// @param data リクエスト時のbodyデータ（リクエストメソッドが NCMBExecuteWithPostMethod / NCMBExecuteWithPutMethod の場合のみ送信される）
// @param headers リクエスト時のヘッダー
// @param queries リクエスト時のクエリパラメータ(クエリストリングに変換されます)
// @param block スクリプト実行APIをリクエストしたあとに実行されるコールバック。コールバック引数のdataにはスクリプト実行後の結果が入ります。errorにはスクリプト実行後のエラーが入ります。
//*/
//- (void)execute:(NSDictionary *)data
//        headers:(NSDictionary *)headers
//        queries:(NSDictionary *)queries
//      withBlock:(NCMBScriptExecuteCallback)block;
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
//#import "NCMBScript.h"
//
//@implementation NCMBScript
//
//- (instancetype)initWithName:(NSString*)name method:(NCMBScriptRequestMethod)method endpoint:(NSString *)endpoint{
    public init(name: String, method: NCMBScriptRequestMethod, endpoint: String?) {
//    if (endpoint != nil) {
        if let endpoint = endpoint {
//        _service = [[NCMBScriptService alloc] initWithEndpoint:endpoint];
            service = NCMBScriptService(endpoint: endpoint)
//    } else {
        } else {
//        _service = [[NCMBScriptService alloc] init];
            service = NCMBScriptService()
//    }
        }
//    self = [super init];
//    _scriptName = name;
        scriptName = name
//    _method = method;
        self.method = method
//    return self;
//}
    }
//
//+ (instancetype)scriptWithName:(NSString * __nonnull)name method:(NCMBScriptRequestMethod)method{
    public convenience init(name: String, method: NCMBScriptRequestMethod) {
//    return [self scriptWithName:name method:method endpoint:nil];
        self.init(name: name, method: method, endpoint: nil)
//}
    }
//
    //NOT implemented. Use `init(name:method:endpoint)` instead.
//+ (instancetype)scriptWithName:(NSString *)name
//                        method:(NCMBScriptRequestMethod)method
//                      endpoint:(NSString *)endpoint
//{
//    if (name == nil){
//        [NSException raise:NSInvalidArgumentException format:@"script name must not be nil."];
//    }
//    if (method != NCMBExecuteWithGetMethod &&
//        method != NCMBExecuteWithPostMethod &&
//        method != NCMBExecuteWithPutMethod &&
//        method != NCMBExecuteWithDeleteMethod) {
//        [NSException raise:NSInvalidArgumentException format:@"invalid request method."];
//    }
//    return [[NCMBScript alloc] initWithName:name method:method endpoint:endpoint];
//}
//
//- (NSData *)execute:(NSDictionary *)data
    public func __execute(_ data: [String: Any],
//            headers:(NSDictionary *)headers
        headers: [String: String],
//            queries:(NSDictionary *)queries
        queries: [String: Any]) throws {
//              error:(NSError **)error{
        fatalError("\(#function): Sync methods not supported")
//    return [_service executeScript:_scriptName
//                     method:_method
//                     header:headers
//                       body:data
//                      query:queries
//                      error:error];
//
//}
    }
//
//- (void)execute:(NSDictionary *)data
    public func execute(_ data: [String: Any],
//        headers:(NSDictionary *)headers
        headers: [String: String],
//        queries:(NSDictionary *)queries
        queries: [String: Any],
//      withBlock:(NCMBScriptExecuteCallback)block {
        block: @escaping NCMBScriptExecuteCallback) {
//    [_service executeScript:_scriptName
        service.executeScript(scriptName,
                              method: method,
                              header: headers,
                              body: data,
                              query: queries,
                              block: block)
//                     method:_method
//                     header:headers
//                       body:data
//                      query:queries
//                  withBlock:block];
//}
    }
//
//@end
}
