//
//  SequenceStrategy.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 21.12.2020.
//

import Foundation

protocol QuestionsListStrategy {
    func getList() -> [Question]
}

struct QuestionsList {
    let strategy: QuestionsListStrategy
    
    func getList() -> [Question] {
        return strategy.getList()
    }
}

struct SequenceStrategy: QuestionsListStrategy {
    func getList() -> [Question] {
        return QuestionsData.questions
    }
}

struct RandomStrategy: QuestionsListStrategy {
    func getList() -> [Question] {
        var shuffleQuestions = QuestionsData.questions
        shuffleQuestions.shuffle()
        return shuffleQuestions
    }
}
