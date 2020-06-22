//
//  FirstViewController.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 4/18/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import BEMCheckBox

class FirstViewController: UIViewController {
    var id:String?
    var pwd:String?
    var flag:Bool = false

    @IBOutlet weak var checkBox: BEMCheckBox!
    private func doLogin(){
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passwordTextField.text else { return }
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                self.id = inputID
                self.pwd = inputPWD
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail") }

        }
    }
    private func autoLogin(){
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passwordTextField.text else { return }
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                self.id = inputID
                self.pwd = inputPWD
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                
                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail") }

        }
    }
    private func setTextfield(){
        idTextField.text = id
        passwordTextField.text = pwd
    }
    @IBOutlet weak var logIn: UIButton! //로그인버튼 outlet
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ID = UserDefaults.standard.string(forKey: "id"){
            if let Password = UserDefaults.standard.string(forKey: "pwd"){
                idTextField.text=ID
                passwordTextField.text = Password
                autoLogin()
            }
        }
        if (flag==true){
            setTextfield()
            doLogin()
        }
        logIn.layer.cornerRadius = 20
        idTextField.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
        signUp.isUserInteractionEnabled = true
        idTextField.addLeftPadding()
        passwordTextField.addLeftPadding()
        let labelTap = UITapGestureRecognizer(target:self,action: #selector(self.labelTapped(_:)))
        signUp.addGestureRecognizer(labelTap)
        
        //transparent navigationbar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUp: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        guard let idid = idTextField.text else{return}
        guard let pwpw = passwordTextField.text else{return}
        
        if checkBox.on{
            UserDefaults.standard.set(idid,forKey: "id")
            print(UserDefaults.standard.string(forKey: "id"))
            UserDefaults.standard.set(pwpw,forKey: "pwd")
        }
        else{
            UserDefaults.standard.removeObject(forKey: "id")
            UserDefaults.standard.removeObject(forKey: "pwd")
        }
        doLogin()
        
        
        //        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as? UITabBarController else{return}
        ////        receiveViewController.id = idTextField.text
        ////        receiveViewController.pw = passwordTextField.text
        //        receiveViewController.modalPresentationStyle = .fullScreen
        //        self.present(receiveViewController,animated:true,completion:nil)
        //        idTextField.text = ""
        //        passwordTextField.text = ""
        
    }
    @objc func labelTapped(_ sender:UITapGestureRecognizer){
        guard let vc = self.storyboard?.instantiateViewController(identifier:"signUpViewController") as? SignUpViewController else{return}
        navigationController?.pushViewController(vc, animated:true)
        
        
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
    
extension UITextField{
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
        //tf.leftViewMode = tf.ViewMode.always
    }
    
}


