//
//  ContentView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import SwiftUI

struct AnswerGridView: View {
    
    @StateObject var viewModel = AnswerGridViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                let questionNumber  = viewModel.score
                
                Spacer()
                
                QuestionText(answer: QuestionsData.questions[questionNumber].question)
                
                Spacer()
                
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(QuestionsData.questions[questionNumber].answers) { answer in
                        AnswerTitleView(title: "\(answer.answer)")
                            .onTapGesture {
                                if answer.isRight, viewModel.score < QuestionsData.questions.count - 1 {
                                    self.viewModel.score += 1
                                    debugPrint(viewModel.score)
                                } else {
                                    debugPrint("Game over. Right answers: \(viewModel.score)")
                                }
                            }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerGridView()
    }
}

struct BackgroundView: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct QuestionText: View {
    
    var answer: String
    
    var body: some View {
        Text(answer)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct AnswerTitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
            .padding()
    }
}
