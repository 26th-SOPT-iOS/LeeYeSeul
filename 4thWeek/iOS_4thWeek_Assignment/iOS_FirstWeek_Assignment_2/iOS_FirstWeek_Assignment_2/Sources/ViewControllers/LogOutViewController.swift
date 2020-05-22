//
//  LogOutViewController.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 4/18/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {

    @IBAction func logout(_ sender: Any) {
        guard let VC = self.storyboard?.instantiateViewController(withIdentifier: "firstViewController") as? FirstViewController else{return}
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pwd")
        //VC.checkBox.on=false
        VC.modalPresentationStyle = .fullScreen
        self.present(VC,animated:true,completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
