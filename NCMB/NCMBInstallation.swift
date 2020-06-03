//
//  NCMBInstallation.swift
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
//#import "NCMBObject.h"
import Foundation
//
//@class NCMBQuery;
private let DATA_CURRENTINSTALLATION_PATH = "\(DATA_MAIN_PATH)/Private Documents/NCMB/currentInstallation"
//
///**
// NCMBInstallationクラスは、端末情報の登録・更新・取得・削除を行うクラスです。
// */
//@interface NCMBInstallation : NCMBObject
public class NCMBInstallation: NCMBObject {
//
///// deviceType 登録された端末の種類
//@property (nonatomic, readonly) NSString *deviceType;
    private(set) public var deviceType: String?
///// deviceToken 登録された端末のデバイストークン
//@property (nonatomic) NSString *deviceToken;
///// badge バッジ数
//@property (nonatomic) NSInteger badge;
///// timeZone タイムゾーン
//@property (nonatomic, readonly) NSString *timeZone;
    private(set) public var timeZone: String?
///// channels 登録されたチャネルリスト
//@property (nonatomic) NSMutableArray *channels;
//
///**
// installationクラスを検索するためのNCMBQueryを生成
// @return installationクラスを検索するように設定されたNCMBQueryのインスタンスを返却する
// */
//+ (NCMBQuery *)query;
//
///**
// アプリが動作している端末のNCMBInstallationを取得する。
// すでに端末情報をmobile backend上に登録しており、
// アプリ内にその情報が保存されている場合は、アプリ内から端末情報を取得する。
// アプリ内に情報が保存されていなかった場合は、デバイストークンなどが設定されていないNCMBInstallationのインスタンスを返却する
// @return NCMBInstallationのインスタンスを返却する
// */
//+ (NCMBInstallation *)currentInstallation;
//
///**
// デバイストークンを設定する
// @param deviceTokenData NSData型のデバイストークン
// */
//- (void)setDeviceTokenFromData:(NSData *)deviceTokenData;
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
//#import "NCMBInstallation.h"
//#import "NCMBQuery.h"
//#import "NCMBACL.h"
//
//#import "NCMBObject+Private.h"
//
//#define DATA_CURRENTINSTALLATION_PATH [NSString stringWithFormat:@"%@/Private Documents/NCMB/currentInstallation", DATA_MAIN_PATH]
//
//@implementation NCMBInstallation
//
//+(NCMBQuery*)query{
    public override static func query() -> NCMBQuery {
//    NCMBQuery *query = [NCMBQuery queryWithClassName:@"installation"];
        let query = NCMBQuery(className: "installation")
//    return query;
        return query
//}
    }
//
//- (void)setDeviceTokenFromData:(NSData *)deviceTokenData{
    public func setDeviceToken(from deviceTokenData: Data) {
//    if ([deviceTokenData isKindOfClass:[NSData class]] && [deviceTokenData length] != 0){
        if !deviceTokenData.isEmpty {
//        const unsigned char *dataBuffer = deviceTokenData.bytes;
//        NSMutableString *token  = [NSMutableString stringWithCapacity:(deviceTokenData.length * 2)];
//        for (int i = 0; i < deviceTokenData.length; ++i) {
//            [token appendFormat:@"%02x", dataBuffer[i]];
//        }
            let tokenId = deviceTokenData.hexString
//        [self setObject:tokenId forKey:@"deviceToken"];
            self.setObject(tokenId, forKey: "deviceToken")
//    } else {
        } else {
//        [self setObject:nil forKey:@"deviceToken"];
            self.setObject(nil, forKey: "deviceToken")
//        #if DEBUG
            #if DEBUG
//            NSLog(@"不正なデバイストークのため、端末登録を行いません");
                NSLog("不正なデバイストークのため、端末登録を行いません");
//        #endif
            #endif
//    }
        }
//}
    }
//
//-(NSDictionary*)getLocalData{
    override func getLocalData() -> [String : Any] {
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[super getLocalData]];
        var dic = super.getLocalData()
//    if (self.deviceType){
        if let deviceType = self.deviceType {
//        [dic setObject:self.deviceType forKey:@"deviceType"];
            dic["deviceType"] = deviceType
//    }
        }
//    if (self.deviceToken){
        if let deviceToken = self.deviceToken {
//        [dic setObject:self.deviceToken forKey:@"deviceToken"];
            dic["deviceToken"] = deviceToken
//    }
        }
//    if (self.badge){
        if self.badge != 0 {
//        [dic setObject:[NSNumber numberWithInteger:self.badge] forKey:@"badge"];
            dic["badge"] = badge
//    }
        }
//    if (self.timeZone){
        if let timeZone = self.timeZone {
//        [dic setObject:self.timeZone forKey:@"timeZone"];
            dic["timeZone"] = timeZone
//    }
        }
//    if (self.channels){
        if !self.channels.isEmpty {
//        [dic setObject:self.channels forKey:@"channels"];
            dic["channels"] = channels
//    }
        }
//    return dic;
        return dic
//}
    }
