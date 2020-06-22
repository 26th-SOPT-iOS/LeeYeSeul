//
//  profileData.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 5/13/20.
//  Copyright © 2020 이예슬. All rights reserved.
//
import UIKit

struct ProfileData2{
    var profileImg: UIImage?
    var profileName: String
    var profileMsg: String
    
    init(name: String, msg : String, imgName: String){
        self.profileImg = UIImage(named: imgName)
        self.profileName = name
        self.profileMsg = msg
    }
    
}
struct ProfileData: Codable { var status: Int
    var success: Bool
    var message: String
    var data: [UserProfile]?
    enum CodingKeys: String, CodingKey { case status = "status"
        case success = "success"
        case message = "message"
        case data = "data" }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([UserProfile].self, forKey: .data)) ?? nil
    } }
struct UserProfile: Codable {
    var name: String
    var email: String
    var phone: String
    var profile: String }
