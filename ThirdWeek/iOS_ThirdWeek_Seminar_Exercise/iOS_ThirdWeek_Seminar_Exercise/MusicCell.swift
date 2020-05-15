//
//  MusicCell.swift
//  iOS_ThirdWeek_Seminar_Exercise
//
//  Created by 이예슬 on 5/9/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell {
    static let identifier: String = "MusicCell"
    
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    func set(_ musicInformation: Music){
        albumImageView.image = musicInformation.albumImg
        titleLabel.text = musicInformation.musicTitle
        singerLabel.text = musicInformation.singer
    }
    
}
