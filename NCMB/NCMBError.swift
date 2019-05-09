//
//  NCMBError.swift
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
//
//#import <Foundation/Foundation.h>
//
///*! @abstract ncmb error domain */
//extern NSString const *kNCMBErrorDomain;
//
//extern NSInteger const NCMBErrorFacebookLoginCancelled;
//
///*! @abstract E400001 JSON形式不正 */
//extern NSString const *kNCMBErrorInvalidJson;
//
///*! @abstract E400002 型が不正 */
//extern NSString const *kNCMBErrorInvalidType;
//
///*! @abstract E400003 必須項目で未入力 */
//extern NSString const *kNCMBErrorRequired;
//
///*! @abstract E400004 フォーマットが不正 */
//extern NSString const *kNCMBErrorInvalidFormat;
//
///*! @abstract E400005 有効な値でない */
//extern NSString const *kNCMBErrorNotEfficientValue;
//
///*! @abstract E400006 存在しない値 */
//extern NSString const *kNCMBErrorMissingValue;
//
///*! @abstract E400008 相関関係でエラー */
//extern NSString const *kNCMBErrorNotCoexistValue;
//
///*! @abstract E400009 指定桁数を超えている */
//extern NSString const *kNCMBErrorDigitTooLarge;
//
//
///*! @abstract E401001 Header不正による認証エラー */
//extern NSString const *kNCMBErrorInvalidAuthHeader;
//
///*! @abstract E401002 ID/Pass認証エラー */
//extern NSString const *kNCMBErrorAuthFailure;
//
///*! @abstract E401003 OAuth認証エラー */
//extern NSString const *kNCMBErrorOAuthFailure;
//
//
///*! @abstract E403001 ＡＣＬによるアクセス権なし */
//extern NSString const *kNCMBErrorOperationForbiddenByACL;
//
///*! @abstract E403002 コラボレータ/管理者（サポート）権限なし */
//extern NSString const *kNCMBErrorOperationForbiddenByUserType;
//
///*! @abstract E403003 禁止されているオペレーション */
//extern NSString const *kNCMBErrorOperationForbidden;
//
///*! @abstract E403004 ワンタイムキー有効期限切れ */
//extern NSString const *kNCMBErrorExpiredOnetimeKey;
//
///*! @abstract E403005 設定不可の項目 */
//extern NSString const *kNCMBErrorInvalidSettingName;
//
//
///*! @abstract E404001 該当データなし */
//extern NSString const *kNCMBErrorDataNotFound;
//
///*! @abstract E404002 該当サービスなし */
//extern NSString const *kNCMBErrorServiceNotFound;
//
///*! @abstract E404003 該当フィールドなし */
//extern NSString const *kNCMBErrorFieldNotFound;
//
///*! @abstract E404004 該当デバイストークンなし */
//extern NSString const *kNCMBErrorDeviceTokenNotFound;
//
///*! @abstract E404005 該当アプリケーションなし */
//extern NSString const *kNCMBErrorApplicationNotFound;
//
//
///*! @abstract E405001 リクエストURI/メソッドが不許可 */
//extern NSString const *kNCMBErrorMethodNotAllowed;
//
//
///*! @abstract E409001 重複エラー。項目によって一意の内容が異なる */
//extern NSString const *kNCMBErrorDuplicateValue;
//
//
///*! @abstract E413001 1ファイルあたりのサイズ上限エラー */
//extern NSString const *kNCMBErrorFileTooLarge;
//
//
///*! @abstract E413002 ドキュメントあたりのサイズ上限エラー */
//extern NSString const *kNCMBErrorEntityTooLarge;
//
//
///*! @abstract E413003 複数オブジェクト一括操作の上限エラー */
//extern NSString const *kNCMBErrorTooManyOperations;
//
//
///*! @abstract E415001 サポート対象外のContent-Typeを指定 */
//extern NSString const *kNCMBErrorUnsupportedMediaType;
//
//
///*! @abstract E429001 使用制限（APIコール数、PUSH通知数、ストレージ容量）超過 */
//extern NSString const *kNCMBErrorRestricted;
//
///*! @abstract E500001 (Internal Server Error) */
//extern NSString const *kNCMBErrorInternalServerError;
//
///*! @abstract E502001 (Bad Gateway) */
//extern NSString const *kNCMBErrorStorageError;
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
//#import "NCMBError.h"
//
//
//NSString const *kNCMBErrorDomain = @"com.nifcloud.mbaas";
public let kNCMBErrorDomain = "com.nifcloud.mbaas"
//
//NSInteger const NCMBErrorFacebookLoginCancelled = 401004;
public let NCMBErrorFacebookLoginCancelled = 401004
//
//NSString const *kNCMBErrorInvalidJson = @"E400001";
public let kNCMBErrorInvalidJson = "E400001"
//NSString const *kNCMBErrorInvalidType = @"E400002";
public let kNCMBErrorInvalidType = "E400002"
//NSString const *kNCMBErrorRequired = @"E400003";
public let kNCMBErrorRequired = "E400003"
//NSString const *kNCMBErrorInvalidFormat = @"E400004";
public let kNCMBErrorInvalidFormat = "E400004"
//NSString const *kNCMBErrorNotEfficientValue =@"E400005";
public let kNCMBErrorNotEfficientValue = "E400005"
//NSString const *kNCMBErrorMissingValue = @"E400006";
public let kNCMBErrorMissingValue = "E400006"
//NSString const *kNCMBErrorNotCoexistValue = @"E400008";
public let kNCMBErrorNotCoexistValue = "E400008"
//NSString const *kNCMBErrorDigitTooLarge = @"E400009";
public let kNCMBErrorDigitTooLarge = "E400009"
//
//
//NSString const *kNCMBErrorInvalidAuthHeader =@"E401001";
public let kNCMBErrorInvalidAuthHeader = "E401001"
//NSString const *kNCMBErrorAuthFailure = @"E401002";
public let kNCMBErrorAuthFailure = "E401002"
//NSString const *kNCMBErrorOAuthFailure = @"E401003";
public let kNCMBErrorOAuthFailure = "E401003"
//
//
//NSString const *kNCMBErrorOperationForbiddenByACL = @"E403001";
public let kNCMBErrorOperationForbiddenByACL = "E403001"
//NSString const *kNCMBErrorOperationForbiddenByUserType = @"E403002";
public let kNCMBErrorOperationForbiddenByUserType = "E403002"
//NSString const *kNCMBErrorOperationForbidden = @"E403003";
public let kNCMBErrorOperationForbidden = "E403003"
//NSString const *kNCMBErrorExpiredOnetimeKey = @"E403004";
public let kNCMBErrorExpiredOnetimeKey = "E403004"
//NSString const *kNCMBErrorInvalidSettingName = @"E403005";
public let kNCMBErrorInvalidSettingName = "E403005"
//
//
//NSString const *kNCMBErrorDataNotFound = @"E404001";
public let kNCMBErrorDataNotFound = "E404001"
//NSString const *kNCMBErrorServiceNotFound = @"E404002";
public let kNCMBErrorServiceNotFound = "E404002"
//NSString const *kNCMBErrorFieldNotFound = @"E404003";
public let kNCMBErrorFieldNotFound = "E404003"
//NSString const *kNCMBErrorDeviceTokenNotFound = @"E404004";
public let kNCMBErrorDeviceTokenNotFound = "E404004"
//NSString const *kNCMBErrorApplicationNotFound = @"E404005";
public let kNCMBErrorApplicationNotFound = "E404005"
//
//NSString const *kNCMBErrorMethodNotAllowed = @"E405001";
public let kNCMBErrorMethodNotAllowed = "E405001"
//
//
//NSString const *kNCMBErrorDuplicateValue = @"E409001";
public let kNCMBErrorDuplicateValue = "E409001"
//
//
//NSString const *kNCMBErrorFileTooLarge = @"E413001";
public let kNCMBErrorFileTooLarge = "E413001"
//NSString const *kNCMBErrorEntityTooLarge = @"E413002";
public let kNCMBErrorEntityTooLarge = "E413002"
//NSString const *kNCMBErrorTooManyOperations = @"E413003";
public let kNCMBErrorTooManyOperations = "E413003"
//
//NSString const *kNCMBErrorUnsupportedMediaType = @"E415001";
public let kNCMBErrorUnsupportedMediaType = "E415001"
//
//NSString const *kNCMBErrorRestricted = @"E429001";
public let kNCMBErrorRestricted = "E429001"
//
//
//NSString const *kNCMBErrorInternalServerError = @"E500001";
public let kNCMBErrorInternalServerError = "E500001"
//
//
//NSString const *kNCMBErrorStorageError = @"E502001";
public let kNCMBErrorStorageError = "E502001"
//

public enum NCMBError: Error {
    case badResponse
    case noLoginUser
    case unknownError
    case empty
}
