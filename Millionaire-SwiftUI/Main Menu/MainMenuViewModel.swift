//
//  MainMenuViewModel.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 15.12.2020.
//

import SwiftUI

//enum MenuSheets: Identifiable {
//    var id: Int {
//        hashValue
//    }
//    case start, settings, results
//}

final class MainMenuViewModel: ObservableObject {
        
    //@Published var activeSheet: MenuSheets?
    //@Published private var questions: [Question]
    
    private let caretaker = Caretaker()
    private var settings: Settings
    
    init() {
        settings = caretaker.loadSettings() ?? Settings.defaultSettings
    
//        if caretaker.loadQuestions().isEmpty {
//            questions = QuestionsData.questions
//            caretaker.save(questions: questions)
//        } else {
//            questions = caretaker.loadQuestions()
//        }
    }
}
