//
//  NCMBRichPushView.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/02.
//  Copyright © 2019 systena. All rights reserved.
//

///*
// Copyright 2017-2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
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
//#import <Webkit/Webkit.h>
import WebKit
//
//@interface NCMBRichPushView : UIViewController
class NCMBRichPushView: UIViewController, WKNavigationDelegate {
//
//- (void) appearWebView:(UIInterfaceOrientation)interfaceOrientation url:(NSString*)richUrl;
//- (void) sizingWebView:(UIInterfaceOrientation)interfaceOrientation;
//- (void) closeWebView:(id)sender;
//
//@end
///*
// Copyright 2017-2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
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
//#import "NCMBRichPushView.h"
//#import "NCMBCloseImageView.h"
//#import "NCMBPush.h"
//
//#define SIZE_OF_STATUS_BAR 20.0
    private let SIZE_OF_STATUS_BAR: CGFloat = 20.0
//#define DEFAULT_MARGIN_WIDTH 10
    private let DEFAULT_MARGIN_WIDTH: CGFloat = 10
//#define DEFAULT_MARGIN_HEIGHT 10
    private let DEFAULT_MARGIN_HEIGHT: CGFloat = 10
//#define CLOSE_IMAGE_FRAME_SIZE 20.0
    private let CLOSE_IMAGE_FRAME_SIZE: CGFloat = 20.0
//#define CLOSE_BUTTON_WIDTH 70.0
    private let CLOSE_BUTTON_WIDTH: CGFloat = 70.0
//#define CLOSE_BUTTON_HEIGHT 20.0
    private let CLOSE_BUTTON_HEIGHT: CGFloat = 20.0
//#define CLOSE_BUTTON_BOTTOM_MARGIN 5.0
    private let CLOSE_BUTTON_BOTTOM_MARGIN: CGFloat = 5.0
//#define CLOSE_BUTTON_LEFT_MARGIN 20.0
    private let CLOSE_BUTTON_LEFT_MARGIN: CGFloat = 20.0
//
//@interface NCMBRichPushView() <UIWebViewDelegate, UIActionSheetDelegate>
//
//@property (nonatomic) UIView *cv; //clear view
    private var cv: UIView?
//@property (nonatomic) UIView *uv; //ui view
    private var uv: UIView?
//@property (nonatomic) WKWebView *wv; // web view
    private var wv: WKWebView?
//@property (nonatomic) UIButton* closeButton;
    private var closeButton: UIButton?
//
//@end
//
//@implementation NCMBRichPushView
//
//enum{
    private enum ActivityIndicator: Int {
//    ActivityIndicatorBackgroundTag = 10000,
        case backgroundTag = 10000
//    ActivityIndicatorTag = 10001,
        case tag = 10001
//};
    }
//
//- (void)appearWebView:(UIInterfaceOrientation)interfaceOrientation url:(NSString*)richUrl{
    public func appearWebView(_ interfaceOrientation: UIInterfaceOrientation, url richUrl: String) {
//    //Regist Notification for rotate event.
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
//    [[NSNotificationCenter defaultCenter] addObserver:self
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(resizeWebView(notification:)),
            name: UIDevice.orientationDidChangeNotification,
            object: nil)
//                                             selector:@selector(resizeWebViewWithNotification:)
//                                                 name:UIDeviceOrientationDidChangeNotification
//                                               object:nil];
//
//    UIWindow* window = [[UIApplication sharedApplication].windows lastObject];
        let window = UIApplication.shared.windows.last!
//    [window makeKeyAndVisible];
        window.makeKeyAndVisible()
//
//    self.cv = [[UIView alloc] initWithFrame:window.frame];
        self.cv = UIView(frame: window.frame)
//    self.cv.backgroundColor = [UIColor clearColor];
        self.cv?.backgroundColor = .clear
//
//
//    self.uv = [[UIView alloc]init];
        self.uv = UIView()
//
//    self.wv = [[WKWebView alloc]init];
        let config = WKWebViewConfiguration()
        self.wv = WKWebView(frame: .zero, configuration: config)
//
//    //make instance of closeImageView
//    NCMBCloseImageView *closeImage = [[NCMBCloseImageView alloc]initWithFrame:CGRectMake(0, 5, CLOSE_BUTTON_WIDTH, CLOSE_IMAGE_FRAME_SIZE)];
        let closeImage = CloseImageGenerator(frame: CGRect(x: 0, y: 5, width: CLOSE_BUTTON_WIDTH, height: CLOSE_BUTTON_HEIGHT))
//
//    //allocate off screen for create UIImage
//    UIGraphicsBeginImageContextWithOptions(closeImage.frame.size, NO, 0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    //paste UIImage from off screen
//    [closeImage.layer renderInContext:context];
//    UIImage *renderedImage = UIGraphicsGetImageFromCurrentImageContext();
        let renderedImage = closeImage.makeUIImage()
//
//    self.uv.alpha = 0.0f;
        self.uv?.alpha = 0.0
//
//    //set button title
//    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.closeButton = UIButton(type: .custom)
//    [self.closeButton setTitle:@"close" forState:UIControlStateNormal];
        self.closeButton?.setTitle("close", for: .normal)
//
//    UIImageView *iv = [[UIImageView alloc] initWithImage:renderedImage];
        let iv = UIImageView(image: renderedImage)
//    iv.userInteractionEnabled = YES;
        iv.isUserInteractionEnabled = true
//
//    //set margin for close button text
//    [self.closeButton setTitleEdgeInsets:UIEdgeInsetsMake(0, CLOSE_BUTTON_LEFT_MARGIN, CLOSE_BUTTON_BOTTOM_MARGIN, 0)];
        self.closeButton?.titleEdgeInsets = UIEdgeInsets(top: 0, left: CLOSE_BUTTON_LEFT_MARGIN, bottom: CLOSE_BUTTON_BOTTOM_MARGIN, right: 0)
//
//    UIColor *tColorInHighlight = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.4];
        let tColorInHighlight = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.4)
