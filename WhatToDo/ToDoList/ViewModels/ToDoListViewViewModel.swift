//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//

import FirebaseFirestore
import Foundation

// ViewModel untuk single to do list item view (Per row dari list item)

class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        
        self.userId = userId
    }
    
    // Delete To Do List Item
    //Parameter id: item untuk dihapus
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
