//
//  FriendsViewController.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 5/12/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    private var friendsData: [[ProfileData2]] = [] //ProfileData 구조체를 갖는 이차원배열 friendsData
    @IBOutlet weak var friendsTableView: UITableView!
    private var pickerController = UIImagePickerController() //카메라&갤러리 접근 위해 선언
    @IBAction func settingButton(_ sender: Any) {
        let settingController=UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let friendSetting = UIAlertAction(title:"친구 관리",style:.default)
        let generalSetting = UIAlertAction(title:"전체 설정",style:.default)
        let cancelButton = UIAlertAction(title:"취소",style:.cancel)
        
        settingController.addAction(friendSetting)
        settingController.addAction(generalSetting)
        settingController.addAction(cancelButton)
        
        self.present(settingController,animated:true,completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        friendsTableView.backgroundColor=UIColor.white
        
        setFriendsData()        // Do any additional setup after loading the view.
        pickerController.delegate = self //pickerController의 이벤트를 대신 처리
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        lookupProfile()
        
    }
    private func lookupProfile(){
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
        LookupService.shared.lookup(token) { networkResult in
            switch networkResult {
            case .success(let profileData):
                guard let profileData = profileData as? UserDetailProfile else { return }
                print(profileData.image)
                let image = UIImageView()
                image.setImage(from: profileData.image) { image in
                    guard let profileCell = self.friendsTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FriendsCell else { return }
                    //프사 둥글게 꽉차게
                    profileCell.profileImageView.layer.cornerRadius = profileCell.profileImageView.bounds.width/2
                    profileCell.profileImageView.contentMode = .scaleAspectFill
                    DispatchQueue.main.async {
                        profileCell.profileImageView.image = image
                    }
                }
                
            case .requestErr(let message): print(message)
            case .pathErr: print("pathErr")
            case .serverErr: print("ServerErr")
            case .networkFail: print("networkReult")
            }
        }
    }
    private func setFriendsData(){ //ProfileData struct의 개체 선언
        let myProfile = ProfileData2(name:"이예슬", msg: "아요 새내기", imgName: "profile1Img")
        let profile1 = ProfileData2(name:"김솝트", msg:"사실",imgName: "profile1Img" )
        let profile2 = ProfileData2(name:"이솝트", msg:"나는",imgName: "profile2Img" )
        let profile3 = ProfileData2(name:"박솝트", msg:"고양이파",imgName: "profile3Img" )
        let profile4 = ProfileData2(name:"최솝트", msg:"메롱",imgName: "profile4Img" )
        let profile5 = ProfileData2(name:"강솝트", msg:"솝트친구들",imgName: "profile5Img" )
        let profile6 = ProfileData2(name:"정솝트", msg:"다",imgName: "profile6Img" )
        let profile7 = ProfileData2(name:"임솝트", msg:"천재야",imgName: "profile7Img" )
        let profile8 = ProfileData2(name:"신솝트", msg:"멋쟁이들",imgName: "profile8Img" )
        let profile9 = ProfileData2(name:"양솝트", msg:"천사들",imgName: "profile9Img" )
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
        
        
        if indexPath.section==0{
            friendsCell.setMyProfile()
            let bottomEdge: UIView = {
                let view = UIView(frame:CGRect(x:20,y:friendsCell.frame.height-1,width:friendsCell.frame.width - 40,height:0.5))
                view.backgroundColor = UIColor(red:112/255,green:112/255,blue:112/255 ,alpha:1.0)
                return view}()
            friendsCell.indexPath = indexPath
            friendsCell.delegate = self
            friendsCell.addSubview(bottomEdge)
            //friendsCell.profileImageView
            
        } //내프로필은 이미지뷰 좀 크게하고 볼드 등등
        
        
        
        return friendsCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsData.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section==1{
            let headerLabel = UILabel()
            headerLabel.frame = CGRect(x: 16, y:3, width: 50, height: 17)
            headerLabel.text = "친구 \(friendsData[1].count)"
            headerLabel.font = UIFont.systemFont(ofSize: CGFloat(11))
            
            headerLabel.textColor = UIColor.lightGray
            //headerLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 5).isActive = true
            let headerView = UIView()
            headerView.backgroundColor=UIColor.white
            headerView.addSubview(headerLabel)
            return headerView
        }
        else{
            let emptyView = UIView()
            emptyView.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
            return emptyView
        }
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
    //셀지우기
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section==1{
            if editingStyle == .delete {
                self.friendsData[1].remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.friendsTableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section==1{return 20} //친구 헤더만
        else{return 0}
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
}

extension FriendsViewController: ButtonDelegate{
    //cell 버튼 클릭시 전달되는 이벤트
    func onClickCellButton(in index: Int) {
        let alertController = UIAlertController(title : "사진 선택",message:"가져올 곳을 선택하세요",preferredStyle:.actionSheet)
        let galleryAction = UIAlertAction(title:"사진앨범",style:.default){
            action in self.openLibrary()
        }
        let photoAction = UIAlertAction(title :"카메라",style:.default){
            action in self.openCamera()
        }
        let cancelAction = UIAlertAction(title:"취소",style:.cancel, handler:nil)
        alertController.addAction(galleryAction)
        alertController.addAction(photoAction)
        alertController.addAction(cancelAction)
        self.present(alertController,animated:true,completion:nil)
    }
}
extension FriendsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func openLibrary(){
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated:true,completion:nil)
    }
    func openCamera(){
        pickerController.sourceType = .camera
        self.present(pickerController, animated:true, completion:nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            guard let token = UserDefaults.standard.string(forKey: "token") as? String else { return}
            UploadService.shared.uploadImage(token, image,url.lastPathComponent){ networkResult in
                switch networkResult {
                case .success(let profileData):
                    guard let profileData = profileData as? [UserProfile] else {return}
                case .requestErr(let failMessage):
                    guard let message = failMessage as? String else {return}
                    print(message)
                    
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
                
            }
            guard let profileCell = friendsTableView.cellForRow(at:IndexPath(row:0,section:0)) as? FriendsCell else {return}
            profileCell.profileImageView.image = image
            
            profileCell.profileImageView.layer.cornerRadius = profileCell.profileImageView.bounds.height*0.5
            profileCell.profileImageView.contentMode = .scaleAspectFill
            print(profileCell.profileImageView.translatesAutoresizingMaskIntoConstraints)
        }
        dismiss(animated:true,completion:nil)
    }
}
