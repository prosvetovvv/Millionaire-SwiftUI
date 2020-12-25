//
//  VictoryView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 18.12.2020.
//

import SwiftUI

struct VictoryView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("You Won! Congratulation!")
            Text("🏆")
                .font(.system(size: 150))
                .padding()
                .onTapGesture {
                    MainMenuView()
                    //self.presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

struct VictoryView_Previews: PreviewProvider {
    static var previews: some View {
        VictoryView()
    }
}

