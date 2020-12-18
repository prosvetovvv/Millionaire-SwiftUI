//
//  ResultsButton.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 17.12.2020.
//

import SwiftUI

struct ResultsButton: View {
    
    @Binding var sheet: MenuSheets?
    
    var body: some View {
        HStack {
            
            Button {
                sheet = .results
            } label: {
                Image(systemName: "target")
                    .foregroundColor(.black)
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
            .padding()
            
            Spacer()
        }
    }
    
    struct ResultsButton_Previews: PreviewProvider {
        static var previews: some View {
            ResultsButton(sheet: .constant(.results))
        }
    }
}
