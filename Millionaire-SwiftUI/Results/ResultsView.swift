//
//  ResultsView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 17.12.2020.
//

import SwiftUI

struct ResultsView: View {
    
    @ObservedObject var viewModel = ResultsViewModel()
    
    var body: some View {
            List {
                ForEach(viewModel.results) { result in
                    ResultTitleView(data: result.date, score: result.score)
                }
            }
            .navigationTitle("Results")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
