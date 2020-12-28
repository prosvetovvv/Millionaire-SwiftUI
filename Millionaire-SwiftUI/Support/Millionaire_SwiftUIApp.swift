//
//  Millionaire_SwiftUIApp.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 11.12.2020.
//

import SwiftUI

@main
struct Millionaire_SwiftUIApp: App {
    
    var currentQuestionList = GameSettings()
    
    var body: some Scene {
        WindowGroup {
            //AnswerGridView()
            //MainMenuNavigationView()
            MainMenuView().environmentObject(currentQuestionList)
        }
    }
}
