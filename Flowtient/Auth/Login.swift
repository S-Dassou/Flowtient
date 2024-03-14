//
//  Login.swift
//  Flowtient
//
//  Created by shafique dassu on 14/03/2024.
//

import SwiftUI

struct Login: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var navigateToHomePage = false
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .foregroundColor(.black)
                .frame(height: 50)
                .background(.clear)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .foregroundColor(.black)
                .frame(height: 50)
                .background(.clear)
                .padding(.horizontal)
            
            PrimaryButton(title: "Log in") {
                if email == "shaf@gmail.com", password == "Password" {
                    navigateToHomePage = true
                }
            }
        }
        .navigationDestination(isPresented: $navigateToHomePage) {
            
        }
    }
}

#Preview {
    Login()
}
