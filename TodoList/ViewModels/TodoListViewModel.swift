
//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Yacine on 1/20/24.
//

import Foundation


class TodoListViewModel: ObservableObject{
    
    @Published var todosItems:[TodoItemModel] = []{
        didSet{
            saveTodoItems()
        }
    }
    
    init() {
        getTodosItems()
    }
    
    func getTodosItems(){
        
        //        let newItems = [
        //            TodoItemModel(title: "This is the first todo!", isCompleted: false, date: Date.now.description, createdAt: Date.now.description, updatedAt: Date.now.description),
        //            TodoItemModel(title: "This is the second", isCompleted: false, date: Date.now.description, createdAt: Date.now.description, updatedAt: Date.now.description),
        //            TodoItemModel(title: "Third!", isCompleted: true, date: Date.now.description, createdAt: Date.now.description, updatedAt: Date.now.description),
        //        ]
        //        todosItems.append(contentsOf: newItems)
        
        guard
            let encodedData = UserDefaults.standard.data(forKey: "todos_items"),
            let savedTodoItems = try? JSONDecoder().decode([TodoItemModel].self, from: encodedData)
        else{ return }
        
        print(encodedData)
        todosItems = savedTodoItems
    }
    
    
    
    
    func addNewTodoItem(title: String, date: String = Date.now.description){
        let newTodo = TodoItemModel(title: title, isCompleted: false,date: date, createdAt: Date.now.description, updatedAt: Date.now.description)
        todosItems.append(newTodo)
    }
    
    func moveTodoItem(fromOffsets: IndexSet, toOffset: Int){
        self.todosItems.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    func updateTodoItem(todoItem: TodoItemModel){
        let index = todosItems.firstIndex(where: {$0.id == todoItem.id})
        
        if index == nil{
            return
        }
        
        let updatedTodoItem = todoItem.updateCompletion()
        
        todosItems[index!] = updatedTodoItem
        
        todosItems.remove(at: index!)
        
        if updatedTodoItem.isCompleted{
            todosItems.append(updatedTodoItem)
        }else{
            todosItems.insert(updatedTodoItem, at: 0)
        }
    }
    
    func deleteTodoItem(indexSet: IndexSet){
        self.todosItems.remove(atOffsets: indexSet)
    }
    
    
    func saveTodoItems(){
        guard let encodedData = try? JSONEncoder().encode(todosItems) else{ return }
        UserDefaults.standard.setValue(encodedData, forKey: "todos_items")
    }
    
    
}
