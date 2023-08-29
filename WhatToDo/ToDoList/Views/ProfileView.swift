//
//  ProfileView.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    //Avatar
                    profile(user: user)
                } else {
                    Text ("Loading Profile...")
                }
                
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        
        // Info
        VStack(alignment: .leading){
            
            HStack{
                Text("Full Name: ")
                    .bold()
                    .font(.title3)
                Text("Ferris Leroy Winata")
                    .font(.title3)
            }
            .padding()
            
            HStack{
                Text("Date of Birth: ")
                    .bold()
                    .font(.title3)
                Text("14/11/2003")
                    .font(.title3)
            }
            .padding()
            
            HStack {
                Text("Member Since: ")
                    .font(.title3)
                    .bold()
                Text("3 January 2022")
                    .font(.title3)
            }
            .padding()
            
        }
        .padding()
        
        //Sign out
        Button (action:{
            //Action
            viewModel.logout()
        })
        {
            Text("Log Out")
                .font(.title2).foregroundColor(.white)
                .bold()
                .frame(width: 150, height: 50, alignment: .center)
            
            
        }
        .background(Color.teal)
        .buttonStyle(PlainButtonStyle())
        .cornerRadius(5)
        .tint(.red)
        .padding()
        
        
        Spacer()
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
