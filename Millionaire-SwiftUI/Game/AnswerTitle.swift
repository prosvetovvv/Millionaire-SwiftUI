//
//  AnswerButton.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import SwiftUI

struct AnswerTitle: View {
    
    var title: String
    var textColor : Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 300, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerTitle(title: "Answer",
                     textColor: .white,
                     backgroundColor: .blue)
    }
}
