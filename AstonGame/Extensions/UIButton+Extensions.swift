//
//  Extensions+UIButton.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 01.02.2024.
//

import UIKit
import Foundation

extension UIButton {
    
    func configure(title: String) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: Constants.regularFontSize, weight: .regular)
        self.setTitleColor(Constants.buttonTextColor, for: .normal)
        self.layer.borderWidth = Constants.buttonBorderWidth
        self.layer.borderColor = Constants.buttonBorderColor
        self.layer.cornerRadius = Constants.buttonCornerRadius
    }
    
}
