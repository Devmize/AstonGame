//
//  RecordModel.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation

struct RecordModel: Codable, Equatable, Comparable {
    let avatar: String
    let name: String
    let score: String
    let date: String
    
    static func ==(lhs: RecordModel, rhs: RecordModel) -> Bool {
        return lhs.score == rhs.score
    }
    
    static func <(lhs: RecordModel, rhs: RecordModel) -> Bool {
        return Int(lhs.score)! < Int(rhs.score)!
    }
    
    static func >(lhs: RecordModel, rhs: RecordModel) -> Bool {
        return Int(lhs.score)! > Int(rhs.score)!
    }
}
