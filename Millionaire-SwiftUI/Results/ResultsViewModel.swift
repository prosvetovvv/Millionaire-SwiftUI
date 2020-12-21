//
//  ResultsModelView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 18.12.2020.
//

import Foundation



final class ResultsViewModel: ObservableObject {
    
    private let caretaker = Caretaker()
    
    @Published var results: [Result] {
        didSet {
            caretaker.save(results: results)
        }
    }
    
    init() {
        results = caretaker.loadResults()
    }
}
