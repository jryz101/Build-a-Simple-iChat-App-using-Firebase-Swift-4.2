//  ViewController.swift
//  iChatApp
//  Created by Jerry tan on 25/03/2019.
//  Copyright © 2019 StarkNet Technology . All rights reserved.


import UIKit
import Firebase


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    //14.Declare message array variables.
    var messageArray : [Message] = [Message]()

    
    // We've pre-linked the IBOutlets.
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //4. Set yourself as the delegate and datasource.
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        //9. Set yourself as the delegate of the text field.
        messageTextfield.delegate = self
        
        
        //11. Set the tapGesture. A concrete subclass of UIGestureRecognizer that looks for single or multiple taps.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        //Attaches a gesture recognizer to the view.
        messageTableView.addGestureRecognizer(tapGesture)
        
        
        //6. Register Created MessageCell.xib file here, Registers a nib object containing a cell with the table view under a specified identifier.
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        configureTableView()
        
        retrieveMessages()
        
        //*Disable cell separator line.
        //messageTableView.separatorStyle = .none

        
    }

    ///////////////////////////////////////////FUNCTION
    //MARK: - TableView DataSource Methods
    //5. Asks the data source for a cell to insert in a particular location of the table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Declare dequeue reusable cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        //16.Set real message data.
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        //->Improve the UI with SVProgressHub in LoginViewController.
        
        return cell
    }
    
    //Declare function numberOfRowsInSection.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageArray.count
    }
    
    
    //7. Declare function configureTableView.(Auto Dimension)
    func configureTableView() {
        
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
        //->Continue to create message class in Message.swift.
        
    }
    
    
    //12. Declare function tableViewTapped here.
    @objc func tableViewTapped () {
        
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        messageTextfield.endEditing(true)
        
    }
    
    //MARK:- TextField Delegate Methods
    //10. Declare textFieldDidBeginEditing. Tells the delegate that editing began in the specified text field.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        //Animate changes to one or more views using the specified duration.
        UIView.animate(withDuration: 0.5) {
            
        //Set textField height expansion.
        self.heightConstraint.constant = 320
        //Lays out the subviews immediately, if layout updates are pending.
        self.view.layoutIfNeeded()
            
        }
    }
    
    //Declare function textFieldDidEndEditing.
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //Animate changes to one or more views using the specified duration.
        UIView.animate(withDuration: 0.5) {
        //Set textField height back to 50 after end editing.
        self.heightConstraint.constant = 50
        //Lays out the subviews immediately, if layout updates are pending.
        self.view.layoutIfNeeded()
            
        }
    }
    
    //MARK: - Send & Recieve from Firebase
    //SEND BUTTON.
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        //13. Send the message to Firebase and save it in our database.
        //set end Editing for the text field.
        messageTextfield.endEditing(true)
        
        //Disable UI Components.
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        //Create messages database.
        let messagesDB = Database.database().reference().child("Messages")
        
        //Create a dictionary to save message data.
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "MessageBody": messageTextfield.text!]
        
        //Create custom random key for messages can be save under unique identifier.
        messagesDB.childByAutoId().setValue(messageDictionary) {
        (error, reference) in
            //Check error.
            if error != nil {
                
                print(error!)
            }
            else {
                
                print("Message saved successfully")
            }
            
            //Re-enable messageTextfield and sendButton.
            self.messageTextfield.isEnabled = true
            self.sendButton.isEnabled = true
            
            //Clear the text Field.
            self.messageTextfield.text = ""
            //
        }
        
    }
    
    //15. Create the retrieveMessages function.
    func retrieveMessages () {
        //The entry point for accessing a Firebase Database.
        let messageDB = Database.database().reference().child("Messages")
        //observeEventType:withBlock: is used to listen for data changes at a particular location. This is the primary way to read data from the Firebase Database. Your block will be triggered for the initial data and again whenever the data changes.
        messageDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            
            let message = Message()
            
            message.messageBody = text
            message.sender = sender
            
            self.messageArray.append(message)
            
            self.configureTableView()
            self.messageTableView.reloadData()
        }
        
    }
    
    
    //(LOGOUT BUTTON)
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        //2. Log out and send the user back to WelcomeViewController.
        //Do, Try, and Catch block.
        do {
            
        //Logout user.
        try Auth.auth().signOut()
            
        //Send user back to rootViewController
        navigationController?.popToRootViewController(animated: true)
            
        }//Catch and print out error.
        catch {
            
        print("Error: there was a problem signing out")
        //->Code up the login button in LoginViewContoller.swift, line 29.
            
        }
    }

}
