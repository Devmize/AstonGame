//
//  StorageManager.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 01.02.2024.
//

import Foundation
import UIKit

// MARK: - Protocols

protocol IStorageManager {
    func saveRecords(model: RecordModel)
    func fetchRecords() -> [RecordModel]
    func saveSettings(model: SettingsModel)
    func fetchSettings() -> SettingsModel
}

final class StorageManager: IStorageManager {
    
    // Добавить возможность изменять аватарку изображение
    
    func saveRecords(model: RecordModel) {
        var records = self.fetchRecords()
        records.append(model)
        UserDefaults.standard.setArray(records, forKey: Constants.recordsKey)
    }
    
    func fetchRecords() -> [RecordModel] {
        return UserDefaults.standard.getArray([RecordModel].self, forKey: Constants.recordsKey)
    }
    
    func saveSettings(model: SettingsModel) {
        UserDefaults.standard.setStruct(model, forKey: Constants.settingsKey)
    }
    
    func fetchSettings() -> SettingsModel {
        let model = UserDefaults.standard.getStruct(SettingsModel.self, forKey: Constants.settingsKey) ?? SettingsModel(avatar: Constants.defaultAvatarName, name: Constants.defaultName, difficulty: Constants.defaultDifficulty)
        return model
    }
}
