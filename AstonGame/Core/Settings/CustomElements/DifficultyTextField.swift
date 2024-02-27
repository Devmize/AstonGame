//
//  DifficultyTextField.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import UIKit

enum Difficulty: String, CaseIterable {
    case easy = "Easy"
    case normal = "Normal"
    case hard = "Hardcore"
}

final class DifficultyTextField: UITextField {
    
    // MARK: - Properties
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    private var pickerView = UIPickerView()
    
    // MARK: - Lifecycle
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.inputView = self.pickerView
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
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

// MARK: - Extensions

extension DifficultyTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Difficulty.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rawValue = Difficulty.allCases[row].rawValue
        return Difficulty(rawValue: rawValue)?.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = Difficulty.allCases[row].rawValue
        self.resignFirstResponder()
    }
    
}
