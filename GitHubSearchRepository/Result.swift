//
//  Result.swift
//  GitHubSearchRepository
//
//  Created by 寺島 洋平 on 2019/02/20.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import Foundation

enum Result<T, Error: Swift.Error> {
    case success(T)
    case failure(Error)
    
    init(value: T) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
}