//    [self.closeButton setTitleColor:tColorInHighlight forState:UIControlStateHighlighted];
        self.closeButton?.setTitleColor(tColorInHighlight, for: .highlighted)
//
//    //set background image for close button
//    [self.closeButton setBackgroundImage:renderedImage forState:UIControlStateNormal];
        self.closeButton?.setBackgroundImage(renderedImage, for: .normal)
//
//    //sizing rich push view
//    [self sizingWebView:interfaceOrientation];
        self.sizingWebView(interfaceOrientation)
        
//
//    //create instance for loading view's background
//    UIView* bg = [[UIView alloc] initWithFrame:(CGRect){0,0,self.wv.frame.size}];
        let bg = UIView(frame: CGRect(origin: .zero, size: self.wv!.frame.size))
//    bg.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        bg.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
//    bg.tag = ActivityIndicatorBackgroundTag;
        bg.tag = ActivityIndicator.tag.rawValue
//
//    //create instance for loading view
//    UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        let activity = UIActivityIndicatorView(style: .whiteLarge)
//    activity.tag = ActivityIndicatorTag;
        activity.tag = ActivityIndicator.tag.rawValue
//    activity.center = (CGPoint){bg.frame.size.width/2,bg.frame.size.height/2};
        activity.center = CGPoint(x: bg.frame.width/2, y: bg.frame.height/2)
//    [bg addSubview:activity];
        bg.addSubview(activity)
//    [self.wv addSubview:bg];
        self.wv!.addSubview(bg)
