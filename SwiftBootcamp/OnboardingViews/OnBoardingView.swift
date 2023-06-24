//
//  OnBoardingView.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 07.06.2023.
//

import SwiftUI



struct OnBoardingView: View {
    
    // Onboarding States:
    /*
     0 - Welcome Screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    // oboarding inputs
    @State var onBoardingState: Int = 0
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = "Female"
    // alerts
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    // App Storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    //MARK: BODY
    var body: some View {
        ZStack {
            //content
            ZStack {
                switch onBoardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
            //buttons
            VStack {
                Spacer()
                bottomButton
            }
        }
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
    

}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(Color.purple)
    }
}

// MARK: COMPONENTS
extension OnBoardingView {
    private var bottomButton: some View {
        Text(   onBoardingState == 0 ? "SIGN UP" :
                onBoardingState == 3 ? "FINISH" : "NEXT")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .padding(30)
            .animation(nil, value: ValueTransformer())
            .onTapGesture {
                handleNextButtonPress()
            }
    }
    private var welcomeSection: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 6)
                        .foregroundColor(.white)
                }
            Text("This is the number 1 app for finding you match online! In this tutorial we are practising using AppSrorage and other SwiftUI")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
    }
    
    private var addNameSection: some View {
            VStack(spacing: 20) {
                Spacer()
                Text("Whats your name")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                TextField("Your Name here...", text: $name)
                    .font(.headline)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    
                Spacer()
                Spacer()
            }
            .multilineTextAlignment(.center)
        }
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Whats your age")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
    }
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            //Spacer()
            Spacer(minLength: 120)
            
            Text("Whats your gender")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            HStack {
                
                Spacer()
                Text("Select a gender")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                Picker(selection: $gender) {
                    Text("Male").font(.headline).foregroundColor(.purple) .font(.headline).tag("Male")
                    Text("Female").font(.headline).foregroundColor(.purple).tag("Female")
                    Text("Non-Binary").font(.headline).foregroundColor(.purple).tag("Non-Binary")
                    } label: {
                        Text("Select a gender")
                            .font(.headline)
                            .foregroundColor(.purple)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)

                    }
                    //.tint(Color.purple)
                    
                    .pickerStyle(.wheel)
                Spacer()
            }
            .background(.white)
            .cornerRadius(25)
            .padding()
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
    }
    }
// MARK: FUNCTIONS
extension OnBoardingView {
   
    
    func handleNextButtonPress() {
        // CHECK INPUTS
        switch onBoardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 charachers long")
                return
            }
        default:
            break
        }
        
        
        // GO TO NEXT SECTION
        if onBoardingState == 3 {
            //sign in
            signIn()
        } else {
            withAnimation(.spring()) {
                onBoardingState += 1
            }
        }
        
    }
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }

    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}

