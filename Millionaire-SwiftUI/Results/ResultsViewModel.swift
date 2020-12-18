//
//  ResultsModelView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 18.12.2020.
//

import Foundation

private let resultsCaretaker = ResultsCaretaker()
final class ResultsViewModel: ObservableObject {
    
    @Published var results: [Result] {
        didSet {
            resultsCaretaker.save(results: results)
        }
    }
    
    init() {
        results = resultsCaretaker.retrieveRecords()
    }
}