//
//- (instancetype)init{
    public required init() {
//    NCMBInstallation *installation = [self initWithClassName:@"installation"];
        self.timeZone = TimeZone.current.identifier
        super.init(className: "installation")
//    installation.channels = [NSMutableArray array];
//    [installation setObject:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]
        self.setObject(Bundle.main.infoDictionary!["CFBundleName"], forKey: "applicationName")
//                     forKey:@"applicationName"];
//    [installation setObject:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
        self.setObject(Bundle.main.infoDictionary!["CFBundleVersion"], forKey: "appVersion")
//                     forKey:@"appVersion"];
//    [installation setObject:SDK_VERSION forKey:@"sdkVersion"];
        self.setObject(SDK_VERSION, forKey: "sdkVersion")
//    [installation setObject:@"ios" forKey:@"deviceType"];
        self.setObject("ios", forKey: "deviceType")
//
//    NSTimeZone *tz = [NSTimeZone systemTimeZone];
//    [installation setObject:[tz name] forKey:@"timeZone"];
//    return installation;
//}
    }
    //
//+(NCMBInstallation*)installation{
//    return [[NCMBInstallation alloc] init];
//}
//
//+(NCMBInstallation*)currentInstallation{
    public static func current() -> NCMBInstallation {
//    if ([[NSFileManager defaultManager] fileExistsAtPath:DATA_CURRENTINSTALLATION_PATH isDirectory:nil]) {
        if FileManager.default.fileExists(atPath: DATA_CURRENTINSTALLATION_PATH) {
//        NSError *error = nil;
            do {
//        NSData *localData = [NSData dataWithContentsOfFile:DATA_CURRENTINSTALLATION_PATH
//                                                   options:kNilOptions
//                                                     error:&error];
                let localData = try Data(contentsOf: URL(fileURLWithPath: DATA_CURRENTINSTALLATION_PATH))
//        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:localData
//                                                             options:kNilOptions
//                                                               error:&error];
                let json = try JSONSerialization.jsonObject(with: localData) as! [String: Any]
//        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[json objectForKey:@"data"]];
                var dic = json["data"] as! [String: Any]
//        NSString *sdkVer = [dic objectForKey:@"sdkVersion"];
                let sdkVer = dic["sdkVersion"] as? String
//        NSString *appVer = [dic objectForKey:@"appVersion"];
                let appVer = dic["appVersion"] as? String
//        NSString *newSdkVer = SDK_VERSION;
                let newSdkVer = SDK_VERSION
//        NSString *newAppVer = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
                let newAppVer = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
//        //SDKバージョンとアプリバージョンの更新
//        if (![newSdkVer isEqualToString:sdkVer]){
                if newSdkVer != sdkVer {
//            [dic setObject:newSdkVer
//                                            forKey:@"sdkVersion"];
                    dic["sdkVersion"] = newSdkVer
//        }
                }
//        if (![newAppVer isEqualToString:appVer]){
                if newAppVer != appVer {
//            [dic setObject:newAppVer forKey:@"appVersion"];
                    dic["appVersion"] = newAppVer
//        }
                }
//        NCMBInstallation *installation = [NCMBInstallation installation];
                let installation = NCMBInstallation()
//        [installation afterFetch:[NSMutableDictionary dictionaryWithDictionary:dic]
//                       isRefresh:NO];
                installation.afterFetch(dic, isRefresh: false)
//        return installation;
                return installation
            } catch {
                return NCMBInstallation()
            }
//    }else{
        } else {
//        return [NCMBInstallation installation];
            return NCMBInstallation()
//    }
        }
//}
    }
