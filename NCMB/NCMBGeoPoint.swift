//
//  NCMBGeoPoint.swift
//  NCMB
//
//  Translated by OOPer in cooperation with shlab.jp, on 2019/05/02
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
import Foundation
//#import <CoreLocation/CoreLocation.h>
import CoreLocation
//
///**
// NCMBGeoPointクラスは、位置情報をmobile backendで管理するためのクラスです。
// */
//@interface NCMBGeoPoint : NSObject <CLLocationManagerDelegate>
public class NCMBGeoPoint: NSObject, CLLocationManagerDelegate {
//
///// 緯度
//@property (nonatomic, readwrite) double latitude;
    public var latitude: Double = 0.0
//
///// 経度
//@property (nonatomic, readwrite) double longitude;
    public var longitude: Double = 0.0
//
//typedef void (^NCMBGeoPointHandler)(NCMBGeoPoint *geoPoint, NSError *error);
    public typealias NCMBGeoPointHandler = (Result<NCMBGeoPoint?, Error>)->Void
//
///**
// NCMBGeoPointオブジェクトを作成。緯度、経度には0.0が設定される。
// @return geoPoint NCMBGeoPointクラスのインスタンス
// */
//+ (NCMBGeoPoint *)geoPoint;
//
///**
// NCMBGeoPointオブジェクトを作成。緯度、経度には引数で指定したものが設定される。
// @param latitude 緯度
// @param longitude 軽度
// @return geoPoint NCMBGeoPointクラスのインスタンス
// */
//+ (NCMBGeoPoint*)geoPointWithLatitude:(double)latitude longitude:(double)longitude;
//
///**
// NCMBGeoPointオブジェクトを作成。緯度、経度には引数のCLLocationが示す値が設定される。
// @param location CCLocation型の位置情報
// @return NCMBGeoPoint型のインスタンス
// */
//+ (NCMBGeoPoint *)geoPointWithLocation:(CLLocation *) location;
//
///**
// NCMBGeoPointオブジェクトを非同期で作成。緯度、経度にはGPS等で取得した端末の現在位置が設定される。
// @param geoPointHandler geoPointとerrorのHandler
// */
//+ (void)geoPointForCurrentLocationInBackground:(NCMBGeoPointHandler)geoPointHandler;
//
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
//#import "NCMBGeoPoint.h"
//
//static NCMBGeoPoint *currentPoint;
    private static var currentPoint: NCMBGeoPoint?
//static NCMBGeoPointHandler handler;
    private static var handler: NCMBGeoPointHandler?
//static CLLocationManager *locationManager;
    private static var locationManager: CLLocationManager?
//
//@implementation NCMBGeoPoint
//
///**
// NCMBGeoPointオブジェクトを作成。緯度、経度には0.0が設定される。
// @return geoPoint NCMBGeoPointクラスのインスタンス
// */
//+ (NCMBGeoPoint *)geoPoint{
    public convenience override init() {
//    return [NCMBGeoPoint geoPointWithLatitude:0 longitude:0];
        self.init(latitude: 0.0, longitude: 0.0)
//}
    }
//
///**
// NCMBGeoPointオブジェクトを作成。緯度、経度には引数で指定したものが設定される。
// @param double latitude 緯度
// @param double longitude 軽度
// @return geoPoint NCMBGeoPointクラスのインスタンス
// */
//+ (NCMBGeoPoint*)geoPointWithLatitude:(double)latitude longitude:(double)longitude{
    public init(latitude: Double, longitude: Double) {
//    NCMBGeoPoint *geoPoint = [[NCMBGeoPoint alloc] init];
//    geoPoint.latitude = latitude;
        self.latitude = latitude
//    geoPoint.longitude = longitude;
        self.longitude = longitude
//    return geoPoint;
        super.init()
//}
    }
//
///**
// NCMBGeoPointオブジェクトを作成。緯度、経度には引数のCLLocationが示す値が設定される。
// @param location 位置情報
// @return NCMBGeoPointのインスタンス
// */
//+ (NCMBGeoPoint *)geoPointWithLocation:(CLLocation *) location{
    public convenience init(location: CLLocation) {
//    CLLocationCoordinate2D coordinate = location.coordinate;
        let coordinate = location.coordinate
//    return [NCMBGeoPoint geoPointWithLatitude:coordinate.latitude longitude:coordinate.longitude];
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
//}
    }
//
//
///**
// NCMBGeoPointオブジェクトを非同期で作成。緯度、経度にはGPS等で取得した端末の現在位置が設定される。
// @param geoPointHandler geoPointとerrorのHandler
// */
//+ (void)geoPointForCurrentLocationInBackground:(NCMBGeoPointHandler)geoPointHandler{
    public static func geoPointForCurrentLocationAsync(_ geoPointHandler: @escaping NCMBGeoPointHandler) {
//
//    currentPoint = [NCMBGeoPoint geoPoint];
        currentPoint = NCMBGeoPoint()
//    handler = geoPointHandler;
        handler = geoPointHandler
//    locationManager = [[CLLocationManager alloc] init];
//
//    if([CLLocationManager locationServicesEnabled]){
        if CLLocationManager.locationServicesEnabled() {
//        locationManager = [[CLLocationManager alloc] init];
            locationManager = CLLocationManager()
//        locationManager.delegate = currentPoint;
            locationManager?.delegate = currentPoint
//        // 測位開始
//        [locationManager startUpdatingLocation];
            locationManager?.startUpdatingLocation()
//    }
        }
//}
    }
//
////iOS5.x
//- (void)locationManager:(CLLocationManager *)manager
//    didUpdateToLocation:(CLLocation *)newLocation
//           fromLocation:(CLLocation *)oldLocation{
//    currentPoint.latitude = newLocation.coordinate.latitude;
//    currentPoint.longitude = newLocation.coordinate.longitude;
//    [locationManager stopUpdatingLocation];
//    handler(currentPoint, nil);
//}
//
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    CLLocation *location = locations[0];
        let location = locations[0]
//    currentPoint.latitude = location.coordinate.latitude;
        NCMBGeoPoint.currentPoint?.latitude = location.coordinate.latitude
//    currentPoint.longitude = location.coordinate.longitude;
        NCMBGeoPoint.currentPoint?.longitude = location.coordinate.longitude
//    [locationManager stopUpdatingLocation];
        NCMBGeoPoint.locationManager?.stopUpdatingLocation()
//    handler(currentPoint, nil);
        NCMBGeoPoint.handler?(.success(NCMBGeoPoint.currentPoint))
//}
    }
//
//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//    [locationManager stopUpdatingLocation];
        NCMBGeoPoint.locationManager?.stopUpdatingLocation()
//    handler(currentPoint, error);
        NCMBGeoPoint.handler?(.failure(error))
//}
    }
//
//@end
}
