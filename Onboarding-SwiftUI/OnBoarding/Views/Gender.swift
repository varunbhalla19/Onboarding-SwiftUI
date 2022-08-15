//
//  Gender.swift
//  Onboarding-SwiftUI
//
//  Created by varunbhalla19 on 15/08/22.
//

import SwiftUI

struct Gender: View {
    
    @Binding var gender: Genders
    
    var body: some View {
        Text.init("What's Your Gender?")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)

        Text.init(gender.rawValue)
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(.white.opacity(4/5))
            .padding(.vertical).padding(.vertical)

        
        Picker.init(selection: $gender) {
            Text.init("Male").tag(Genders.male)
                Text.init("Female").tag(Genders.female)
                Text.init("Non Binary").tag(Genders.nb)
            } label: {}
            .pickerStyle(.segmented)
            .padding(.horizontal)

    }
}
