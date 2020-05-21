//
//  APIConstants.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 5/20/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation

struct APIConstants{
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
}
