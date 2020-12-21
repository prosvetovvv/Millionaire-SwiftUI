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
    
    private let resultsViewModel = ResultsViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var remainingQuestions = QuestionsData.questions
    var score = 0
    
    init() {
        currentAnswer = remainingQuestions.first!
    }
    
    func check(_ answer: Answer) {
        remainingQuestions.removeFirst()
        if answer.isRight, !remainingQuestions.isEmpty {
            score += 1
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
