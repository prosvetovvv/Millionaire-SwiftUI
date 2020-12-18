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

final class AnswerGridViewModel: ObservableObject {
        
    @Published var currentAnswer: Question
    @Published var activeSheet: GameSheets?
    
    var questions = QuestionsData.questions
    var currentNumberAnswer = 0
    let columns: [GridItem] = [GridItem(.flexible())]
        
    init() {
        currentAnswer = questions.first!
    }
    
    func check(_ answer: Answer) {
        //currentNumberAnswer += 1
        questions.removeFirst()
        if answer.isRight, !questions.isEmpty {
            currentAnswer = questions.first!
        } else if answer.isRight, questions.isEmpty {
            activeSheet = .victory
        } else {
            activeSheet = .loss
        }
    }
}
