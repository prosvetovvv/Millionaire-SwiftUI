//
//  ResultsCaretaker.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 18.12.2020.
//

import Foundation

final class Caretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let keyResult    = "results"
    private let keySettings  = "settings"
    
    func save(results: [Result]) {
            do {
                let data = try self.encoder.encode(results)
                UserDefaults.standard.set(data, forKey: keyResult)
            } catch {
                print(error)
            }
        }
    
    func save(settings: Settings) {
        do {
            let data = try self.encoder.encode(settings)
            UserDefaults.standard.setValue(data, forKey: keySettings)
        } catch {
            print(error)
        }
    }
    
    func loadResults() -> [Result] {
            guard let data = UserDefaults.standard.data(forKey: keyResult) else { return [] }
            do {
                return try self.decoder.decode([Result].self, from: data)
            } catch {
                print(error)
                return []
            }
        }
    
    func loadSettings() -> Settings? {
        guard let data = UserDefaults.standard.data(forKey: keySettings) else { return nil }
        do {
            return try self.decoder.decode(Settings.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
