//
//  ResultTitleView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 17.12.2020.
//

import SwiftUI

struct ResultTitleView: View {
    
    let data: Date
    let score: Int
    
    var body: some View {
        HStack {
            Text("\(data)")
                .padding()
            
            Spacer()
            
            Text("\(score)")
                .padding()
        }
    }
}

struct ResultTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTitleView(data: Date(), score: 4)
    }
}
