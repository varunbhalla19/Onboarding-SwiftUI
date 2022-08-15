//
//  ProfileCard.swift
//  Onboarding-SwiftUI
//
//  Created by varunbhalla19 on 15/08/22.
//

import SwiftUI

struct ProfileCard: View {
    
    let signOut: () -> Void
    let name: String
    let age: Int
    let gender: String
    
    var body: some View {
        
        HStack.init {
                Image.init(systemName: "person.circle.fill")
                    .resizable().scaledToFit().frame(width: 100, height: 100)
                    .foregroundColor(.white.opacity(3/5))
                    .onTapGesture {
                        signOut()
                    }

                VStack.init(spacing: 0) {
                    Text.init(name)
                        .foregroundColor(.white.opacity(4/5)).font(.largeTitle).fontWeight(.heavy)

                    HStack.init(alignment: .center) {
                        Text.init(String.init(age))
                            .foregroundColor(.white.opacity(3/5)).font(.title2).fontWeight(.medium)

                        Text.init(gender)
                            .foregroundColor(.white.opacity(3/4)).font(.headline)
                    }
                    .padding(.top)
                }
            }.padding().padding()
                .background(
                    LinearGradient.init(
                        colors: [.indigo, .purple], startPoint: .bottomTrailing, endPoint: .topLeading)
                )
                .cornerRadius(16)
                .shadow(radius: 8)
        

    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCard.init(signOut: {
            
        }, name: "Varun", age: 24, gender: "Male")
    }
}
