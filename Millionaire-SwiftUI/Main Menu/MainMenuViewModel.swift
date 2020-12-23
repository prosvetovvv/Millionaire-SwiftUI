//
//  MainMenuViewModel.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 15.12.2020.
//

import SwiftUI

enum MenuSheets: Identifiable {
    var id: Int {
        hashValue
    }
    case start, settings, results
}

final class MainMenuViewModel: ObservableObject {
        
    @Published var activeSheet: MenuSheets?
    @Published var settings: GameSettings
    
    let caretaker = Caretaker()
    
    init() {
        settings = caretaker.loadSettings() ?? GameSettings(random: false)
    }
}
