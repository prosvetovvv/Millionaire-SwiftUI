//
//  File.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import Foundation

struct Question {
    let question: String
    let answers: [Answer]
    let rightAnswer: Int
}

struct Answer: Hashable, Identifiable {
    var id = UUID()
    let answer: Int
    let isRight: Bool
}

struct QuestionsData {
    static let questions = [
        Question(question: "1 + 1 = ?",
                 answers: [Answer(answer: 1, isRight: false), Answer(answer: 2, isRight: true), Answer(answer: 3, isRight: false), Answer(answer: 4,isRight: false)],
                 rightAnswer: 2),
        
        Question(question: "2 + 2 = ?",
                 answers: [Answer(answer: 2, isRight: false), Answer(answer: 3, isRight: false), Answer(answer: 4, isRight: true), Answer(answer: 5, isRight: false)],
                 rightAnswer: 4),
        
        Question(question: "3 + 3 = ?",
                 answers: [Answer(answer: 3, isRight: false), Answer(answer: 4, isRight: false), Answer(answer: 5, isRight: false), Answer(answer: 6, isRight: true)],
                 rightAnswer: 6),
        
        Question(question: "4 + 4 = ?",
                 answers: [Answer(answer: 4, isRight: false), Answer(answer: 5, isRight: false), Answer(answer: 6, isRight: false), Answer(answer: 8, isRight: true)],
                 rightAnswer: 2)
    ]
}

    
