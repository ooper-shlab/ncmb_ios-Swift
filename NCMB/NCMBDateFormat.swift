//
//  NCMBDateFormat.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/01
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
 NCMB内で使用するNSDateFormatterを管理するクラスです。
 */
class NCMBDateFormat {

    //### DateFormatter can be re-used
    private static let _iso8601DateFormatter = createDateFormater(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    /**
     ISO 8601形式の時刻表記でDateFormatを作成します。
     @return ISO 8601形式のNSDateFormatter
     */
    public static func getIso8601DateFormat() -> DateFormatter {

        return _iso8601DateFormatter
    }

    //### DateFormatter can be re-used
    private static let _fileNameDateFormatter = createDateFormater(dateFormat: "yyyyMMddHHmmssSSSS")
    /**
     ファイル名に使用されるDateFormatを作成します。
     @return ファイル名用のNSDateFormatter
     */
    public static func getFileNameDateFormat() -> DateFormatter {

        return _fileNameDateFormatter
    }

    private static func createDateFormater(dateFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        //和暦表示と12時間表示対策
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter
    }

}
