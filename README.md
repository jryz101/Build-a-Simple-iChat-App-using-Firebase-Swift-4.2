# Build-a-Simple-iChat-App-using-Firebase-Swift-4.2
Build a Simple iOS Messager application using Google Firebase.
Working with Firebase Auth, Database, SVProgressHUD, and ChameleonFramework.

## Setup Guide
1. Setup Google Firebase.
2. Drop GoogleService-Info.plist file to supporting files folder.
3. Install pods in PodFile. pod 'Firebase/Auth', pod 'Firebase/Database', pod 'SVProgressHUD', pod 'ChameleonFramework'.
4. Initiate Firebase in AppDelegate.swift.
5. Go to firebase console and enable the Authentication Sign in method (use email).
6. Set the firebase Rules security to (true).

## Implementation Steps
0. Import Firebase.
1. First, code up the Register Button in RegisterViewController.
2. Code up the Logout Button in ChatViewController.
3. Code up the Login Button in LoginViewController.
4. Set up messageTableView delegates.
5. Code up the data source for a cell to insert in a particular location of the table view. 
6. Register Created MessageCell.xib file, Registers a nib object containing a cell with the table view under a specified identifier.
7. Declare function configureTableView.(Auto Dimension).
8. Create a message class(blueprint). Messages need a messageBody and a sender variable.
9. Set yourself as the delegate of the text field.
10. Declare textFieldDidBeginEditing. Tells the delegate that editing began in the specified text field. 
11. Set up the tapGesture. A concrete subclass of UIGestureRecognizer that looks for single or multiple taps.
12. Declare function tableViewTapped.
13. Send the message to Firebase and save it in our database.
14. Declare message array variables.
15. Create the retrieveMessages function.
16.Set real message data.
17. Import SVProgressHUD, and call it in line 31 and 45.
18. Import SVProgressHUD, and call it in line 35 and 54.

# ScreenShot

![Screen Shot 2019-03-25 at 6 45 31 PM](https://user-images.githubusercontent.com/23055114/54913666-32bf5280-4f2e-11e9-9bc3-41b2d84f1ac9.png)

