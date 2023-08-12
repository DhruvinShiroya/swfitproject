//
//  LoginViewController.swift
//  moviesflix
//
//  Created by harman on 2023-08-07.
//

import UIKit
import CoreData
class LoginViewController: UIViewController {

    
 
    @IBOutlet weak var txtUserName: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    

    
    @IBOutlet weak var err: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkCredentail(_ sender: Any) {
        err.text = ""
     
        if txtUserName.text != nil && txtPassword.text != nil{
            
//            let fetchRequest: NSFetchRequest<User>
//            fetchRequest = User.fetchRequest()
//            fetchRequest.fetchLimit = 1

//            // get reference to a Object context
//            let context = DatabaseController.getContext()
            
            let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
            
//            fetchRequest.predicate = NSPredicate(
//                            format: "username LIKE \(String(describing: txtUserName.text))")
        
            do {let searchResult = try DatabaseController.getContext().fetch(fetchRequest)
                
                print(searchResult.count)
                
                for result in searchResult as [User] {
                    
                if(txtPassword.text == result.password && txtUserName.text == result.username){
                    
                self.performSegue(withIdentifier: "dashboard", sender: self)
                }

                    print("\(result.username!) , \(result.password!)")
                }
                
                err.text = "You have entered wrong credential"
                
            } catch {
                print("Error : \(error)")
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dashboard" {
            if let DashboardConroller = segue.destination as? FindMovieViewController{
                DashboardConroller.username = txtUserName.text!
            }
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
