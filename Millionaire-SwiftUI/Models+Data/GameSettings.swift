//
//  CurrentQuestionList.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 28.12.2020.
//

import Foundation

final class GameSettings: ObservableObject {
    
    @Published var settings: Settings {
        didSet {
            caretaker.save(settings: settings)
        }
    }
    
    @Published var questions: [Question] {
        didSet {
            caretaker.save(questions: questions)
        }
    }
    
    private let caretaker = Caretaker()
    
    init() {
        settings = caretaker.loadSettings() ?? Settings.defaultSettings
        questions = caretaker.loadQuestions() ?? QuestionsData.questions
        
//        if questions.isEmpty {
//            questions = QuestionsData.questions
//            caretaker.save(questions: questions)
//        }
    }
    
    func addQuestion(_ question: Question) {
        self.questions.append(question)
    }
}
