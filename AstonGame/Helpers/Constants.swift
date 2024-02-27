//
//  Constants.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 01.02.2024.
//

import Foundation
import UIKit

enum Constants {
    static let lowOffset = 16
    static let offset = 32
    static let mediumOffset = 64
    static let bigOffset = 128
    
    static let regularFontSize: CGFloat = 20
    static let mediumFontSize: CGFloat = 30
    
    // MARK: - Buttons
    static let buttonCornerRadius: CGFloat = 15
    static let buttonHeight = 64
    static let buttonBorderColor = UIColor.black.cgColor
    static let buttonBorderWidth: CGFloat = 2
    static let buttonTextColor = UIColor.black
    
    // MARK: - TextFields
    static let textFieldHeight = 55
    static let textFieldCornerRadius: CGFloat = 10
    static let textFieldBorderWidth: CGFloat = 1
    
    // MARK: - TableView
    static let cellHeight: CGFloat = 128
    
    // MARK: - UserDefaults
    static let avatarKey = "avatar"
    static let defaultAvatarName = "Default"
    static let defaultDifficulty = "Easy"
    static let nameKey = "name"
    static let defaultName = "User"
    static let recordsKey = "records"
    static let settingsKey = "settings"
    
    // MARK: - Race
    static let easySpeed = 10
    static let normalSpeed = 6
    static let hardcoreSpeed = 2
}