//
//    //set method for close button
//    [self.closeButton addTarget:self action:@selector(closeWebView:) forControlEvents:UIControlEventTouchUpInside];
        self.closeButton?.addTarget(self, action: #selector(closeWebView), for: .touchUpInside)
//
//    //add close button image to rich push view
//    [self.uv addSubview:self.closeButton];
        self.uv!.addSubview(self.closeButton!)
//
//    //set color of rich push view
//    UIColor *color = [UIColor blackColor];
//    UIColor *alpha = [color colorWithAlphaComponent:0.7];
        let alpha = UIColor.black.withAlphaComponent(0.7)
//    self.uv.backgroundColor = alpha;
        self.uv?.backgroundColor = alpha
//
//    //edit edge of view
//    self.uv.layer.cornerRadius = 5;
        self.uv?.layer.cornerRadius = 5
//    self.uv.clipsToBounds = YES;
        self.uv?.clipsToBounds = true
//
//    self.wv.navigationDelegate = self;
        self.wv?.navigationDelegate = self
//
//    //add subview to main view
//    [window.rootViewController.view addSubview:self.cv];
        window.rootViewController?.view.addSubview(self.cv!)
//    [self.uv addSubview:self.wv];
        self.uv?.addSubview(self.wv!)
//    [window.rootViewController.view addSubview:self.uv];
        window.rootViewController?.view.addSubview(self.uv!)
//
//    [UIView animateWithDuration:0.4f animations:^{
        UIView.animate(withDuration: 0.4) {
//        self.uv.alpha = 1.0f;
            self.uv?.alpha = 1.0
//    }];
        }
//
//    NSURL *url = [NSURL URLWithString:richUrl];
        let url = URL(string: richUrl)!
//    NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5];
        let req = URLRequest(url: url,
                             cachePolicy: .reloadIgnoringLocalCacheData,
                             timeoutInterval: 5)
//    [self.wv loadRequest:req];
        self.wv?.load(req)
//}
    }
//
//- (WKNavigation *)loadRequest:(NSURLRequest *)request{
    @discardableResult
    internal func load(request: URLRequest) -> WKNavigation? {
//    return [self.wv loadRequest:request];
        return self.wv?.load(request)
//}
    }
//
//- (void)resizeWebViewWithNotification:(NSNotification *)notification {
    @objc private func resizeWebView(notification: Notification) {
//    UIInterfaceOrientation orientation = [[UIApplication sharedApplication]statusBarOrientation];
        let orientation = UIApplication.shared.statusBarOrientation
//    [UIView animateWithDuration:[[UIApplication sharedApplication]statusBarOrientationAnimationDuration] animations:^{
        UIView.animate(withDuration: UIApplication.shared.statusBarOrientationAnimationDuration) {
//        [self sizingWebView:orientation];
            self.sizingWebView(orientation)
//    }];
        }
//}
    }
//
//- (void)transformUIVew:(CGFloat)angle{
    private func transformUIVew(angle: CGFloat) {
//    if ([[[UIDevice currentDevice] systemVersion] floatValue]  < 8.0){
        if #available(iOS 8.0, *) {
        } else {
//    /* xcodeのバージョンでエラーになってしまうので、使うのを保留
//    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1){
//     */
//        self.uv.transform = CGAffineTransformMakeRotation(angle);
            self.uv?.transform = CGAffineTransform(rotationAngle: angle)
//    }
        }
//}
    }
