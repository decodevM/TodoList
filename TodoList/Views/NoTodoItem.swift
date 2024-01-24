//
//  NoTodoItem.swift
//  TodoList
//
//  Created by Yacine on 1/23/24.
//

import SwiftUI

struct NoTodoItem: View {
    
    @State private var animate: Bool = false
    let secondaryAccentColor: Color = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button to add a bunch of items to your todo list!")
//                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddTodoView()) {
                    Text("Add your first todo 🥳")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background( animate ? secondaryAccentColor : Color.accentColor)
                        .clipShape(.buttonBorder)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius: 30, x: 0, y: 50)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -10 : 0)
            }
            .frame(maxWidth: 400)
            
            .multilineTextAlignment(.center)
            .padding()
            .padding(.vertical, 40)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .onAppear(perform: setAnimation)
        
    }
    
    private func setAnimation(){
        guard !animate else{ return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            withAnimation(.easeInOut(duration: 1.5).repeatForever()){
                animate.toggle()
            }
        })
    }
}

#Preview {
    NavigationView{
        NoTodoItem()
            .navigationTitle("Todo List")
    }
}
