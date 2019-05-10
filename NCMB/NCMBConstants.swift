//
//  NCMBConstants.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/01
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
//@class NCMBUser;
//@class NCMBObject;
//
//
//#pragma mark - error
//#define ERRORDOMAIN @"NCMBErrorDomain"
public let ERRORDOMAIN = "NCMBErrorDomain"
//#define SDK_VERSION @"3.0.1"
public let SDK_VERSION = "3.0.1"
//
//#define DATA_MAIN_PATH [NSHomeDirectory() stringByAppendingPathComponent:@"Library/"]
public let DATA_MAIN_URL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
public let DATA_MAIN_PATH = DATA_MAIN_URL.path
//#define COMMAND_CACHE_FOLDER_PATH [NSString stringWithFormat:@"%@/Private Documents/NCMB/Command Cache/", DATA_MAIN_PATH]
public let COMMAND_CACHE_FOLDER_PATH = "\(DATA_MAIN_PATH)/Private Documents/NCMB/Command Cache/"
//
//#define API_VERSION_V1 @"2013-09-01"
public let API_VERSION_V1 = "2013-09-01"
//
///// コールバックブロック
//typedef void (^NCMBBooleanResultBlock)(BOOL succeeded, NSError *error);
public typealias NCMBBooleanResultBlock = (Result<Bool,Error>)->Void
//typedef void (^NCMBIntegerResultBlock)(int number, NSError *error);
public typealias NCMBIntegerResultBlock = (Result<Int,Error>)->Void
//typedef void (^NCMBObjectResultBlock)(NCMBObject *object, NSError *error);
public typealias NCMBObjectResultBlock = (Result<NCMBObject?,Error>)->Void
//typedef void (^NCMBArrayResultBlock)(NSArray *objects, NSError *error);
public typealias NCMBArrayResultBlock = (Result<[Any],Error>)->Void
//typedef void (^NCMBSetResultBlock)(NSSet *channels, NSError *error);
public typealias NCMBSetResultBlock = (Result<Set<AnyHashable>,Error>)->Void
//typedef void (^NCMBUserResultBlock)(NCMBUser *user, NSError *error);
public typealias NCMBUserResultBlock = (Result<NCMBUser,Error>)->Void
//typedef void (^NCMBErrorResultBlock) (NSError *error);
public typealias NCMBErrorResultBlock = (Error?)->Void
//typedef void (^NCMBAnyObjectResultBlock)(id object, NSError *error);
public typealias NCMBAnyObjectResultBlock = (Result<Any,Error>)->Void
//
//typedef void (^NCMBDataResultBlock)(NSData *data, NSError *error);
public typealias NCMBDataResultBlock = (Result<Data,Error>)->Void
//typedef void (^NCMBDataStreamResultBlock)(NSInputStream *stream, NSError *error);
public typealias NCMBDataStreamResultBlock = (Result<InputStream,Error>)->Void
//typedef void (^NCMBProgressBlock)(int percentDone);
public typealias NCMBProgressBlock = (Int)->Void
