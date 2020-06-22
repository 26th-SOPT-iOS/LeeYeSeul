//
//  NetworkResult.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 5/20/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
