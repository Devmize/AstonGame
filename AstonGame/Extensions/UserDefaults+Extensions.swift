//
//  UserDefaults+Extensions.swift
//  AstonGame
//
//  Created by Евгений Мизюк on 27.02.2024.
//

import Foundation

extension UserDefaults {
    
    func setStruct<T: Encodable>(_ encodable: T, forKey: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            self.set(data, forKey: forKey)
        }
    }
    
    func getStruct<T: Decodable>(_ type: T.Type, forKey: String) -> T? {
        if let data = self.object(forKey: forKey) as? Data,
           let result = try? JSONDecoder().decode(type, from: data) {
            return result
        }
        return nil
    }
    
    func setArray<T: Encodable>(_ encodable: [T], forKey: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            self.set(data, forKey: forKey)
        }
    }
    
    func getArray<T: Decodable>(_ type: [T].Type, forKey: String) -> [T] {
        if let encodedData = self.object(forKey: forKey) as? Data {
            if let data = try? JSONDecoder().decode(type, from: encodedData) {
                return data
            }
        }
        return []
    }
}
