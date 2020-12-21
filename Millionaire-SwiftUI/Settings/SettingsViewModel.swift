//
//  SittingsViewModel.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 21.12.2020.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    private let caretaker = Caretaker()
    
    @Published var isRandom: Bool {
        didSet {
            settings.random = isRandom
            caretaker.save(settings: settings)
        }
    }
    
    @Published var settings: Settings
        
    init() {
        settings = caretaker.loadSettings() ?? Settings(random: false)
        self.isRandom = true
        
    }
    
}
