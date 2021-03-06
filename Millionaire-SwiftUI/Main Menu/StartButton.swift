//
//  StartButton.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 16.12.2020.
//

import SwiftUI

struct StartButton: View {
    
    @Binding var isShowingGameView: Bool
    
    var body: some View {
        Button {
            isShowingGameView.toggle()
        } label: {
            Text("Start Game")
                .frame(width: 300, height: 50)
                .background(Color(.blue))
                .foregroundColor(Color(.white))
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
        }
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(isShowingGameView: .constant(false))
    }
}
