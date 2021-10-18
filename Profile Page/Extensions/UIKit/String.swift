//
//  String.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 17.10.2021.
//

import UIKit

extension String {
    //MARK: -
        
    enum ValidTypes {
        case name
    }
    
    //MARK: - При помощи предиката фильтруем строку на соответствие регулярному выражению
    
    enum Regex: String {
        case name = "[a-zA-z]{1,}"
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .name: regex = Regex.name.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}