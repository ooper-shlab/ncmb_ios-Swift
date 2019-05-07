//
//  NCMBDateFormat.swift
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
//
///**
// NCMB内で使用するNSDateFormatterを管理するクラスです。
// */
//@interface NCMBDateFormat : NSObject
class NCMBDateFormat {
//
///**
// ISO 8601形式の時刻表記でDateFormatを作成します。
// @return ISO 8601形式のNSDateFormatter
// */
//+ (NSDateFormatter *) getIso8601DateFormat;
//
///**
// ファイル名に使用されるDateFormatを作成します。
// @return ファイル名用のNSDateFormatter
// */
//+ (NSDateFormatter *) getFileNameDateFormat;
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
//#import "NCMBDateFormat.h"
//
//@implementation NCMBDateFormat
//
///**
// ISO 8601形式の時刻表記でDateFormatを作成します。
// @return ISO 8601形式のNSDateFormatter
// */
//+ (NSDateFormatter *) getIso8601DateFormat {
    //### DateFormatter can be re-used
    private static let _iso8601DateFormatter = createDateFormater(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    public static func getIso8601DateFormat() -> DateFormatter {
//
//    return [self createDateFormater:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
        return _iso8601DateFormatter
//}
    }
//
///**
// ファイル名に使用されるDateFormatを作成します。
// @return ファイル名用のNSDateFormatter
// */
//+ (NSDateFormatter *) getFileNameDateFormat {
    //### DateFormatter can be re-used
    private static let _fileNameDateFormatter = createDateFormater(dateFormat: "yyyyMMddHHmmssSSSS")
    public static func getFileNameDateFormat() -> DateFormatter {
//
//    return [self createDateFormater:@"yyyyMMddHHmmssSSSS"];
        return _fileNameDateFormatter
//}
    }
//
//+ (NSDateFormatter *) createDateFormater:(NSString *)dateFormat {
    private static func createDateFormater(dateFormat: String) -> DateFormatter {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        let dateFormatter = DateFormatter()
//    //和暦表示と12時間表示対策
//    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//    [dateFormatter setDateFormat:dateFormat];
        dateFormatter.dateFormat = dateFormat
//
//    return dateFormatter;
        return dateFormatter
//}
    }
//
//@end
}
