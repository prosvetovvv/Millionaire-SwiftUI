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
    var gameSettings: GameSettings
    
    var newQuestions = [Question]() {
        didSet {
            caretaker.save(questions: newQuestions)
        }
    }
    
    @Published var question: String = ""
    @Published var correctAnswer: String = ""
    @Published var incorrectAnswerOne: String = ""
    @Published var incorrectAnswerTwo: String = ""
    @Published var incorrectAnswerThree: String = ""
    
    @Published var isRandom: Bool {
        didSet {
            gameSettings.random = isRandom
            caretaker.save(settings: gameSettings)
        }
    }
    
    init() {
        gameSettings = caretaker.loadSettings() ?? GameSettings(random: false)
        isRandom = gameSettings.random
    }
    
    func addQuestion() {
        var newAnswers = [Answer(answer: self.correctAnswer, isRight: true),
                          Answer(answer: self.incorrectAnswerOne, isRight: false),
                          Answer(answer: self.incorrectAnswerTwo, isRight: false),
                          Answer(answer: self.incorrectAnswerThree, isRight: false)]
        newAnswers.shuffle()
        let newQuestion = Question(question: self.question, answers: newAnswers)
        self.newQuestions.append(newQuestion)
    }
    
    
}

