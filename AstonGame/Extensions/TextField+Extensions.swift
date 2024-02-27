//
//  TextField+Extensions.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation
import UIKit

extension UITextField {
    
    func configure(placeholder: String) {
        self.placeholder = placeholder
        self.font = .systemFont(ofSize: Constants.regularFontSize)
        self.textColor = .black
        self.layer.cornerRadius = Constants.textFieldCornerRadius
        self.layer.borderWidth = Constants.textFieldBorderWidth
        self.layer.borderColor = UIColor.black.cgColor
    }
}
