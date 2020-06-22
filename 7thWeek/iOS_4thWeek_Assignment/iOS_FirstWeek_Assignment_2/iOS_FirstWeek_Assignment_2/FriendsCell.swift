//
//  FriendsCell.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 5/12/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

protocol ButtonDelegate{
    func onClickCellButton(in index: Int)
}
class FriendsCell: UITableViewCell {
    static let identifier: String = "FriendsCell"
    
    @IBAction func changeProgileImg(_ sender: Any) {
        delegate?.onClickCellButton(in: indexPath!.row)
    }
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileMsgLabel: UILabel!
    
    var delegate:ButtonDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setFriendsProfile(profileName:String, profileMsg:String,profileImg:UIImage?){ //인자를 받아서 profile 오브젝트에 내용을 채워줌
        profileImageView.image = profileImg
        profileNameLabel.text = profileName
        profileMsgLabel.text = profileMsg
    }
    func setMyProfile(){
        profileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileNameLabel.font=UIFont.boldSystemFont(ofSize: CGFloat(17))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
