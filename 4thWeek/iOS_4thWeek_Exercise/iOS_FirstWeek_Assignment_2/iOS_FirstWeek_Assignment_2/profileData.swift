//
//  profileData.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 5/13/20.
//  Copyright © 2020 이예슬. All rights reserved.
//
import UIKit

struct ProfileData{
    var profileImg: UIImage?
    var profileName: String
    var profileMsg: String
    
    init(name: String, msg : String, imgName: String){
        self.profileImg = UIImage(named: imgName)
        self.profileName = name
        self.profileMsg = msg
    }
    
}
