//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
        @StateObject var viewModel : ToDoListViewViewModel
        @FirestoreQuery var items: [ToDoListItem]
 
        init(userId : String) {
            //users/<id>/todos/<entries>
            self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    
            self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId)
            )
    
        }
    
    
    var body: some View {
        NavigationView{
            VStack{
            }
                            List (items) { item in
                                ToDoListItemsView(item: item)
                                    .swipeActions {
                                        Button("Delete"){
                                            viewModel.delete(id: item.id)
                                        }
                                        .tint(.red)
            
                                    }
                            }
                            .listStyle(PlainListStyle())
                        }
                        .navigationTitle("To Do List")
                        .toolbar {
            
                            Button {
                                // Action
                                viewModel.showingNewItemView = true
                            } label: {
                                Image(systemName: "plus")
                            }
            
                        }
                    .sheet(isPresented:$viewModel.showingNewItemView)
                        {
                            NewItemView(newItemPresented: $viewModel.showingNewItemView)
            
                        }
                    }
            
            
            
            
         
        }
    

    
    struct ToDoListView_Previews: PreviewProvider {
        static var previews: some View {
            //      ToDoListView(userId: "")
            ToDoListView(userId: "")
        }
    }

