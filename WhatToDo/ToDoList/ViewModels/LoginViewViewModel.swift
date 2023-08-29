//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        
        guard validate() else {
            return
        }
        
        //Try to log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
   private func validate() -> Bool {
       
       errorMessage = ""
       
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
             !password.trimmingCharacters(in: .whitespaces).isEmpty else {
           errorMessage = "Fill in all fields!"
           return false
       }
       
       guard email.contains("@") && email.contains(".") else {
           errorMessage = "Please enter in a correct form!"
           return false
       }
       
       return true

        
    }
    
}
