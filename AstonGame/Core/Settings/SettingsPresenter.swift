//
//  SettingsPresenter.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation

// MARK: - Protocols

protocol ISettingsPresenter {
    func saveSettings(model: SettingsModel)
    func fetchSettings() -> SettingsModel
}

final class SettingsPresenter: ISettingsPresenter {
    
    // MARK: - Properties
    
    private let storageManager: IStorageManager
    
    // MARK: - Lifecycle
    
    init(storageManager: IStorageManager) {
        self.storageManager = storageManager
    }
    
    // MARK: - Methods
    
    func saveSettings(model: SettingsModel) {
        self.storageManager.saveSettings(model: model)
    }
    
    func fetchSettings() -> SettingsModel {
        return self.storageManager.fetchSettings()
    }
}
