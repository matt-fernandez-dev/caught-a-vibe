//
//  RegisterView.swift
//  caught-a-vibe
//
//  Created by Hunter Newton on 3/14/23.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject private var userManager = UserManager()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {

        VStack {
            Text("Sign Up")
                .font(Font.custom("DancingScript-Medium", size: 64))
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            TextField("First Name", text: $firstName)
                .frame(height: 32)
            TextField("Last Name", text: $lastName)
                .frame(height: 32)
            TextField("Email", text: $email)
                .frame(height: 32)
            SecureField("Password", text: $password)
                .frame(height: 32)
                .padding(.bottom, 20)
            Button(action: {
                userManager.signup(email: email, password: password, firstName: firstName, lastName: lastName, userEmail: email)
            }) {
                Text("Start vibin'")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.5))
                    .clipShape(Capsule())
                    .contentShape(Capsule())
            }
        }
        .padding()
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
