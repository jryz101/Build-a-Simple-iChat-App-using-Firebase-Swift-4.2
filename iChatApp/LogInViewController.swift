//  LogInViewController.swift
//  iChatApp
// This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD


class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    
    //(LOGIN BUTTON)
    @IBAction func logInPressed(_ sender: AnyObject) {
        //17. Implement SVProgressHUD.
        SVProgressHUD.show()

        
        //3. Log in the user.
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            //Conditional login statement.
            if error != nil {
                print(error!)
            }
            else {
                print("Login Successful!")
                
                //Call SVProgressHUD dismiss.
                SVProgressHUD.dismiss()
                //->Add SVProgressHUB in RegisterViewController.swift in line 35 and 54.
                
                //Send user to goToChat screen.
                self.performSegue(withIdentifier: "goToChat", sender: self)
                //->Code up tableView in ChatViewController.swift.
            }
        }
        
    }
    
}
