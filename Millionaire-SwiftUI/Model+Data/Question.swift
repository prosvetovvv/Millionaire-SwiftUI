//
//  File.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import Foundation

struct Question {
    let question: String
    let answers: [Answers]
    let rightAnswer: Int
}

struct Answers: Hashable, Identifiable {
    var id = UUID()
    let answer: Int
    let isRight: Bool
}

struct QuestionsData {
    static let questions = [
        Question(question: "1 + 1 = ?",
                 answers: [Answers(answer: 1, isRight: false), Answers(answer: 2, isRight: true), Answers(answer: 3, isRight: false), Answers(answer: 4,isRight: false)],
                 rightAnswer: 2),
        
        Question(question: "2 + 2 = ?",
                 answers: [Answers(answer: 2, isRight: false), Answers(answer: 3, isRight: false), Answers(answer: 4, isRight: true), Answers(answer: 5, isRight: false)],
                 rightAnswer: 4),
        
        Question(question: "3 + 3 = ?",
                 answers: [Answers(answer: 3, isRight: false), Answers(answer: 4, isRight: false), Answers(answer: 5, isRight: false), Answers(answer: 6, isRight: true)],
                 rightAnswer: 6),
        
        Question(question: "4 + 4 = ?",
                 answers: [Answers(answer: 4, isRight: false), Answers(answer: 5, isRight: false), Answers(answer: 6, isRight: false), Answers(answer: 8, isRight: true)],
                 rightAnswer: 2)
    ]
}
    
