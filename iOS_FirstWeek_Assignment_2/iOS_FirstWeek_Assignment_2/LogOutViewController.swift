//
//  LogOutViewController.swift
//  iOS_FirstWeek_Assignment_2
//
//  Created by 이예슬 on 4/18/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        // Do any additional setup after loading the view.
    }
    var id:String?
    var pw:String?
    private func setLabels(){
        //Optional Binding
        guard let id = self.id else{return}
        guard let pw = self.pw else{return}
        //label값에 대입
        idLabel.text = id
        passwordLabel.text = pw
    }
    @IBAction func logOut(_ sender: Any) {
        /*guard let receiveViewController2 = self.storyboard?.instantiateViewController(identifier:"firstViewController") as? FirstViewController else{return}
        receiveViewController2.idTextField.text = ""
        receiveViewController2.passwordTextField.text = ""
 */
        self.dismiss(animated:true, completion:nil)
       
    }
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
