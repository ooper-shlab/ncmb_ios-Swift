//
//  NCMBAnonymousUtils.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/02.
//

/*
 Copyright 2017-2018 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.

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

import Foundation

/**
 NCMBAnonymousUtilsクラスは、匿名ユーザでのログインを管理しているクラスです。

 匿名ユーザには、下記のようないくつかの規則があります。

 ・匿名ユーザは、ユーザ名とパスワードなしでログインできます。

 ・一度ログアウトした場合は、匿名ユーザを復元することはできません。
 */
public class NCMBAnonymousUtils {



    private static let AUTH_TYPE_ANONYMOUS = "anonymous"

    //MARK: link
    
    /**
     指定したユーザが匿名ユーザかどうか判断。匿名ユーザの場合はtrueを返す。
     @param user 指定するユーザ
     @return BOOL型 ログイン中のユーザーが匿名ユーザーの場合YESを返す
     */
    public static func isLinked(user: NCMBUser) -> Bool {
        var isLinkerFlag = false
        if let authData = user.object(forKey: "authData") as? [String: Any] {
            if authData[AUTH_TYPE_ANONYMOUS] != nil && user.password == nil {
                isLinkerFlag = true
            }
        }
        return isLinkerFlag
    }

    //MARK: logIn

    /**
     同期通信を利用して匿名ユーザでログインする。必要があればエラーをセットし、取得することもできる。
     @param error 処理中に起きたエラーのポインタ
     @return 匿名ユーザー情報を含むNCMBUserのインスタンス
     */
    public static func __logIn() throws -> NCMBUser {
        fatalError("\(#function): Sync methods not supported")
//    NCMBUser *user = [NCMBAnonymousUtils createAnonymousUser];
//    [user signUp:error];
//    return user;
//}
    }

    /**
     非同期通信を利用して匿名ユーザでログインする。ログインし終わったら与えられたblockを呼び出す。
     @param block 通信後実行されるblock。blockは次の引数のシグネチャを持つ必要がある（NCMBUser *user, NSError *errorr） userにはログインしたユーザの情報が渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
     */
    public static func logIn(block: NCMBUserResultBlock?) {
        let user = NCMBAnonymousUtils.createAnonymousUser()
        user.signUpAsync {error in
            if let block = block {
                if let error = error {
                    block(.failure(error))
                } else {
                    block(.success(user))
                }
            }
        }
    }

    /**
     非同期通信を利用して匿名ユーザでログインする。ログインし終わったら指定されたセレクタをNSInvocattionで呼び出す。
     @param target 呼び出すセレクタのターゲット
     @param selector 呼び出すセレクタ。次のシグネチャを持つ必要がある。(void)callbackWithResult:(NCMBUser *)user error:(NSError **)error
     userにはログインしたユーザの情報が渡される。errorにはエラーがあればエラーのポインタが、なければnilが渡される。
     */
    public static func logIn(target: AnyObject, selector: Selector) {
//    NSMethodSignature* signature = [target methodSignatureForSelector:selector];
//    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
//    [invocation setTarget:target];
//    [invocation setSelector:selector];
//    [self logInWithBlock:^(NCMBUser *user, NSError *error)  {
        self.logIn {result in
            let user: NCMBUser?
            let error: NSError?
            switch result {
            case .success(let resultUser):
                user = resultUser
                error = nil
            case .failure(let resultError):
                user = nil
                error = resultError as NSError
            }
//        [invocation setArgument:&user atIndex:2];
//        [invocation setArgument:&error atIndex:3];
//        [invocation invoke];
            _ = target.perform(selector, with: user, with: error)
//    }];
        }
//}
    }

    //MARK: create
    
    /**
     端末固有のIDを生成する
     二度取得すると異なる値が返るので、クラウドとローカルで保持する
     @return NSString型UUID
     */
    private static func createUUID() -> String {
        //iOS5以前向けで作成
        //NSString *uuidString = (NSString*)CFUUIDCreateString(nil, uuidObj);
        return UUID().uuidString
    }
    
    /**
     ログインするための匿名ユーザーを作成する
     @return NCMBUser匿名ユーザー
     */
    private static func createAnonymousUser() -> NCMBUser {
        let user = NCMBUser()
        //UUIDを使用してローカルにセットする　例:authData:{anonymous={id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";};}
        let anonymousDic = [
            AUTH_TYPE_ANONYMOUS: ["id": self.createUUID()]
        ]
        user.setObject(anonymousDic, forKey: "authData")
        return user
    }



}
