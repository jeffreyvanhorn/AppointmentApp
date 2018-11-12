//
//  SignUpViewController.swift
//  AppointmentApp
//
//  Created by Jeffrey Van Horn on 11/4/18.
//  Copyright © 2018 Jeffrey Van Horn. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUpUser(_ sender: Any) {
        guard let email = emailTextField?.text, let password = passwordTextField?.text else{
            //make an error message show up specific to having and empty field
            return
        }
        
        //add input validation code
        
        //now that we know that the input is valid, create a new user
        Auth.auth().createUser(withEmail: email, password: password) {
            user, error in
                //if there is not an error then we want to sing in the user
            if error == nil{
                Auth.auth().signIn(withEmail: email, password: password)
            }
        }
    }
}








