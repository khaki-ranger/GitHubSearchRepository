//
//  GitHubClientError.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/18.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

enum GitHubClientError: Error {
    // ()の中は付加情報を付与するための連想値
    // 通信に失敗
    case connectionError(Error)
    
    // レスポンスの解釈に失敗
    case responseParseError(Error)
    
    // APIからあエラーレスポンスを受け取った
    case apiError(GitHubAPIError)
}
