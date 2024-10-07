//
//  ListScreen.swift
//  ToDoSwiftData
//
//  Created by Beyza Nur Tekerek on 7.10.2024.
//

import SwiftUI
import SwiftData

struct ListScreen: View {
    
    @Query(sort: \ToDo.name, order: .forward) private var toDos : [ToDo]
    @State private var isAddToDoPresented : Bool = false
    
    var body: some View {

            ToDoListView(toDos: toDos)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        isAddToDoPresented = true
                    }
                }
            }).sheet(isPresented: $isAddToDoPresented, content: {
                NavigationStack {
                    AddToDoScreen()
                }
            })

    }
}

#Preview {
    NavigationStack {
        ListScreen().modelContainer(for: [ToDo.self])
    }
}
