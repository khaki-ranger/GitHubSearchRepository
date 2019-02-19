//
//  GitHubAPI.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/19.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

// 型のネストを利用する
// オーバーライドを想定しないのでfinalキーワードを追加
final class GitHubAPI {
    // GitHubRequestプロトコルに準拠
    // リポジトリ検索用のリクエストを表す型
    struct SearchRepositories: GitHubRequest {
        let keyword: String
        
        // GitHubRequestが要求する連想型
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/repositories"
        }
        
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "q", value: keyword)]
        }
    }
}
