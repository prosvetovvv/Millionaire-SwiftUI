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

final class GameViewModel: ObservableObject {
        
    @Published var currentAnswer: Question
    @Published var activeSheet: GameSheets?
    
    private let resultsCaretaker = ResultsCaretaker()
    private let resultsViewModel = ResultsViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var questions = QuestionsData.questions
    var score = 0
    
    init() {
        currentAnswer = questions.first!
    }
    
    func check(_ answer: Answer) {
        questions.removeFirst()
        if answer.isRight, !questions.isEmpty {
            score += 1
            currentAnswer = questions.first!
        } else if answer.isRight, questions.isEmpty {
            score += 1
            resultsViewModel.results.append(Result(date: Date(), score: score))
            activeSheet = .victory
        } else {
            resultsViewModel.results.append(Result(date: Date(), score: score))
            activeSheet = .loss
        }
    }
}
