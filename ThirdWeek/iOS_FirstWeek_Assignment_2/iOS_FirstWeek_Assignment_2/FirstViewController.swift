//
//  FirstViewController.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 4/18/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var logIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"logOutViewController") as? LogOutViewController else{return}
        receiveViewController.id = idTextField.text
        receiveViewController.pw = passwordTextField.text
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController,animated:true,completion:nil)
        idTextField.text = ""
        passwordTextField.text = ""
    
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
