//
//  LookupService.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 6/22/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation
import Alamofire


struct LookupService {
    static let shared = LookupService()
    func lookup(_ token: String, completion: @escaping (NetworkResult<Any>) -> Void) { let header: HTTPHeaders = ["Content-Type" : "multipart/form-data", "jwt" : token]
        let dataRequest = Alamofire.request(APIConstants.profileURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure:
                    completion(.networkFail)
            }
        }
        
    }
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isLookup(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func isLookup(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ProfileImageData.self, from: data) else { return .pathErr }
        return .success(decodedData.data)
    }
}
