//
//  RecordsAssembly.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation
import UIKit

final class RecordsAssembly {
    
    func assemble() -> UIViewController {
        let storageManager = StorageManager()
        let presenter = RecordsPresenter(storageManager: storageManager)
        let viewController = RecordsViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
