//
//  TodoItemModel.swift
//  TodoList
//
//  Created by Yacine on 1/20/24.
//

import Foundation


struct TodoItemModel: Identifiable, Codable{
    let id:String
    let title: String
    let isCompleted: Bool
    let date: String
    let createdAt: String
    let updatedAt: String
    
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool, date:String, createdAt: String, updatedAt: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.date = date
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    
    func updateCompletion() -> TodoItemModel{
        return TodoItemModel(id: self.id, title: self.title, isCompleted: !self.isCompleted, date: self.date, createdAt: self.createdAt, updatedAt: Date.now.description)
    }
    
}
