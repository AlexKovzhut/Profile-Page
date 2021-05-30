//
//  WelcomePageController.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 30.05.2021.
//

import UIKit

class WelcomePageController: UIViewController {
    @IBOutlet weak var greetingsLabel: UILabel!
    
    @IBOutlet weak var returnButton: UIButton!
    
    var login: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else { return }
        greetingsLabel.text = "Welcome, \(login)"

    }
    
    @IBAction func returnPressedButton(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
}
