//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel  = ToDoListItemViewViewModel()
    
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack (alignment: .leading)
            {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle" : "checkmark.circle.fill")
                    .foregroundColor(Color.green)
            }

            
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemsView(item: .init(
            id: "123",
            title: "Jogging Sore",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false))
    }
}
