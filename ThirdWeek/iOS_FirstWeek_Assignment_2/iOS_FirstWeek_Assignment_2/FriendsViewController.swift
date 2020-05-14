//
//  FriendsViewController.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 5/12/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    private var friendsData: [[ProfileData]] = [] //ProfileData 구조체를 갖는 이차원배열 friendsData
     @IBOutlet weak var friendsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        setFriendsData()        // Do any additional setup after loading the view.
    }
   
    private func setFriendsData(){ //ProfileData struct의 개체 선언,
        //let myProfile = ProfileData(name:"이예슬",msg:"아요새내기",imgName:"profile1Img")
        let myProfile = ProfileData(name:"이예슬", msg: "아요 새내기", imgName: "profile1Img")
        let profile1 = ProfileData(name:"김솝트", msg:"안녕하세요",imgName: "profile1Img" )
        let profile2 = ProfileData(name:"이솝트", msg:"안녕하세요",imgName: "profile2Img" )
        let profile3 = ProfileData(name:"박솝트", msg:"안녕하세요",imgName: "profile3Img" )
        let profile4 = ProfileData(name:"최솝트", msg:"안녕하세요",imgName: "profile4Img" )
        let profile5 = ProfileData(name:"강솝트", msg:"안녕하세요",imgName: "profile5Img" )
        let profile6 = ProfileData(name:"정솝트", msg:"안녕하세요",imgName: "profile6Img" )
        let profile7 = ProfileData(name:"임솝트", msg:"안녕하세요",imgName: "profile7Img" )
        let profile8 = ProfileData(name:"신솝트", msg:"안녕하세요",imgName: "profile8Img" )
        let profile9 = ProfileData(name:"양솝트", msg:"안녕하세요",imgName: "profile9Img" )
        //첫번째 원소로 [내프로필] 두번쨰로 [친구들]
        friendsData=[[myProfile],[profile1,profile2,profile3,profile4,profile5,profile6,profile7,profile8,profile9]]
    }
    

}
extension FriendsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return friendsData[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendsCell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.identifier, for: indexPath) as? FriendsCell else {return UITableViewCell()}
        friendsCell.setFriendsProfile(profileName: friendsData[indexPath.section][indexPath.row].profileName, profileMsg: friendsData[indexPath.section][indexPath.row].profileMsg, profileImg: friendsData[indexPath.section][indexPath.row].profileImg)
        
        if indexPath.section != 0 { //separator 없애줌
            friendsCell.separatorInset = UIEdgeInsets(top: 0,left: 1000,bottom: 0,right: 0)}
        else{
            friendsCell.setMyProfile() //내프로필은 이미지뷰 좀 크게하고 볼드 등등
        }

            
        return friendsCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsData.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section==1{
            let headerLabel = UILabel()
            headerLabel.frame = CGRect(x: 16, y: 0, width: 50, height: 17)
            headerLabel.text = "친구 "+String(friendsData[1].count)
            headerLabel.font = UIFont.systemFont(ofSize: CGFloat(11))
            headerLabel.textColor = UIColor(named: "brownGrey")
            //headerLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 5).isActive = true
            let headerView = UIView()
            headerView.backgroundColor=UIColor.clear
            headerView.addSubview(headerLabel)
            return headerView
        }
        else{
            return UIView()
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section==1{return 20} //친구 헤더만
        else{return 0}
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        <#code#>
//    }
        

}
    
extension FriendsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 85
        }
        else{
            return 62}
    }
}