//
//#pragma mark setter
//
//- (void)setDeviceToken:(NSString *)deviceToken{
    private func setDeviceToken(_ deviceToken: String?) {
//    [self setObject:deviceToken forKey:@"deviceToken"];
        self.setObject(deviceToken, forKey: "deviceToken")
//}
    }
//
//- (void)setChannels:(NSMutableArray *)channels{
    private func setChannels(_ channels: [Any]) {
//    if ([channels isKindOfClass:[NSArray class]] && [channels count] != 0){
        if !channels.isEmpty {
//        [self setObject:channels forKey:@"channels"];
            self.setObject(channels, forKey: "channels")
//    }
        }
//}
    }
//
//- (void)setBadge:(NSInteger)badge{
    private func setBadge(_ badge: Int) {
//    [self setObject:[NSNumber numberWithInteger:badge] forKey:@"badge"];
        self.setObject(badge as NSNumber, forKey: "badge")
//}
    }
//
//#pragma mark getter
//
//- (NSString*)deviceToken{
    public var deviceToken: String? {
//    return [self objectForKey:@"deviceToken"];
        get {
            return self.object(forKey: "deviceToken") as? String
        }
        set {
            setDeviceToken(newValue)
        }
//}
    }
//
//- (NSMutableArray*)channels{
    public var channels: [Any] {
//    return [self objectForKey:@"channels"];
        get {
            return self.object(forKey: "channels") as? [Any] ?? []
        }
        set {
            setChannels(newValue)
        }
//}
    }
//
//- (NSInteger)badge{
    public var badge: Int {
//    return [[self objectForKey:@"badge"] integerValue];
        get {
            return self.object(forKey: "badge") as? Int ?? 0
//}
        }
        set {
            setBadge(newValue)
        }
    }
//
//#pragma  mark override
//
//- (void)afterFetch:(NSMutableDictionary *)response isRefresh:(BOOL)isRefresh{
    public override func afterFetch(_ response: [String : Any], isRefresh: Bool) {
//    [super afterFetch:response isRefresh:isRefresh];
        super.afterFetch(response, isRefresh: isRefresh)
//    if ([response objectForKey:@"deviceToken"]){
        if let deviceToken = response["deviceToken"] as? String {
//        self.deviceToken = [response objectForKey:@"deviceToken"];
            self.deviceToken = deviceToken
//    }
        }
//    if ([response objectForKey:@"channels"]){
        if let channels = response["channels"] as? [Any] {
//        self.channels = [NSMutableArray arrayWithArray:[response objectForKey:@"channels"]];
            self.channels = channels
//    }
        }
//    if ([response objectForKey:@"badge"]){
        if let badge = response["badge"] as? Int {
//        self.badge = [[response objectForKey:@"badge"] integerValue];
            self.badge = badge
//    }
        }
//    if ([response objectForKey:@"deviceType"]){
        if let deviceType = response["deviceType"] as? String {
//        _deviceType = [response objectForKey:@"deviceType"];
            self.deviceType = deviceType
//    }
        }
//    if ([response objectForKey:@"timeZone"]){
        if let timeZone = response["timeZone"] as? String {
//        _timeZone = [response objectForKey:@"timeZone"];
            self.timeZone = timeZone
//    }
        }
//}
    }
