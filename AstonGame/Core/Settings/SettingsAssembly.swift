//
//  SettingsAssembly.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation
import UIKit

final class SettingsAssembly {
    
    func assemble() -> UIViewController {
        let storageManager = StorageManager()
        let presenter = SettingsPresenter(storageManager: storageManager)
        let viewController = SettingsViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
