//
//  MainMenuView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 15.12.2020.
//

import SwiftUI

struct MainMenuView: View {
    
    @StateObject var viewModel = MainMenuViewModel()
    @State private var isShowingGameView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                StartButton(isShowingGameView: $isShowingGameView)
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
            .fullScreenCover(isPresented: $isShowingGameView, content: {
                GameView()
            })
        }
    }
    struct MainMenuView_Previews: PreviewProvider {
        static var previews: some View {
            MainMenuView()
        }
    }
}
