//
//  RegisterView.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "Register", subtitle: "Start plan your activities", angle: -17.7, background: .yellow)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
            
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green)
                {
                    //Registration
                    viewModel.register()
                    
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
            VStack{
                
                Text("Already have an account?")
               
                NavigationLink("Log in", destination: LoginView())
            }
               
            }
            .padding(.bottom, 50)
            Spacer()
        }
        
        
        
    }


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
