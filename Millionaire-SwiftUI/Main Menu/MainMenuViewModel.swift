//
//  MainMenuViewModel.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 15.12.2020.
//

import SwiftUI

enum Sheets: Identifiable {
    var id: Int {
        hashValue
    }
    case start, settings
}

final class MainMenuViewModel: ObservableObject {
        
    @Published var activeSheet: Sheets? = nil
}
