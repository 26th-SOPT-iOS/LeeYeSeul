//
//  SignUpViewController.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 4/18/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBAction func signUpData(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"logOutViewController") as? LogOutViewController else{return}
            receiveViewController.id = idTextField.text
            receiveViewController.pw = pwTextField.text
            receiveViewController.modalPresentationStyle = .fullScreen
            self.present(receiveViewController,animated:true,completion:nil)
            idTextField.text = ""
            pwTextField.text = ""
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
