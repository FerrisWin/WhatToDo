//
//  HeaderView.swift
//  ToDoList
//
//  Created by Felix Leon on 07/08/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
      
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                
               
                    
                
            }
            
            .padding(.top, 80)
            
            Image("WhatToDo")
                .resizable()
                .scaledToFit()
                .padding(.top, 275)
                .padding(.bottom, -50)
                .padding(.trailing,-5)
                .frame(width: 200, height: 420)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3
               , height: 350)
        .offset(y:-150)
        
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title", subtitle: "subtitle", angle: 15, background: .blue)
    }
}
