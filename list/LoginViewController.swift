//
//  LoginViewController.swift
//  list
//
//  Created by Shweta on 31/03/22.
//  Copyright © 2022 Shweta. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        
        
        
        if( userEmail!.isEmpty||userPassword!.isEmpty)
        {
            
            displayMyAlertMessage("All fields are required");
            
            return
        }
        
        if ( userEmail != userEmailStored && userPassword != userPasswordStored)
        {
            displayMyAlertMessage("Email OR Password does not exists")
            return
        }
        
        if ( userEmail != userEmailStored)
        {
            displayMyAlertMessage("Incorrect Email id")
            return
        }
        
        
        
        if ( userPassword != userPasswordStored)
        {
            displayMyAlertMessage("Incorrect Password")
            return
            
        }
        
        // store data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey:"userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey:"userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        
        if(userEmailStored == userEmail)
        {
            if(userPasswordStored == userPassword)
            {
                //login is successfull
                NSUserDefaults.standardUserDefaults().setBool(true,forKey:"isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                self.dismissViewControllerAnimated(true, completion: nil);
            }
            
            
            
        }
        
    }
    
    
    func displayMyAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"OK",style: UIAlertActionStyle.Default, handler:nil)
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     
     */
    
}
