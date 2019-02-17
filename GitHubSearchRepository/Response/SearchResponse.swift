//
//  SearchResponse.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/17.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

// 様々な種類の検索結果を汎用的に扱えるようにする
struct SearchResponse<Item: Decodable>: Decodable {
    let totalCount: Int
    let items: [Item]
    
    // プロパティ名とJSONのキーを対応させる
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
