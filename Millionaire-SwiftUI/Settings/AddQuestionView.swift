//
//  AddQuestionView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 24.12.2020.
//

import SwiftUI

struct AddQuestionView: View {
    
    @ObservedObject var settingsViewModel = SettingsViewModel()
    
    @State private var questionText: String = ""
    @State private var correctAnswer: String = ""
    @State private var incorrectAnswerOne: String = ""
    @State private var incorrectAnswerTwo: String = ""
    @State private var incorrectAnswerThree: String = ""
    @State private var invalid: Bool = false
    
    private var question: Question {
        return Question(question: questionText, answers: answers)
    }
    
    private var answers: [Answer] {
        var answer = [Answer(answer: correctAnswer, isRight: true),
                      Answer(answer: incorrectAnswerOne, isRight: false),
                      Answer(answer: incorrectAnswerTwo, isRight: false),
                      Answer(answer: incorrectAnswerThree, isRight: false)]
        answer.shuffle()
        return answer
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("  Enter your question",
                      text: $questionText,
                      onCommit: validate)
                .frame(height: 40)
                .border(Color.gray)
                .padding()
            
            TextField("  Enter correct answer",
                      text: $correctAnswer,
                      onCommit: validate)
                .frame(height: 40)
                .border(Color.gray)
                .padding()
            
            TextField("  Enter incorrect answer",
                      text: $incorrectAnswerOne,
                      onCommit: validate)
                .frame(height: 40)
                .border(Color.gray)
                .padding()
            
            TextField("  Enter other incorrect answer",
                      text: $incorrectAnswerTwo,
                      onCommit: validate)
                .frame(height: 40)
                .border(Color.gray)
                .padding()
            
            TextField("  Enter the last incorrect answer",
                      text: $incorrectAnswerThree,
                      onCommit: validate)
                .frame(height: 40)
                .border(Color.gray)
                .padding()
            
//            TextField("qqqqqq", text: $correctAnswer) { isEditing in
//                self.invalid = isEditing
//            } onCommit: {
//                validate()
//            }
            
            if self.invalid {
                Button(action: settingsViewModel.addQuestion, label: {
                    Text("Add")
                })
                .padding()
            }
        }
        
        Spacer()
            .navigationTitle("Add Question")
    }
    
    private func validate() {
        if self.questionText != "", self.correctAnswer != "", self.incorrectAnswerOne != "",  self.incorrectAnswerTwo != "", self.incorrectAnswerThree != "" {
            self.invalid = true
        }
    }
}

struct AddQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuestionView()
    }
}
