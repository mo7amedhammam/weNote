//
//  ViewController.swift
//  weNote
//
//  Created by Muhammad Hammam on 06/02/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet var buttonsOutlet: [UIButton]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        for b in buttonsOutlet {
            b.layer.cornerRadius = 15
            
        }

    }
    @IBAction func loginButtonAc(_ sender: Any) {
        if validated(username: usernameTF.text!, password: passwordTF.text!) {
            
            let username = usernameTF.text!
            let password = passwordTF.text!
            
            login(username: username, password: password   )
            seeNotesView()
        }else{print("not valid")}
 
    }
    
    func validated(username:String, password:String) -> Bool {
        if usernameTF.text != nil || passwordTF.text != nil || password.count >= 6  {
            return true
        }
        return false
    }
    
    func seeNotesView()  {
        guard let pushBU = self.storyboard?.instantiateViewController(withIdentifier: "notesTable") else { return }
        self.navigationController?.pushViewController(pushBU, animated: true)
    }
    
    func signup( username:String, password:String , name:String, phone:String){
        
        print("signup here")
        
        Auth.auth().createUser(withEmail: username, password: password) {(user, error) in
            if user != nil {
                print("User : Has SignUp")
            }
            if error != nil {
                print(":(",error ?? "errrrrrr")
            }
        }
}
    
    func login( username:String, password:String)  {
        Auth.auth().signIn(withEmail: username, password: password) {(user , error) in
             if user != nil {
                let userId = user!.user.uid
                let useremail = user!.user.email
                print("User : \(userId)Has Sign In")
                print("User : \(useremail!)Has Sign In")
             }
             if error != nil {
                 print(":(",error ?? "errrrrrr")
             }
 }
    }

}
