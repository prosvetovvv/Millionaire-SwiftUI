//
//  ResultsCaretaker.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 18.12.2020.
//

import Foundation

final class ResultsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "results"
    
    func save(results: [Result]) {
            do {
                let data = try self.encoder.encode(results)
                UserDefaults.standard.set(data, forKey: key)
            } catch {
                print(error)
            }
        }
    
    func retrieveRecords() -> [Result] {
            guard let data = UserDefaults.standard.data(forKey: key) else {
                return []
            }
            do {
                return try self.decoder.decode([Result].self, from: data)
            } catch {
                print(error)
                return []
            }
        }
}
