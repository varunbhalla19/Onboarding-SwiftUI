//
//  Name.swift
//  Onboarding-SwiftUI
//
//  Created by varunbhalla19 on 15/08/22.
//

import SwiftUI

struct Name: View {
    
    @Binding var nameField: String
    
    var body: some View {
        VStack.init {

            Text.init("What's Your Name?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            TextField.init("Write your name...", text: $nameField)
                .font(.title3)
                .padding()
                .background(.white.opacity(4.5/5))
                .cornerRadius(16)
                .padding().padding(.horizontal)
            
        }
    }
}
