//
//  NCMBDeleteOperation.swift
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
//
//@interface NCMBDeleteOperation : NSObject
public class NCMBDeleteOperation: NCMBOperation {
//
//- (id)getValue;
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key;
//
//- (id)encode;
//
//- (id)mergeWithPrevious:(id)previous;
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
//#import "NCMBDeleteOperation.h"
//
//@implementation NCMBDeleteOperation
//
//-(id)encode{
    public func encode() -> Any {
//    return [NSNull null];
        return NSNull()
//}
    }
//
//- (id)getValue{
    public func getValue() -> Any? {
//    return nil;
        return nil
//}
    }
//
//- (id)apply:(id)oldValue NCMBObject:(id)object forkey:(NSString *)key{
    public func apply(_ oldValue: Any?, ncmbObject object: NCMBObject?, for key: String?) -> Any? {
//    return nil;
        return nil
//}
    }
//
//- (id)mergeWithPrevious:(id)previous{
    public func merge(previous: NCMBOperation?) -> NCMBOperation {
//    return self;
        return self
//}
    }
//
//@end
}
