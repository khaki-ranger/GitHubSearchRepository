//
//  User.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/17.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

// Decodableプロトコルに準拠した構造体を定義
struct User: Decodable {
    let id: Int
    let login: String
}
