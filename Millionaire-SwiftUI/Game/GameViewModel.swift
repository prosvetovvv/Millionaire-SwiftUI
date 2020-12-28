//
//  AnswerGridViewModel.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import SwiftUI

enum GameSheets: Identifiable {
    var id: Int {
        hashValue
    }
    case victory, loss
}

enum Sequence {
    case sequence, random
}

final class GameViewModel: ObservableObject {
        
    @Published var currentAnswer: Question
    @Published var activeSheet: GameSheets?
    @Published var amountOfQuestions: Int
    @Published var currentNumberOfQuestion = 1
    @Published var percentOfCorrectAnswers = 0
    
    private let caretaker = Caretaker()
    private let resultsViewModel = ResultsViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    private var remainingQuestions: [Question]
    private var score = 0
    
    private let gameSettings: Settings
    private let questionsList: QuestionsList
    
    
    init() {
        gameSettings = caretaker.loadSettings() ?? Settings(random: false)
        
        if gameSettings.random {
            questionsList = QuestionsList(strategy: RandomStrategy())
        } else {
            questionsList = QuestionsList(strategy: SequenceStrategy())
        }
        remainingQuestions = questionsList.getList()
        remainingQuestions.append(contentsOf: caretaker.loadQuestions() ?? [])
        currentAnswer = remainingQuestions.first!
        amountOfQuestions = remainingQuestions.count
    }
    
    func check(_ answer: Answer) {
        remainingQuestions.removeFirst()
        if answer.isRight, !remainingQuestions.isEmpty {
            score += 1
            percentOfCorrectAnswers = Int(100 / (Double(amountOfQuestions) / Double(score)))
            currentNumberOfQuestion += 1
            currentAnswer = remainingQuestions.first!
        } else if answer.isRight, remainingQuestions.isEmpty {
            score += 1
            resultsViewModel.results.append(Result(date: Date(), score: score))
            activeSheet = .victory
        } else {
            resultsViewModel.results.append(Result(date: Date(), score: score))
            activeSheet = .loss
        }
    }
}
