//
//  LoginController.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 30.05.2021.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var forgotLoginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? WelcomePageController else { return }
        destinationVC.login = loginTextField.text
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginPressedButton(_ sender: UIButton) {
        if loginTextField.text == "Admin" && passwordTextField.text == "Qwerty123" {
        performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
    }

}
