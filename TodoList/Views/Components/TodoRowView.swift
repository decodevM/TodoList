//
//  TodoRowView.swift
//  TodoList
//
//  Created by Yacine on 1/19/24.
//

import SwiftUI

struct TodoRowView: View {
    let todoItem: TodoItemModel
    var body: some View {
        HStack{
            Image(systemName: todoItem.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todoItem.isCompleted ? .green : .gray)
            Text(todoItem.title)
                .strikethrough(todoItem.isCompleted)
                
                
                
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    TodoRowView(todoItem: TodoItemModel(title: "First item", isCompleted: false, date: Date.now.description, createdAt: Date.now.description, updatedAt: Date.now.description))
        .previewLayout(.sizeThatFits)
}
#Preview {
    TodoRowView(todoItem: TodoItemModel(title: "First item", isCompleted: true, date: Date.now.description, createdAt: Date.now.description, updatedAt: Date.now.description))
        .previewLayout(.sizeThatFits)
}
