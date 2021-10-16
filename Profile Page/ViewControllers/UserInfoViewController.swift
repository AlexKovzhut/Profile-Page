//
//  UserInfoViewController.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 16.10.2021.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    private let firstNamelabel: UILabel = {
        let label = UILabel()
        label.text = "First Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let secondNamelabel: UILabel = {
        let label = UILabel()
        label.text = "Second Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-Mail"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        title = "Active User"
        view.backgroundColor = .white
        
        stackView = UIStackView(arrangedSubviews: [firstNamelabel,secondNamelabel,ageLabel,phoneLabel,emailLabel,passwordLabel], axis: .vertical, spacing: 10, distibution: .fillProportionally)
        
        view.addSubview(stackView)
    }
}

extension UserInfoViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
