//
//  RegisterViewController.swift
//  moviesflix
//
//  Created by harman singh on 2023-08-8.
//

import UIKit
import CoreData
class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
   
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var err: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func CreateUser(_ sender: Any) {
        err.text = ""
        message.text = ""
        if txtUserName.text != nil && txtPassword.text != nil{
            var newUser: User = NSEntityDescription.insertNewObject(forEntityName: "User", into: DatabaseController.getContext()) as! User
            
            newUser.username = txtUserName.text
            newUser.password = txtPassword.text
            
            DatabaseController.saveContext()
            message.text = "new User is created Please click login"
        }else {
            err.text = "Please enter valid credential"
        }
        
        
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
