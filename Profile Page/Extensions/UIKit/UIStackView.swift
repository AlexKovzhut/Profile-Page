//
//  UIStackView.swift
//  Profile Page
//
//  Created by Alexander Kovzhut on 16.10.2021.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distibution: UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distibution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
