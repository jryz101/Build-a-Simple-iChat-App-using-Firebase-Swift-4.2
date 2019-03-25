//  WelcomeViewController.swift
//  iChatApp
//  This is the welcome view controller - the first thing the user sees.

////////////////////////////////////////////////////////////////////////



//1.Setup Firebase.

//2.Drop GoogleService-Info.plist file to supporting files folder.

//3.Install pods in PodFile.

/*
 pod 'Firebase/Auth'
 pod 'Firebase/Database'
 pod 'SVProgressHUD'
 pod 'ChameleonFramework'
 */


//4.Initiate Firebase with FirebaseApp.configure() in AppDelegate.swift.

/*
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    TODO: Initialise and Configure your Firebase here:
 
    FirebaseApp.configure()

    return true
}
*/


//5.Go to firebase console and enable the Authentication Signin method (use email).

//6.Set the firebase Rules security to true.

//7.Start the coding steps in RegisterViewController.swift, line 32.


import UIKit

class WelcomeViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
