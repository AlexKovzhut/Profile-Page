//
//  LoginVC.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 27.09.2021.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let user = "User"
    private let password = "Password"
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainPageVC = segue.destination as? MainPageVC else { return }
        mainPageVC.user = user
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        if loginTextField.text != user || passwordTextField.text != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(user) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(password) 😉")
    }
    
    

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Private Methods
extension LoginVC {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Alert Controller
extension LoginVC: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
            performSegue(withIdentifier: "showMainPageVC", sender: nil)
        }
        return true
    }
}
