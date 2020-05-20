//
//  LoginService.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 5/20/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation
import Alamofire

struct LoginService {
    static let shared = LoginService()
    private func makeParameter(_ id:String, _ pwd:String) -> Parameters {
        return ["id":id, "password": pwd]
    }//Request Body에들어갈parameter 생성
    func login(id:String, pwd:String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type":"application/json"] //Request Header 생성
        let dataRequest = Alamofire.request(APIConstants.signinURL,method: .post,parameters:
            makeParameter(id, pwd),encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
    private func judge(by statusCode:Int, _ data:Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isUser(by: data)
        case 400:
            return .pathErr
        case 500:
            return .serverErr
        default: return .networkFail
        }
    }
    private func isUser(by data:Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(SigninData.self, from: data) else
        {return .pathErr}
        guard let tokenData = decodeData.data else {return .requestErr(decodeData.message)}
        return .success(tokenData.jwt)
    }
}