//
//- (void)sizingWebView:(UIInterfaceOrientation)interfaceOrientation {
    public func sizingWebView(_ interfaceOrientation: UIInterfaceOrientation) {
//
//    //setting value of webview size
//    CGRect windowSize = [[UIScreen mainScreen] bounds];
        let windowSize = UIScreen.main.bounds
//    float windowSizeWidth;
//    float windowSizeHeight;
//
//    windowSizeWidth = windowSize.size.width;
        let windowSizeWidth = windowSize.width
//    windowSizeHeight = windowSize.size.height;
        let windowSizeHeight = windowSize.height
//
//    switch (interfaceOrientation) {
        switch interfaceOrientation {
//        case UIInterfaceOrientationPortrait:{
        case .portrait:
//            [self transformUIVew:0];
            self.transformUIVew(angle: 0)
//            self.uv.frame = CGRectMake(DEFAULT_MARGIN_WIDTH, DEFAULT_MARGIN_HEIGHT + SIZE_OF_STATUS_BAR, windowSizeWidth - (DEFAULT_MARGIN_WIDTH * 2), windowSizeHeight -  (DEFAULT_MARGIN_HEIGHT * 2) - SIZE_OF_STATUS_BAR);
            self.uv!.frame = CGRect(x: DEFAULT_MARGIN_WIDTH, y: DEFAULT_MARGIN_HEIGHT + SIZE_OF_STATUS_BAR, width: windowSizeWidth - (DEFAULT_MARGIN_WIDTH * 2), height: windowSizeHeight -  (DEFAULT_MARGIN_HEIGHT * 2) - SIZE_OF_STATUS_BAR)
//            self.wv.frame = CGRectMake(DEFAULT_MARGIN_WIDTH, DEFAULT_MARGIN_HEIGHT, self.uv.bounds.size.width - DEFAULT_MARGIN_WIDTH * 2, self.uv.bounds.size.height - (DEFAULT_MARGIN_HEIGHT * 2) - CLOSE_IMAGE_FRAME_SIZE);
            self.wv!.frame = CGRect(x: DEFAULT_MARGIN_WIDTH, y: DEFAULT_MARGIN_HEIGHT, width: self.uv!.bounds.size.width - DEFAULT_MARGIN_WIDTH * 2, height: self.uv!.bounds.size.height - (DEFAULT_MARGIN_HEIGHT * 2) - CLOSE_IMAGE_FRAME_SIZE)
//
//            break;
//        }case UIInterfaceOrientationLandscapeLeft:{
        case .landscapeLeft:
//            [self transformUIVew:(-M_PI / 2.0)];
            self.transformUIVew(angle: -.pi/2.0)
//            self.uv.frame = CGRectMake(DEFAULT_MARGIN_HEIGHT + SIZE_OF_STATUS_BAR, DEFAULT_MARGIN_WIDTH, windowSizeWidth - (DEFAULT_MARGIN_HEIGHT * 2) - SIZE_OF_STATUS_BAR, windowSizeHeight - (DEFAULT_MARGIN_WIDTH * 2));
            self.uv!.frame = CGRect(x: DEFAULT_MARGIN_HEIGHT + SIZE_OF_STATUS_BAR, y: DEFAULT_MARGIN_WIDTH, width: windowSizeWidth - (DEFAULT_MARGIN_HEIGHT * 2) - SIZE_OF_STATUS_BAR, height: windowSizeHeight - (DEFAULT_MARGIN_WIDTH * 2))
//            self.wv.frame = CGRectMake(DEFAULT_MARGIN_HEIGHT, DEFAULT_MARGIN_WIDTH, self.uv.bounds.size.width - DEFAULT_MARGIN_HEIGHT * 2, self.uv.bounds.size.height - (DEFAULT_MARGIN_WIDTH * 2) - CLOSE_IMAGE_FRAME_SIZE);
            self.wv!.frame = CGRect(x: DEFAULT_MARGIN_HEIGHT, y: DEFAULT_MARGIN_WIDTH, width: self.uv!.bounds.size.width - DEFAULT_MARGIN_HEIGHT * 2, height: self.uv!.bounds.size.height - (DEFAULT_MARGIN_WIDTH * 2) - CLOSE_IMAGE_FRAME_SIZE)
//            break;
//        }case UIInterfaceOrientationLandscapeRight:{
        case .landscapeRight:
//            [self transformUIVew:(M_PI/2.0)];
            self.transformUIVew(angle: .pi/2.0)
//            self.uv.frame = CGRectMake(DEFAULT_MARGIN_HEIGHT, DEFAULT_MARGIN_WIDTH, windowSizeWidth - (DEFAULT_MARGIN_HEIGHT * 2) - SIZE_OF_STATUS_BAR, windowSizeHeight - (DEFAULT_MARGIN_WIDTH * 2));
            self.uv!.frame = CGRect(x: DEFAULT_MARGIN_HEIGHT, y: DEFAULT_MARGIN_WIDTH, width: windowSizeWidth - (DEFAULT_MARGIN_HEIGHT * 2) - SIZE_OF_STATUS_BAR, height: windowSizeHeight - (DEFAULT_MARGIN_WIDTH * 2))
//            self.wv.frame = CGRectMake(DEFAULT_MARGIN_HEIGHT, DEFAULT_MARGIN_WIDTH, self.uv.bounds.size.width - DEFAULT_MARGIN_HEIGHT * 2, self.uv.bounds.size.height - (DEFAULT_MARGIN_WIDTH * 2) - CLOSE_IMAGE_FRAME_SIZE);
            self.wv!.frame = CGRect(x: DEFAULT_MARGIN_HEIGHT, y: DEFAULT_MARGIN_WIDTH, width: self.uv!.bounds.size.width - DEFAULT_MARGIN_HEIGHT * 2, height: self.uv!.bounds.size.height - (DEFAULT_MARGIN_WIDTH * 2) - CLOSE_IMAGE_FRAME_SIZE)
//            break;
//        }case UIInterfaceOrientationPortraitUpsideDown:{
        case .portraitUpsideDown:
//            [self transformUIVew:M_PI];
            self.transformUIVew(angle: .pi)
//            self.uv.frame = CGRectMake(DEFAULT_MARGIN_WIDTH, DEFAULT_MARGIN_HEIGHT, windowSizeWidth - (DEFAULT_MARGIN_WIDTH * 2), windowSizeHeight - (DEFAULT_MARGIN_HEIGHT * 2) - SIZE_OF_STATUS_BAR);
            self.uv!.frame = CGRect(x: DEFAULT_MARGIN_WIDTH, y: DEFAULT_MARGIN_HEIGHT, width: windowSizeWidth - (DEFAULT_MARGIN_WIDTH * 2), height: windowSizeHeight - (DEFAULT_MARGIN_HEIGHT * 2) - SIZE_OF_STATUS_BAR)
//            self.wv.frame = CGRectMake(DEFAULT_MARGIN_WIDTH, DEFAULT_MARGIN_HEIGHT, self.uv.bounds.size.width - (DEFAULT_MARGIN_WIDTH * 2), self.uv.bounds.size.height - (DEFAULT_MARGIN_HEIGHT * 2) - CLOSE_IMAGE_FRAME_SIZE);
            self.wv!.frame = CGRect(x: DEFAULT_MARGIN_WIDTH, y: DEFAULT_MARGIN_HEIGHT, width: self.uv!.bounds.size.width - (DEFAULT_MARGIN_WIDTH * 2), height: self.uv!.bounds.size.height - (DEFAULT_MARGIN_HEIGHT * 2) - CLOSE_IMAGE_FRAME_SIZE)
//            break;
//        }
//        case UIInterfaceOrientationUnknown:{
        default:
//            break;
            break
//        }
//    }
        }
//    UIView *bg = [self.wv viewWithTag:ActivityIndicatorBackgroundTag];
        let bg = self.wv!.viewWithTag(ActivityIndicator.backgroundTag.rawValue)!
//    bg.frame = CGRectMake(0, 0, self.wv.frame.size.width, self.wv.frame.size.height);
        bg.frame = CGRect(origin: .zero, size: self.wv!.frame.size)
//    UIView *iv = [self.wv viewWithTag:ActivityIndicatorTag];
        let iv = self.wv?.viewWithTag(ActivityIndicator.tag.rawValue)
//    iv.center = CGPointMake(bg.frame.size.width/2, bg.frame.size.height/2);
        iv?.center = CGPoint(x: bg.frame.width/2, y: bg.frame.height/2)
//    self.closeButton.frame = CGRectMake(self.uv.bounds.size.width/2 - CLOSE_BUTTON_WIDTH/2, DEFAULT_MARGIN_WIDTH * 1.7 + self.wv.bounds.size.height , CLOSE_BUTTON_WIDTH, CLOSE_BUTTON_HEIGHT);
        self.closeButton?.frame = CGRect(x: self.uv!.bounds.size.width/2 - CLOSE_BUTTON_WIDTH/2, y: DEFAULT_MARGIN_WIDTH * 1.7 + self.wv!.bounds.size.height, width: CLOSE_BUTTON_WIDTH, height: CLOSE_BUTTON_HEIGHT)
//
//}
    }
