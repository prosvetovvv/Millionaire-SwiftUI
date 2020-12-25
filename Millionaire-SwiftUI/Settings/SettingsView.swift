//
//  SettingsView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 15.12.2020.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel = SettingsViewModel()
    
    var body: some View {
            VStack(alignment: .leading) {
                RandomList(isRandom: $viewModel.isRandom)
                NavigationLink(
                    destination: AddQuestionView(),
                    label: {
                        Text("Add Question")
                            .padding()
                    })
                Spacer()
            }
            .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct RandomList: View {
    
    @Binding var isRandom: Bool
    
    var body: some View {
        Toggle(isOn: $isRandom, label: {
            Text("Random questions list")
                .foregroundColor(Color(.label))
        }) .padding()
    }
}

