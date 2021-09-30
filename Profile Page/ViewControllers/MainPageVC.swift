//
//  MainPageVC.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 27.09.2021.
//

import UIKit

class MainPageVC: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Welcome, \(user.person.fullName)!"
    }

}
