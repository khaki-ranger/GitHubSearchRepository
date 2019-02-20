//
//  GitHubClient.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/20.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

// GitHubAPIのリクエストを受け取って通信を行い、
// レスポンスを解釈するまでの一連の流れを管理する型
class GitHubClient {
    // 計算プロパティ
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    // 呼び出し元が利用するメソッドのインターフェース
    // 引数の型を汎用化させるためにジェネリクスを使う
    // メソッドに渡すリクエストの型に応じて、クロージャの引数の型も変わる
    func send<Request: GitHubRequest>(
        request: Request,
        // 非同期的に発生するエラーに対処するため、Result<T, Error>型を採用
        // 成功時には型引数Requestの連想型Responseの値を受け取ることができる
        completion: (Result<Request.Response, GitHubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in
        }
        
        task.resume()
    }
}