//
//- (void)afterDelete{
    override func afterDelete() {
//    [super afterDelete];
        super.afterDelete()
//    self.badge = 0;
        self.badge = 0
//    self.channels = nil;
        self.channels = []
//    self.deviceToken = nil;
        self.deviceToken = nil
//    _deviceType = nil;
        deviceType = nil
//    _timeZone = nil;
        timeZone = nil
//    if ([[NSFileManager defaultManager] fileExistsAtPath:DATA_CURRENTINSTALLATION_PATH isDirectory:nil]) {
        if FileManager.default.fileExists(atPath: DATA_CURRENTINSTALLATION_PATH) {
//        [[NSFileManager defaultManager] removeItemAtPath:DATA_CURRENTINSTALLATION_PATH error:nil];
            _ = try? FileManager.default.removeItem(atPath: DATA_CURRENTINSTALLATION_PATH)
//    }
        }
//
//}
    }
//
//- (void)afterSave:(NSDictionary *)response operations:(NSMutableDictionary *)operations{
    override func afterSave(_ response: [String : Any], operations: NCMBOperationSet?) {
//    [super afterSave:response operations:operations];
        super.afterSave(response, operations: operations)
//    //ファイルに現在のinstallationを保存する
//    [self saveInstallationToFile];
        self.saveInstallationToFile()
//}
    }
//
//#pragma mark saveToFile
//
//- (void)saveInstallationToFile{
    private func saveInstallationToFile() {
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        var dic: [String: Any] = [:]
//    for (NSString *key in [estimatedData keyEnumerator]){
        for (key, value) in estimatedData {
//        [dic setObject:[self convertToJSONFromNCMBObject:[estimatedData objectForKey:key]]
//                forKey:key];
            dic[key] = self.convertToJSONFromNCMBObject(value)
//    }
        }
//
//    if (self.objectId){
        if let objectId = self.objectId {
//        [dic setObject:self.objectId forKey:@"objectId"];
            dic["objectId"] = objectId
//    }
        }
//    if (self.createDate){
        if let createDate = self.createDate {
//        NSDateFormatter *df = [self createNCMBDateFormatter];
            let df = self.createNCMBDateFormatter()
//        [dic setObject:[df stringFromDate:self.createDate] forKey:@"createDate"];
            dic["createDate"] = df.string(from: createDate)
//    }
        }
//    if (self.updateDate){
        if let updateDate = self.updateDate {
//        NSDateFormatter *df = [self createNCMBDateFormatter];
            let df = self.createNCMBDateFormatter()
//        [dic setObject:[df stringFromDate:self.updateDate] forKey:@"updateDate"];
            dic["updateDate"]  = df.string(from: updateDate)
//    }
        }
//    if (self.ACL){
        if let acl = self.acl {
//        [dic setObject:self.ACL.dicACL forKey:@"acl"];
            dic["acl"] = acl.dicACL
//    }
        }
//    if (self.deviceToken){
        if let deviceToken = self.deviceToken {
//        [dic setObject:self.deviceToken forKey:@"deviceToken"];
            dic["deviceToken"] = deviceToken
//    }
        }
//    if (self.channels){
        if !self.channels.isEmpty {
//        [dic setObject:self.channels forKey:@"channels"];
            dic["channels"] = self.channels
//    }
        }
//    if (self.badge){
        if self.badge != 0 {
//        [dic setObject:[NSNumber numberWithInteger:self.badge] forKey:@"badge"];
            dic["badge"] = self.badge
//    }
        }
//    NSMutableDictionary *saveDictionary = [NSMutableDictionary dictionary];
        let saveDictionary: [String: Any] = [
//    [saveDictionary setObject:dic forKey:@"data"];
            "data": dic,
//    [saveDictionary setObject:@"installation" forKey:@"className"];
            "className": "installation"]
//    NSError *error = nil;
        do {
//    NSData *data = [NSJSONSerialization dataWithJSONObject:saveDictionary
        let data = try JSONSerialization.data(withJSONObject: saveDictionary)
//                                                   options:kNilOptions
//                                                     error:&error];
//    [data writeToFile:DATA_CURRENTINSTALLATION_PATH atomically:YES];
            try data.write(to: URL(fileURLWithPath: DATA_CURRENTINSTALLATION_PATH), options: .atomic)
        } catch {
            print(error)
        }
//}
    }
//
//@end
}
