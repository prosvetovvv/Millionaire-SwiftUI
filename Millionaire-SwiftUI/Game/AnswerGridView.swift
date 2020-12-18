//
//  ContentView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import SwiftUI

struct AnswerGridView: View {
    
    @ObservedObject var viewModel = AnswerGridViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
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
            AnswerGridView()
            AnswerGridView()
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
