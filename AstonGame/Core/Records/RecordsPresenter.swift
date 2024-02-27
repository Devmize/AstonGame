//
//  RecordsPresenter.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 01.02.2024.
//

import Foundation

// MARK: - Protocols

protocol IRecordsPresenter {
    func getRecords() -> [RecordModel]
    func fetchRecords()
}

final class RecordsPresenter: IRecordsPresenter {
    
    // MARK: - Properties
    
    private var records: [RecordModel] = []
    
    private let storageManager: IStorageManager
    
    // MARK: - Lifecycle
    
    init(storageManager: IStorageManager) {
        self.storageManager = storageManager
        self.fetchRecords()
    }
    
    // MARK: - Methods
    
    func getRecords() -> [RecordModel] {
        return self.records
    }
    
    func fetchRecords() {
        let result = self.storageManager.fetchRecords().sorted(by: { $0 > $1 })
        self.records = result
    }
}
