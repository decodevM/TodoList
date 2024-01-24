//
//  TodoListView.swift
//  TodoList
//
//  Created by Yacine on 1/19/24.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var todoListViewModel: TodoListViewModel
    
    var body: some View {
        ZStack {
            if todoListViewModel.todosItems.isEmpty {
                NoTodoItem()
                    .transition(.opacity.animation(.easeInOut))
            }else{
                List{
                    ForEach(todoListViewModel.todosItems) { todo in
                        TodoRowView(todoItem: todo)
                            .onTapGesture {
                                withAnimation(.linear){
                                    todoListViewModel.updateTodoItem(todoItem: todo)
                                }
                            }
                    }
                    .onDelete(perform: todoListViewModel.deleteTodoItem)
                    .onMove(perform: todoListViewModel.moveTodoItem)
                }
            }
        }
        .navigationTitle("Todo List")
        .toolbar {
            if !todoListViewModel.todosItems.isEmpty{
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                addNewItem()
            }
        }
        
    }
    
    
    func addNewItem(text: String = "") -> some View{
        NavigationLink {
            AddTodoView()
        } label: {
            Image(systemName: "plus")
            if !text.isEmpty{
                Text(text)
            }
        }
    }
    
}

#Preview {
    NavigationView{
        TodoListView()
    }
    .environmentObject(TodoListViewModel())
}
