//
//  Settings.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 21.12.2020.
//

import Foundation

struct GameSettings: Identifiable, Codable {
    var id = UUID()
    var random: Bool
}
