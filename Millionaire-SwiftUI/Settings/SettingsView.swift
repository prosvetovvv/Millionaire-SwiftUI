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
        VStack {
            //XDismissButton(sheet: $viewModel.activeSheet)
            RandomList(isRandom: $viewModel.isRandom)
            Spacer()
        }
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
