//
//  SittingsViewModel.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 21.12.2020.
//

import Foundation
import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    private let caretaker = Caretaker()
    
    @Published var isRandom: Bool {
        didSet {
            currentSettings.random = isRandom
            caretaker.save(settings: currentSettings)
        }
    }
    
    var currentSettings: GameSettings
        
    init() {
        currentSettings = caretaker.loadSettings() ?? GameSettings(random: false)
        isRandom = currentSettings.random
    }
}
