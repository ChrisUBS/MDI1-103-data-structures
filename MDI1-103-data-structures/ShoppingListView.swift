//
//  ShoppingListView.swift
//  MDI1-103-data-structures
//
//  Created by Christian Bonilla on 8/26/25.
//

import SwiftUI

struct ShoppingListView: View {
    @State private var items: [String] = ["Eggs", "Apples"]
    @State private var newItem: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // List of items
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                }

                // Add-new-item bar
                HStack(spacing: 8) {
                    TextField("Add new shopping item…", text: $newItem)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                        .onSubmit(addItem)

                    Button {
                        addItem()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                    .disabled(newItem.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()
            }
            .navigationTitle(Text("Shopping List"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Sort A → Z", action: sortAZ)
                        Button("Reverse Order", action: reverseOrder)
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                    .accessibilityLabel("More actions")
                }
            }
            .tint(.blue)
            .navigationTitle(Text("Shopping List"))
        }
    }
    
    private func addItem() {
        let trimmed = newItem.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        items.append(trimmed)
        newItem = ""
    }
    
    private func sortAZ() {
        items = items.sorted()
    }

    private func reverseOrder() {
        items.reverse()
    }
}

#Preview {
    ShoppingListView()
}
