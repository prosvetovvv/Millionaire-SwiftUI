//
//  Results.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 17.12.2020.
//

import Foundation

struct Result: Identifiable, Codable {
    var id = UUID()
    let date: Date
    let score: Int
}


