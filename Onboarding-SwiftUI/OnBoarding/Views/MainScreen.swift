//
//  MainScreen.swift
//  Onboarding-SwiftUI
//
//  Created by varunbhalla19 on 15/08/22.
//

import SwiftUI

struct MainScreen: View {
    @AppStorage("onboarding.signin") var isSignedIn: Bool?
    
    var body: some View {
        ZStack.init {
            gradientBackground.ignoresSafeArea()            
            OnBoarding.init(isAuth: isSignedIn ?? false)
        }
    }
    
    var gradientBackground: some View {
        RadialGradient.init(
            colors: [.indigo, .purple ],
            center: .topLeading,
            startRadius: 0,
            endRadius: UIScreen.main.bounds.height
        )
    }
    
}

struct GradientScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
