//
//  AddQuestionView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 24.12.2020.
//

import SwiftUI

struct AddQuestionView: View {
    
    @ObservedObject var settingsViewModel = SettingsViewModel()
    
    @State private var question: String = ""
    @State private var correctAnswer: String = ""
    @State private var incorrectAnswerOne: String = ""
    @State private var incorrectAnswerTwo: String = ""
    @State private var incorrectAnswerThree: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("  Enter your question", text: $settingsViewModel.question)
                .frame(height: 40).border(Color.gray)
                .padding()
            TextField("  Enter correct answer", text: $settingsViewModel.correctAnswer)
                .frame(height: 40).border(Color.gray)
                .padding()
            TextField("  Enter incorrect answer", text: $settingsViewModel.incorrectAnswerOne)
                .frame(height: 40).border(Color.gray)
                .padding()
            TextField("  Enter other incorrect answer", text: $settingsViewModel.incorrectAnswerTwo)
                .frame(height: 40).border(Color.gray)
                .padding()
            TextField("  Enter the last incorrect answer", text: $settingsViewModel.incorrectAnswerThree)
                .frame(height: 40).border(Color.gray)
                .padding()
            Button(action: settingsViewModel.addQuestion, label: {
                Text("Add")
            }) .padding()
        }
        
        Spacer()
        .navigationTitle("Add Question")
    }
}

struct AddQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuestionView()
    }
}
