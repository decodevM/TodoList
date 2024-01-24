//
//  StartView.swift
//  TodoList
//
//  Created by Yacine on 1/19/24.
//

import SwiftUI

struct StartView: View {
    @StateObject var todoListViewModel: TodoListViewModel = TodoListViewModel()
    var body: some View {
        NavigationView{
            TodoListView()
        }
        .environmentObject(todoListViewModel)
    }
}

#Preview {
    StartView()
}
