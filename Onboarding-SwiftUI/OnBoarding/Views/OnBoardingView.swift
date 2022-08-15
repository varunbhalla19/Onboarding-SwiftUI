//
//  OnboardingView.swift
//  Onboarding-SwiftUI
//
//  Created by varunbhalla19 on 15/08/22.
//

import SwiftUI

struct OnBoarding: View {
    
    let isAuth: Bool
    
    @AppStorage("onboarding.name") var stored_name: String?
    @AppStorage("onboarding.age") var stored_age: Int?
    @AppStorage("onboarding.gender") var stored_gender: String?
    @AppStorage("onboarding.signin") var isSignedIn: Bool?

    
    @State var screenState: ScreenStates = .welcome
    @State var nameField: String = ""
    @State var ageField: Double = 18
    @State var gender: Genders = .male
        
    let slideTransition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    var body: some View {
        VStack.init {
            
                switch screenState {
                case .welcome:
                    welcomeSection
                        .transition(slideTransition)
                    spacer
                    bottomButton

                case .name:
                    nameSection
                        .transition(slideTransition)
                    spacer
                    bottomButton
                    
                case .age:
                    ageSection
                        .transition(slideTransition)
                    spacer
                    bottomButton
                
                case .gender:
                    genderSecion
                        .transition(slideTransition)
                    spacer
                    bottomButton
                    
                case .final:
                    bottomButton
                        .transition(slideTransition)
                    
                case .done:
                    profileCard.transition(
                        .opacity
                    )
            }
        }.onAppear {
            screenState = isAuth ? .done : .welcome
        }
    }
    
    private var spacer: some View {
        Spacer.init()
    }
    
    var bottomBtnText: String {
        switch screenState {
            case .welcome:
                return "Begin"
            case .name, .age, .gender:
                return "Next"
            case .done:
                return "Sign Out"
            case .final:
                return "Sign Me Up"
        }
    }
    
    private var bottomButton: some View {
        Button.init {
            goToNextState()
        } label: {
            Text.init(bottomBtnText)
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.vertical, 4)
                .background(.white)
                .foregroundColor(.purple)
                .font(.headline)
                .cornerRadius(16)
        }
        .padding()
        .disabled(screenState == .name && nameField.isEmpty)
    }
    
    private var welcomeSection: some View {
        Welcome.init()
    }
    
    private var nameSection: some View {
        VStack.init {
            spacer
            Name.init(nameField: $nameField)
            spacer
        }
        
    }
    
    private var ageSection: some View {
        VStack.init {
            spacer            
            Age.init(ageField: $ageField)
            spacer
        }
    }
    
    private var genderSecion: some View {
        VStack.init {
            spacer
            Gender.init(gender: $gender)
            spacer
        }
    }
    
    private var profileCard: some View {
        ProfileCard.init(signOut: {
            signOut()
        }, name: stored_name ?? "", age: stored_age ?? 0, gender: stored_gender ?? "")
    }

    

}

extension OnBoarding {
    
    func signOut(){
        stored_age = nil
        stored_name = nil
        stored_gender = nil
        
        nameField = ""
        gender = .male
        ageField = 18.0
        
        withAnimation(.spring()){
            screenState = .welcome
            isSignedIn = false
        }
    }
    
    func goToNextState() {
        let target: ScreenStates
        switch screenState {
        case .welcome:
            target = .name
        case .name:
            target = .age
        case .age:
            target = .gender
        case .gender:
            target = .final
        case .final:
            target = .done
        case .done:
            target = .welcome
        }
                
        withAnimation(.spring()) {
            screenState = target
        }
        
        if target == .done {
            stored_name = nameField
            stored_age = Int.init(ageField)
            stored_gender = gender.rawValue
            isSignedIn = true
        }

    }

    
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding.init(isAuth: false)
            .background(.gray)
    }
}
