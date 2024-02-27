//
//  MainAssembly.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation
import UIKit

final class MainAssembly {
    
    func assemble() -> UIViewController {
        let presenter = MainPresenter()
        let viewController = MainViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        let navController = UINavigationController(rootViewController: viewController)
        return navController
    }
}
