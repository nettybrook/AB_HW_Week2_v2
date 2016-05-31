//
//  LoginViewController.swift
//  AB_HW_Week2_v2
//
//  Created by Annette Brookman on 5/25/16.
//  Copyright © 2016 Annette Brookman. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    var initialFieldParentY: CGFloat!
    var initialButtonParentY: CGFloat!
    var offsetFieldParent: CGFloat!
    var offsetButtonParent: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginScrollView.delegate = self
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        initialFieldParentY = fieldParentView.frame.origin.y
        offsetFieldParent = -100
        
        initialButtonParentY = buttonParentView.frame.origin.y
        offsetButtonParent = -250
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func keyboardWillShow(notification: NSNotification!) {
        
        self.fieldParentView.frame.origin.y = initialFieldParentY + offsetFieldParent
        self.buttonParentView.frame.origin.y = initialButtonParentY + offsetButtonParent
        self.loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom

    }
    
    func keyboardWillHide(notification: NSNotification!) {
       
        self.fieldParentView.frame.origin.y = initialFieldParentY
        self.buttonParentView.frame.origin.y = initialButtonParentY
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if self.loginScrollView.contentOffset.y <= -50  {
            
            view.endEditing(true)
            
        } else {
            
        print ("hello")
        
        }
        
    }
    
    @IBAction func onTapBackButton(sender: AnyObject) {
        
        navigationController!.popViewControllerAnimated(true)
   
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        
        self.loginIndicator.startAnimating()
        if self.emailField.text!.isEmpty || self.passwordField.text!.isEmpty {
            
            let alertController = UIAlertController(title: "Empty Fields", message: "Please enter an email address and password", preferredStyle: .Alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
                
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        
        }
    
        delay(2.0) { () -> () in
        if self.emailField.text == "annette" && self.passwordField.text == "password" {
                    
            self.loginIndicator.stopAnimating()
            self.loginButton.selected = false
                    
            self.performSegueWithIdentifier("signedinSegue", sender: self)

                    
        } else {
            
            let alertController = UIAlertController(title: "Incorrect Email & Password", message: "Please try again", preferredStyle: .Alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
            }
            
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
                    
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in

            // handle response here.
            }
            
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
                    
            self.presentViewController(alertController, animated: true) {
                        
            // optional code for what happens after the alert controller has finished presenting
            }
                    
                    print("Password incorrect")
                    self.loginIndicator.stopAnimating()
                    self.loginButton.selected = false
                    
            }
                
        }
    }
    
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */