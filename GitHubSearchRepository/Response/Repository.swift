//
//  Repository.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/17.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

// Decodableプロトコルに準拠した構造体を定義
struct Repository: Decodable {
    let id: Int
    let name: String
    let fullName: String
    let owner: User
    
    // プロパティ名とJSONのキーを対応させる
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
    }
}
