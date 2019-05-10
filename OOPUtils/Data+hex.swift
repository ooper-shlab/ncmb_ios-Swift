//
//  Data+hex.swift
//  NCMB
//
//  Created by OOPer on 2019/05/02.
//  Copyright © 2019 OOPer's. All rights reserved.
//

import Foundation

extension Data {
    var hexString: String {
        return self.map{String(format: "%02x", $0)}.joined(separator: "")
    }
}
