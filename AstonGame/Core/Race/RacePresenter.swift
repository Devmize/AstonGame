//
//  RacePresenter.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation

// MARK: - Protocols

protocol IRacePresenter {
    func saveGameResult()
    func getSpeed() -> Int
    func getScore() -> Int
    func addScore()
}

final class RacePresenter: IRacePresenter {
    
    private let storageManager: IStorageManager
    private var score: Int = 0
    private let speed: Int
    
    
    init(storageManager: IStorageManager) {
        self.storageManager = storageManager
        let difficulty = storageManager.fetchSettings().difficulty
        switch Difficulty(rawValue: difficulty) {
        case .easy:
            self.speed = Constants.easySpeed
        case .normal:
            self.speed = Constants.normalSpeed
        case .hard:
            self.speed = Constants.hardcoreSpeed
        case .none:
            self.speed = 0
        }
    }
    
    func getScore() -> Int {
        return self.score
    }
    
    func getSpeed() -> Int {
        return self.speed
    }
    
    func addScore() {
        self.score += 1
    }
    
    func saveGameResult() {
        let settings = self.storageManager.fetchSettings()
        let date = self.getCurrentDate()
        let model = RecordModel(avatar: settings.avatar, name: settings.name, score: "\(self.score)", date: date)
        self.storageManager.saveRecords(model: model)
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
        return dateFormatter.string(from: date)
    }
}