//
//- (void)closeWebView:(id)sender{
    @objc private func closeWebView(_: Any) {
//    [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
        NotificationCenter.default.removeObserver(self)
//    [self.uv removeFromSuperview];
        self.uv?.removeFromSuperview()
//    [self.wv removeFromSuperview];
        self.wv?.removeFromSuperview()
//    [self.cv removeFromSuperview];
        self.cv?.removeFromSuperview()
//    self.uv = nil;
        self.uv = nil
//    self.wv = nil;
        self.wv = nil
//    self.cv = nil;
        self.cv = nil
//
//    // define selector
//    SEL selector = NSSelectorFromString(@"resetRichPushView");
//    // get method signeture
//    NSMethodSignature* signature = [[NCMBPush class] methodSignatureForSelector: selector];
//    // make NSInvocation instance
//    NSInvocation* invocation = [ NSInvocation invocationWithMethodSignature: signature ];
//    [invocation setSelector:selector];
//    [invocation setTarget:[NCMBPush class]];
//    [invocation invoke];
        NCMBPush.resetRichPushView()
//}
    }
//
//-(void)startWebViewLoading{
    private func startWebViewLoading() {
//    UIView* bg = [self.wv viewWithTag:ActivityIndicatorBackgroundTag];
        let bg = self.wv!.viewWithTag(ActivityIndicator.backgroundTag.rawValue)
//    bg.hidden = NO;
        bg!.isHidden = false
//    UIActivityIndicatorView* activity = (UIActivityIndicatorView*)[bg viewWithTag:ActivityIndicatorTag];
        let activity = bg!.viewWithTag(ActivityIndicator.tag.rawValue) as! UIActivityIndicatorView
//    [activity startAnimating];
        activity.startAnimating()
//}
    }
