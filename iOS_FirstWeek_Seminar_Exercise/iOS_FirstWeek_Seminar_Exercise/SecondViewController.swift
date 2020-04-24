//
//  SecondViewController.swift
//  iOS_FirstWeek_Seminar_Exercise
//
//  Created by 이예슬 on 4/18/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad() //뷰가 뜨기 위해서 꼭 실행되는 함수
        // Do any additional setup after loading the view.
        setLabels()
    }
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?
    
    private func setLabels(){
        //Optional Binding
        guard let name = self.name else {return}
        guard let email = self.email else {return}
        guard let isOnOff = self.isOnOff else {return}
        guard let frequency = self.frequency else {return}
        // Label에 값 대입
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "On":"Off"
        frequencyLabel.text = "\(frequency)"
    
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated:true,completion:nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
