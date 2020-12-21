//
//  SequenceStrategy.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 21.12.2020.
//

import Foundation

protocol QuestionsListStrategy {
    func getList(from array: [Question]) -> [Question]
}

struct QuestionsList {
    let strategy: QuestionsListStrategy
    
    func getList(_ questions: [Question]) -> [Question] {
        return strategy.getList(from: questions)
    }
}

struct SequenceStrategy: QuestionsListStrategy {
    func getList(from array: [Question]) -> [Question] {
        return array
    }
}

struct RandomStrategy: QuestionsListStrategy {
    func getList(from array: [Question]) -> [Question] {
        var shuffleArray = array
        shuffleArray.shuffle()
        return shuffleArray
    }
}