//
//-(void)endWebViewLoading{
    private func endWebViewLoading() {
//    UIView* bg = [self.wv viewWithTag:ActivityIndicatorBackgroundTag];
        let bg = self.wv!.viewWithTag(ActivityIndicator.backgroundTag.rawValue)
//    bg.hidden = YES;
        bg!.isHidden = true
//    UIActivityIndicatorView* activity = (UIActivityIndicatorView*)[bg viewWithTag:ActivityIndicatorTag];
        let activity = bg!.viewWithTag(ActivityIndicator.tag.rawValue) as! UIActivityIndicatorView
//    [activity stopAnimating];
        activity.stopAnimating()
//}
    }
//
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//    [self endWebViewLoading];
        self.endWebViewLoading()
//}
    }
//
//# pragma webview delegate
//
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//    [self startWebViewLoading];
        self.startWebViewLoading()
//    decisionHandler(WKNavigationActionPolicyAllow);
        decisionHandler(.allow)
//}
    }
//
//- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//    if ([error code] != NSURLErrorCancelled){
        if (error as NSError).code != NSURLErrorCancelled {
//        UIView* bg = [self.wv viewWithTag:ActivityIndicatorBackgroundTag];
            let bg = self.wv!.viewWithTag(ActivityIndicator.backgroundTag.rawValue)
//        [bg removeFromSuperview];
            bg?.removeFromSuperview()
//
//        NSString *html = @"<html><body><h1>ページを開けません。</h1></body></html>";
            let html = "<html><body><h1>ページを開けません。</h1></body></html>"
//        NSData *bodyData = [html dataUsingEncoding:NSUTF8StringEncoding];
//        [self.wv loadData:bodyData MIMEType:@"text/html" characterEncodingName:@"utf-8" baseURL:[[NSURL alloc]init]];
            self.wv!.loadHTMLString(html, baseURL: nil)
//    }
        }
//}
    }
//
//@end
}
