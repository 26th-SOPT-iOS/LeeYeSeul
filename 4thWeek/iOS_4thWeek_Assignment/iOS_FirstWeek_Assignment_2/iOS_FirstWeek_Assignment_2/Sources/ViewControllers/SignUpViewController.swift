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
        self.navigationController?.navigationBar.topItem?.title=""
        self.navigationController?.navigationBar.tintColor = UIColor(red:7/255,green:59/255,blue:163/255,alpha:1.0)
        idTextField.layer.cornerRadius = 22
        pwTextField.layer.cornerRadius = 22
        nameTextField.layer.cornerRadius=22
        emailTextField.layer.cornerRadius = 22
        phoneTextField.layer.cornerRadius = 22
        idTextField.addLeftPadding()
        pwTextField.addLeftPadding()
        nameTextField.addLeftPadding()
        emailTextField.addLeftPadding()
        phoneTextField.addLeftPadding()
        signUpButton.layer.cornerRadius=24
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUp(_ sender: Any) {
        guard let inputID = idTextField.text else{return}
        guard let inputPWD = pwTextField.text else{return}
        guard let inputName = nameTextField.text else{return}
        guard let inputEmail = emailTextField.text else{return}
        guard let inputPhone = phoneTextField.text else{return}
        
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputName, email: inputEmail, phone: inputPhone){
            networkResult in
            switch networkResult {
            case .success:
                guard let firstViewController = self.storyboard?.instantiateViewController(identifier:
                    "firstViewController") as? FirstViewController else { return }
                firstViewController.modalPresentationStyle = .fullScreen
                self.present(firstViewController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail") }
        }
    }
    
}
//    @IBAction func signUpData(_ sender: Any) {
//        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"firstViewController") as? FirstViewController else{return}
////            receiveViewController.id = idTextField.text
////            receiveViewController.pw = pwTextField.text
//            receiveViewController.modalPresentationStyle = .fullScreen
//        self.present(receiveViewController,animated:true){
//            self.navigationController?.popViewController(animated:false)
//        }
//            idTextField.text = ""
//            pwTextField.text = ""



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


