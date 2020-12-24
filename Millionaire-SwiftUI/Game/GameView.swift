//
//  ContentView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                NumberOfQuestionView(currentNumberOfQuestion: viewModel.currentNumberOfQuestion,
                                     amountOfQuestions: viewModel.amountOfQuestions,
                                     percentOfCorrectAnswers: viewModel.percentOfCorrectAnswers)
                Spacer()
                QuestionText(answer: viewModel.currentAnswer.question)
                Spacer()
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(viewModel.currentAnswer.answers) { answer in
                        AnswerTitleView(title: "\(answer.answer)")
                            .onTapGesture {
                                viewModel.check(answer)
                            }
                    }
                }
            }
            Spacer()
        }
        
        .sheet(item: $viewModel.activeSheet) { item in
            switch item {
            case .victory:
                VictoryView()
            case .loss:
                LossView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
            GameView()
        }
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

struct NumberOfQuestionView: View {
    
    var currentNumberOfQuestion: Int
    var amountOfQuestions: Int
    var percentOfCorrectAnswers: Int
    
    var body: some View {
        VStack {
            Text("Current question: \(currentNumberOfQuestion)/\(amountOfQuestions)")
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
            Text("Correct answers: \(percentOfCorrectAnswers)%")
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
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
