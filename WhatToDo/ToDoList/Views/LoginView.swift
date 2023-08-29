//
//  LoginView.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//

import SwiftUI

struct LoginView: View {
    
    
 @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack{
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 17.7, background: .teal)
                
                
                // Login Form
                
            Form {
                
                TextField("Email Address", text: $viewModel.email)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLButton(title: "Log In", background: .blue)
                {
                    viewModel.login()
                    
                }
                .padding()
                
                }
            .offset(y: -50)
                
                
                // Create Account
                VStack{
                    Text("New Around Here?")
                   
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
