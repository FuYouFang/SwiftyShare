//
//  Connector.swift
//  SwiftyShare
//
//  Created by fuyoufang on 2020/12/10.
//

import Foundation

protocol Connector {
    static func register(appid: String, universalLink: String)
}
