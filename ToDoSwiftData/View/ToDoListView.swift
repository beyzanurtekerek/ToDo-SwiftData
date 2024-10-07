//
//  ToDoListView.swift
//  ToDoSwiftData
//
//  Created by Beyza Nur Tekerek on 7.10.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    let toDos: [ToDo]
    @Environment(\.modelContext) private var context
    
      
    
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                NavigationLink(value: toDo) {
                    HStack {
                        Text(toDo.name)
                        Spacer()
                        Text(toDo.priority.description)
                    }
                }
                
            }.onDelete(perform: { IndexSet in
                IndexSet.forEach { index in
                    let toDo = toDos[index]
                    context.delete(toDo)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    
                }
            })
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDoDetailsScreen(toDo: toDo)
        }
    }
}

#Preview {
    ToDoListView(toDos: [ToDo(name: "Test", priority: 123)]).modelContainer(for: [ToDo.self])
}
