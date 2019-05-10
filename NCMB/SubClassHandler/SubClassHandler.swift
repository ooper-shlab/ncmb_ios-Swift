//
//  SubClassHandler.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/01.
//  Copyright © 2019 systena. All rights reserved.
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
///**
// サブクラスを保持する
// */
//
//#import <Foundation/Foundation.h>
import Foundation
//#define Subclass_Handler [SubClassHandler sharedInstance]
public let Subclass_Handler = SubClassHandler.shared
//@interface SubClassHandler : NSObject
public class SubClassHandler {
//
//-(NSString *)className:(NSString *)ncmbClassName;
//-(void)setSubClassName:(NSString *)className ncmbClassName:(NSString *)ncmbClassName;
//+(SubClassHandler*)sharedInstance;
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
// **********/
//
//#import "SubClassHandler.h"
//
//@interface SubClassHandler()
//@property (strong ,nonatomic) NSMutableDictionary *dicSubclass;
    private var dicSubclass: [String: String] = [:]
//
//@end
//
//@implementation SubClassHandler
//static SubClassHandler *subClassHandler= nil;
//
//#pragma mark - 取得
//
//-(NSString *)className:(NSString *)ncmbClassName{
    public func className(_ ncmbClassName: String) -> String? {
//    return [self.dicSubclass objectForKey:ncmbClassName];
        return self.dicSubclass[ncmbClassName]
//}
    }
//#pragma mark - 登録
//
//-(void)setSubClassName:(NSString *)className ncmbClassName:(NSString *)ncmbClassName{
    public func setSubClassName(_ className: String?, ncmbClassName: String) {
//    [self.dicSubclass setObject:className forKey:ncmbClassName];
        self.dicSubclass[ncmbClassName] = className
//}
    }
//
//#pragma mark = init
//
//-(id)init{
//    if((self = [super init])){
//        self.dicSubclass = [[NSMutableDictionary alloc] init];
//    }
//    return self;
//}
//
//#pragma mark - shared
//
//+(SubClassHandler*)sharedInstance{
//    if(!subClassHandler) subClassHandler = [[SubClassHandler alloc] init];
    public static let shared = SubClassHandler()
//    return subClassHandler;
//}
//
//@end
}
