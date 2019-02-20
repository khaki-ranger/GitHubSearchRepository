//
//  HTTPMethod.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/19.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

// String型のローバリューを設定
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case patch = "PATCH"
    case trace = "TRACE"
    case options = "OPTIONS"
    case connect = "CONNECT"
}
