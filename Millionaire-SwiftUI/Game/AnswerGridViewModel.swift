//
//  AnswerGridViewModel.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import SwiftUI

final class AnswerGridViewModel: ObservableObject {
    
    @Published var score = 0
    
    let columns: [GridItem] = [GridItem(.flexible())]
}
