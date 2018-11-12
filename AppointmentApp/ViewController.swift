//
//  ViewController.swift
//  AppointmentApp
//
//  Created by Jeffrey Van Horn on 11/4/18.
//  Copyright © 2018 Jeffrey Van Horn. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.emailTextField.delegate = self;
        self.passwordTextField.delegate = self;
        //self.passwordTextField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function so that the keyboard actually closes
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //close the keyboard when the user presses the return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    //function to try to log the user in when the login button is clicked
    @IBAction func loginButtonClick(_ sender: Any) {
        //get and validate the input from the user
        guard let email = emailTextField?.text, let password = passwordTextField?.text else{
            return
        }
        
        //perform more advanced input validation
        
        //try to sign in the user
        //some of this code came from ray wenderlich firebase tutorial
        Auth.auth().signIn(withEmail: email, password: password){
            user, error in
            if let error = error, user == nil {
                let alert = UIAlertController(title: "Sign In Failed",
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            }else{
                //the login was successful and we want to proceed and perform the segue
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
}

