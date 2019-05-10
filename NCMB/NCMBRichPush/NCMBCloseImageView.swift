//
//  NCMBCloseImageView.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/02.
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
//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
import UIKit
//
//#define IMAGE_SIZE 15
let IMAGE_SIZE: CGFloat = 15
//
//@interface NCMBCloseImageView : UIView
public class NCMBCloseImageView: UIView {
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
//#import "NCMBCloseImageView.h"
//
//
//@implementation NCMBCloseImageView
//- (id)initWithFrame:(CGRect)frame
//{
    public override init(frame: CGRect) {
//    self = [super initWithFrame:frame];
        super.init(frame: frame)
//    if (self) {
//        // Initialization code
//        self.backgroundColor = UIColor.clearColor; //背景を透明に
        self.backgroundColor = .clear
//    }
//    return self;
//}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //
//- (void)drawRect:(CGRect)rect{
    public override func draw(_ rect: CGRect) {
//    CGContextRef context = UIGraphicsGetCurrentContext();
        if let context = UIGraphicsGetCurrentContext() {
//
//    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1.0);
            context.setStrokeColor(red: 1, green: 1, blue: 1, alpha: 1.0)
//    CGContextSetLineWidth(context, 2.0);
            context.setLineWidth(2.0)
//    CGContextSetLineCap(context, kCGLineCapButt);
            context.setLineCap(.butt)
//
//    CGContextMoveToPoint(context, 1, 1);
            context.move(to: CGPoint(x: 1, y: 1))
//    CGContextAddLineToPoint(context, IMAGE_SIZE, IMAGE_SIZE);
            context.addLine(to: CGPoint(x: IMAGE_SIZE, y: IMAGE_SIZE))
//    CGContextStrokePath(context);
            context.strokePath()
//
//    CGContextMoveToPoint(context, 1, IMAGE_SIZE);
            context.move(to: CGPoint(x: 1, y: IMAGE_SIZE))
//    CGContextAddLineToPoint(context, IMAGE_SIZE, 1);
            context.addLine(to: CGPoint(x: IMAGE_SIZE, y: 1))
//    CGContextStrokePath(context);
            context.strokePath()
        }
//
//}
    }
//
//@end
}
