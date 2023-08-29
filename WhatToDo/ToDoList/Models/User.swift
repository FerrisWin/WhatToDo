//
//  User.swift
//  ToDoList
//
//  Created by Felix Leon on 29/07/23.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
