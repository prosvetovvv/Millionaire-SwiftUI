//
//  File.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import Foundation

struct Question: Codable {
    let question: String
    let answers: [Answer]
}

struct Answer: Hashable, Identifiable, Codable {
    var id = UUID()
    let answer: String
    let isRight: Bool
}

struct QuestionsData {
    static let questions = [
        Question(question: "1 + 1 = ?",
                 answers: [Answer(answer: "1", isRight: false), Answer(answer: "2", isRight: true), Answer(answer: "3", isRight: false), Answer(answer: "4",isRight: false)]),
                 
        
        Question(question: "2 + 2 = ?",
                 answers: [Answer(answer: "2", isRight: false), Answer(answer: "3", isRight: false), Answer(answer: "4", isRight: true), Answer(answer: "5", isRight: false)]),
                 
        
        Question(question: "3 + 3 = ?",
                 answers: [Answer(answer: "3", isRight: false), Answer(answer: "4", isRight: false), Answer(answer: "5", isRight: false), Answer(answer: "6", isRight: true)]),
                 
        
        Question(question: "4 + 4 = ?",
                 answers: [Answer(answer: "4", isRight: false), Answer(answer: "5", isRight: false), Answer(answer: "6", isRight: false), Answer(answer: "8", isRight: true)])
                 
    ]
}

    
