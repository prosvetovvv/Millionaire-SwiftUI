//
//  XDismissButton.swift
//  Millionaire-SwiftUI
//
//  Created by Vitaly Prosvetov on 15.12.2020.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var sheet: Sheets?
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                sheet = nil
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(sheet: .constant(nil))
    }
}
