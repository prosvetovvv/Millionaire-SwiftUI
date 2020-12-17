//
//  SettingsView.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 15.12.2020.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel = MainMenuViewModel()
    //@Binding var isShowingSettingsView: Bool
    
    var body: some View {
        VStack {
            XDismissButton(sheet: $viewModel.activeSheet)
            
            Spacer()
            
            Text("Settings")
                .font(.body)
                .padding()
            
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
