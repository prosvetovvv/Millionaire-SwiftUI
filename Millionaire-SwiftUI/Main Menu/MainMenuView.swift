//
//  MainMenuView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 15.12.2020.
//

import SwiftUI

struct MainMenuView: View {
    
    @StateObject var viewModel = MainMenuViewModel()
    
    var body: some View {
        VStack {
            SettingButton(sheet: $viewModel.activeSheet)
            
            Spacer()
            
            StartButton(sheet: $viewModel.activeSheet)
                
            Spacer()

        }
        
        .sheet(item: $viewModel.activeSheet) { item in
            
            switch item {
            
            case .settings:
                SettingsView()
                
            case .start:
                AnswerGridView()
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

