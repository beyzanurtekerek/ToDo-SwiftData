//
//  ToDoDetailsScreen.swift
//  ToDoSwiftData
//
//  Created by Beyza Nur Tekerek on 7.10.2024.
//

import SwiftUI

struct ToDoDetailsScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var priority: Int?
    
    let toDo : ToDo
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Priority", value: $priority, format: .number)
            Button("Update") {
                
                guard let priority = priority else { return }
                toDo.name = name
                toDo.priority = priority
                
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                
                dismiss()
            }
        }.onAppear(perform: {
            name = toDo.name
            priority = toDo.priority
        })
    }
}

//#Preview {
//    ToDoDetailsScreen()
//}
