//
//  AddTodoView.swift
//  TodoList
//
//  Created by Yacine on 1/19/24.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoListViewModel: TodoListViewModel
    
    @State var textFieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal,10)
                    .frame(height: 55)
                    .background(Color(.systemGray6))
                    .clipShape(.buttonBorder)
                
                Button(
                    action: onSave,
                    label: {
                        Text("Save".uppercased())
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .clipShape(.buttonBorder)
                    })
                
            }
            .alert(isPresented: $showAlert, content: getAlert)
            .padding(14)
        }
        .navigationTitle("Add Todo")
    }
    
    func onSave(){
        
        if isTextFieldValidate(text: textFieldText) {
            todoListViewModel.addNewTodoItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
        
    }
    
    private func isTextFieldValidate(text: String) -> Bool{
        if text.count < 4 {
            alertTitle = "Your new todo item must be at least 4 characters long!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    private func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView{
        AddTodoView()
    }
    .environmentObject(TodoListViewModel())
}
