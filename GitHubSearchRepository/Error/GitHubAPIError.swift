//
//  GitHubAPIError.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/18.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

struct GitHubAPIError: Decodable, Error {
    // APIからのレスポンスのerrorsプロパティの要素をモデル化
    struct FieldError: Decodable {
        let resource: String
        let field: String
        let code: String
    }
    
    let message: String
    // errorsプロパティ自体を表すプロパティを定義
    let fieldErrors: [FieldError]
}
