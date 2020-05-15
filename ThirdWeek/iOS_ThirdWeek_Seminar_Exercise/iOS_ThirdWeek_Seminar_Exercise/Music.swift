//
//  Music.swift
//  iOS_ThirdWeek_Seminar_Exercise
//
//  Created by 이예슬 on 5/9/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

// Music 모델
struct Music {
    
    var albumImg: UIImage?
    var musicTitle: String?
    var singer: String?
    
    init(title: String, singer: String, coverName: String) {
        self.albumImg = UIImage(named: title)
        self.musicTitle = coverName
        self.singer = singer
    }
    
}
