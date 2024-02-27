//
//  CustomTextField.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation
import UIKit

final class CustomTextField: UITextField {
    
    // MARK: Properties
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    // MARK: - Lifecycle
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.configure(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: self.padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: self.padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: self.padding)
    }
    
}
