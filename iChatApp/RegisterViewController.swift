//  RegisterViewController.swift
//  iChatApp
//  This is the View Controller which registers new users with Firebase




import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {

    
    
    //LINKED IB OUTLETS.
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //(REGISTER BUTTON)
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        //18.Implement SVProgressHUB.
        SVProgressHUD.show()
        
        //(CLOSURE, COMPLETION HANDLERS)
        //1. Create new user via email and password in Firbase database.
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            
            //Handle error.
            if error != nil {
            
            print(error!)
            
            }
            else {
                
            //Register successful.
            print("Registration Successful")
                
            //Call SVProgressHUD dismiss.
            SVProgressHUD.dismiss()
            
            //(PERFORM SEGUE)
            //Send new user to goToChat Screen after successfully registered.
            self.performSegue(withIdentifier: "goToChat", sender: self)
            //->Continue to code the log out button in ChatViewController.swift, line 209.
            }
        }
        
    }
    
}
