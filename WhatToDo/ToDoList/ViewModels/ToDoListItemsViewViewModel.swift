//
//  ToDoListItemsViewViewModel.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

    // View Model untuk list dari items view

class ToDoListItemViewViewModel: ObservableObject {

    init(){}
    
    func toggleIsDone(item: ToDoListItem) {
            var itemCopy = item
            itemCopy.setDone(item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
