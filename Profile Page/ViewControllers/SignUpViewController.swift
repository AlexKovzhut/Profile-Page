//
//  SignUpViewController.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 16.10.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "First Name"
        
        return textField
    }()
    
    private let firstNameValidLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Required field"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Last Name"
        
        return textField
    }()
    
    private let lastNameValidLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Required field"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let ageValidLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Required field"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.placeholder = "Phone Number"
        
        return textField
    }()
    
    private let phoneNumberValidLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Required field"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "E-Mail"
        
        return textField
    }()
    
    private let emailValidLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Required field"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        
        return textField
    }()
    
    private let passwordValidLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Required field"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Sign Up", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var fieldsStackView = UIStackView()
    private let datePicker = UIDatePicker()
    
    let nameValidType: String.ValidTypes = .name
    let emailValidType: String.ValidTypes = .email
    let passwordValidType: String.ValidTypes = .password
    
    @objc func signUpButtonTapped() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupDatePicker()
        setupDelegate()
        setConstraints()
        registerKeyboardNotification()
    }
    
    deinit {
        removeKeyboardNotification()
    }
    
//MARK: -
    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValidTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
        if string.isValid(validType: nameValidType) {
            print("+")
        } else {
            print("-")
        }
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validType: validType) {
            label.text = validMessage
            label.textColor = .green
        } else {
            label.text = wrongMessage
            label.textColor = .red
        }
    }
    
//MARK: -
    private func setupViews() {
        title = "Sign Up"
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        
        fieldsStackView = UIStackView(arrangedSubviews: [firstNameTextField, firstNameValidLabel, lastNameTextField, lastNameValidLabel, datePicker, ageValidLabel, phoneNumberTextField, phoneNumberValidLabel, emailTextField, emailValidLabel, passwordTextField, passwordValidLabel], axis: .vertical, spacing: 10, distibution: .fillProportionally)
        
        backgroundView.addSubview(fieldsStackView)
        backgroundView.addSubview(loginLabel)
        backgroundView.addSubview(signUpButton)
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        datePicker.layer.borderWidth = 1
        datePicker.clipsToBounds = true
        datePicker.layer.cornerRadius = 10
        datePicker.tintColor = .black
    }
    
    private func setupDelegate() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

//MARK: -
extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        switch textField {
        case firstNameTextField:
            setTextField(textField: firstNameTextField, label: firstNameValidLabel, validType: nameValidType, validMessage: "Name is valid", wrongMessage: "Only A-Z characters, min 1 character", string: string, range: range)
        case lastNameTextField:
            setTextField(textField: lastNameTextField, label: lastNameValidLabel, validType: nameValidType, validMessage: "Name is valid", wrongMessage: "Only A-Z characters, min 1 character", string: string, range: range)
        case emailTextField:
            setTextField(textField: emailTextField, label: emailValidLabel, validType: emailValidType, validMessage: "Email is valid", wrongMessage: "Email is not valid", string: string, range: range)
        case passwordTextField:
            setTextField(textField: passwordTextField, label: passwordValidLabel, validType: passwordValidType, validMessage: "Password is valid", wrongMessage: "Password is not valid", string: string, range: range)
        default:
            break
        }
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}

//MARK: -
extension SignUpViewController {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }
}

//MARK: -
extension SignUpViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: fieldsStackView.topAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            fieldsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            fieldsStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            fieldsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            fieldsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 30),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
