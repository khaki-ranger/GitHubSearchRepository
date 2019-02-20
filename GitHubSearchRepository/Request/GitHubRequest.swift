//
//  GitHubRequest.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/19.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

// リクエストの型に必要なものをプロトコルにまとめる
protocol GitHubRequest {
    // 連想型を使用
    // 1つの型に依存しない抽象的な性質を定義
    // 実際の型はプロトコルに準拠する型の方で指定する
    // ここでは、リクエストの型からレスポンスの型を決定できるようにする
    associatedtype Response: Decodable
    
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    // キーと値のペアのパラメータを表現するURLQueryItem型の配列のプロパティ
    var queryItems: [URLQueryItem] { get }
    // POSTリクエストやPUTリクエストに対応する場合は、
    // Encodableプロトコルに準拠したプロパティを用意する
    // var body: Encodable? { get }
}

extension GitHubRequest {
    // baseURLプロパティのデフォルトを実装
    // プロトコルに準拠するたびに定義を記述する必要をなくす
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    // GitHubRequestプロトコルに準拠する型を
    // URLRequest型に変換するためのメソッド
    func buildURLRequest() -> URLRequest {
        // baseURLプロパティとpathプロパティの値を結合
        let url = baseURL.appendingPathComponent(path)
        // URL型の構成要素を表現するURLComponents型の値を生成
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        switch method {
        case .get:
            // GitHubRequestプロトコルのqueryItemsプロパティの値を
            // URLComponents型のqueryItemsプロパティにセット
            // エンコードを施したクエリ文字列を付与
            components?.queryItems = queryItems
        default:
            // 今回は.get以外HTTPメソッドは考慮しない
            fatalError("Unsupported method \(method)")
        }
        
        // URLRequest型の値を生成して戻り値として返却する
        var urlRequest = URLRequest(url: url)
        // URLComponents型の値から取得可能なURL型の値を取得して、urlプロパティにセット
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
