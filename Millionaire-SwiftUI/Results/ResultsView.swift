//
//  ResultsView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 17.12.2020.
//

import SwiftUI

struct ResultsView: View {
    
    let resultList: [Result] = [
        Result(date: Date(), score: 2),
        Result(date: Date(), score: 3),
        Result(date: Date(), score: 4),
        Result(date: Date(), score: 2)
    ]
    
    var body: some View {
        List {
            ForEach(resultList) { result in
                ResultTitleView(data: result.date, score: result.score)
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
