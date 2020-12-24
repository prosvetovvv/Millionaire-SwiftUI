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
        NavigationView {
            VStack {
//                HStack {
//                    ResultsButton(sheet: $viewModel.activeSheet)
//                    SettingButton(sheet: $viewModel.activeSheet)
//                }
                Spacer()
                StartButton(sheet: $viewModel.activeSheet)
                NavigationLink(
                    destination: SettingsView(),
                    label: {
                        Text("Settings")
                    }) .padding()
                NavigationLink(
                    destination: ResultsView(),
                    label: {
                        Text("Results")
                    }) .padding()
                Spacer()
            }
            
            .sheet(item: $viewModel.activeSheet) { item in
                switch item {
                case .settings:
                    SettingsView()
                case .start:
                    GameView()
                case .results:
                    ResultsView()
                }
            }
        }
    }
}
struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

