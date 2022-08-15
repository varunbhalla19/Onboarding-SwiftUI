//
//  Welcome.swift
//  Onboarding-SwiftUI
//
//  Created by varunbhalla19 on 15/08/22.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack.init {
            
            Spacer.init()
            
            Image.init(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
            
            Spacer.init()
            
            Text.init("Find your match!")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text.init("This is the only app where you can find your match online. That's because this has been made using Swift and SwiftUI.")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.vertical)
            
            Spacer.init()
            Spacer.init()
            
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding()
        
    }

}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome().background(.orange)
    }
}
