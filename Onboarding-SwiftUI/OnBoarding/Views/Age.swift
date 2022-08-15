//
//  Age.swift
//  Onboarding-SwiftUI
//
//  Created by varunbhalla19 on 15/08/22.
//

import SwiftUI

struct Age: View {
    
    @Binding var ageField: Double
    
    var body: some View {
        VStack.init {
            
            Text.init("What's Your Age?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text.init(String.init(format: "%.0f", ageField))
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.vertical)
            
            Slider.init(value: $ageField, in: 13...81, step: 1)
                .padding()
                .padding(.horizontal)
                .tint(.white)

        }
    }
}
