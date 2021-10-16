//
//  LogonViewController.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 16.10.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
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
        label.text = "Profile App"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter email"
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password"
        
        return textField
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
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Sign In", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //MARK: -
    private var textFieldsStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    
    @objc func signInButtonTapped() {
        let navigationVC = UINavigationController(rootViewController: AlbumsViewController())
        navigationVC.modalPresentationStyle = .fullScreen
        self.present(navigationVC, animated: true)
    }
    
    @objc func signUpButtonTapped() {
        let signUpVC = SignUpViewController()
        self.present(signUpVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupDelegate()
        setConstraints()
    }
    
    //MARK: -
    private func setupView() {
        title = "Sign In"
        view.backgroundColor = .white
        
        textFieldsStackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField], axis: .vertical, spacing: 10, distibution: .fillProportionally)
        
        buttonsStackView = UIStackView(arrangedSubviews: [signInButton, signUpButton], axis: .horizontal, spacing: 10, distibution: .fillEqually)
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(loginLabel)
        backgroundView.addSubview(textFieldsStackView)
        backgroundView.addSubview(buttonsStackView)
    }
    
    private func setupDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

//MARK: -
extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
}

//MARK: -
extension AuthViewController {
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
            loginLabel.bottomAnchor.constraint(equalTo: textFieldsStackView.topAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            textFieldsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            textFieldsStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            textFieldsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            textFieldsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            buttonsStackView.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 30),
            buttonsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

